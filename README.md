# ansible-easyrsa

easy-rsa is a CLI utility to build and manage a PKI CA. In laymen's terms, this means to create a root certificate authority, and request and sign certificates, including sub-CAs and certificate revokation lists (CRL).

More information about easy-rsa can be found here:
[https://github.com/OpenVPN/easy-rsa](https://github.com/OpenVPN/easy-rsa)

This role installs easy-rsa and creates a root certificate authority and generates the server certificate together with a given list of client certificates. This will be done with the version 3.x of easy-rsa. Though not recommended all certificates are created on the same server, which might be sufficient for small installation like this.

## Role Variables

A complete configuration file can be found on GitHub:
[https://github.com/OpenVPN/easy-rsa/blob/master/easyrsa3/vars.example](https://github.com/OpenVPN/easy-rsa/blob/master/easyrsa3/vars.example)

Actually not all configuration options / attributes can be used. Only a small subset can be set with the Ansible variables

    easyrsa_version: "3.0.1"
    easyrsa_dest: "/usr/share/easy-rsa"

    easyrsa_dn: "cn_only"
    easyrsa_req_country: "US"
    easyrsa_req_province: "California"
    easyrsa_req_city: "San Francisco"
    easyrsa_req_org: "Copyleft Certificate Co"
    easyrsa_req_email: "me@example.net"
    easyrsa_req_ou: "My Organizational Unit"

    easyrsa_keysize: 2048
    easyrsa_digest: "sha256"

    easyrsa_clients:
      - name: client1

## Dependencies

There are no dependencies to other roles. If you want to run the test, you need to install [Docker](https://www.docker.com/).

## Example Playbook

An example playbook is included in the `test.yml` file. You can use `run.sh` for running a test locally, which starts a docker container as the target.

    - hosts: all
      roles:
         - role: ansible-easyrsa

## Contributions and Feedback

Any contributions are welcome. For any bugs or feature requests, please open an issue through [Github](https://github.com/pbonrad/ansible-easyrsa/issues).

## License

MIT

## Author Information

Peter Bonrad - [pbonrad](https://github.com/pbonrad) - 2016
