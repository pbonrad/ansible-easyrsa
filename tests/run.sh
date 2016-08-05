#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

__DIR__="$(cd "$(dirname "${0}")"; echo $(pwd))"
__BASE__="$(basename "${0}")"
__FILE__="${__DIR__}/${__BASE__}"

echo "################################"
echo "Build Information"
echo "Directory: ${__DIR__}"
echo "Filename: ${__FILE__}"
echo "Version Information:"
echo "Ansible Version: $(ansible --version)"
echo "Ansible Playbook Version: $(ansible-playbook --version)"
echo "Docker Version: $(docker --version)"
echo "Operating System: $(lsb_release -d | awk -F: '{ print $2 }' | tr -d '\t')"
echo "Kernel: $(uname -a)"
echo "################################"

DISTRIBUTION=ubuntu-16.04

echo "### Start docker hosts"
echo "Distribution: $DISTRIBUTION"
docker run -td --privileged --name ansible-$DISTRIBUTION pbonrad/ansible-docker-base:$DISTRIBUTION

echo "### Starting tests"
echo "ansible-$DISTRIBUTION ansible_connection=docker" > tests/inventory
ansible-playbook -i tests/inventory tests/test.yml --syntax-check
ansible-playbook -i tests/inventory tests/test.yml

echo "### Clean up"
docker stop ansible-$DISTRIBUTION
docker rm ansible-$DISTRIBUTION
rm tests/inventory
