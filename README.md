Ansible Transmission
====================

Setup a simple Transmission bit torrent server with an NGINX reverse proxy for
HTTPS connections to the web interface. The server certificate and transmission
password are set in an encrypted vault.

Requirements
------------

To get started with a real server you should copy the testing inventory file to
add your own server configuration information.

#### packages
- `vagrant`
- `ruby`
- `bundler`
- `ansible`

Variables
---------

The file `group_vars/servers` should include the following variables within an
Ansible vault YAML file:

1. `transmission_password`
2. `ssl_crt`
3. `ssl_key`

Specifying SSL certificates can be done in YAML like

```yaml
ssl_crt: |
  -----BEGIN CERTIFICATE-----
  mycertificatehere...
  -----END CERTIFICATE-----
```

Testing
-------

Integration specs run with serverspec and require vagrant for the local testing
environment. To run all tests including cluster integration tests run the
following:

```bash
1. vagrant up
2. bundle exec rake spec
```
