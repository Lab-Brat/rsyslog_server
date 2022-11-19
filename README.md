### Rsyslog Server
#### Info
rsyslog server with TLS encryption.  
CA and self-signed certificates are created using Ansible and [templates](https://www.rsyslog.com/doc/v8-stable/tutorials/tls_cert_script.html).  
More info about the container:
```
Name: rsyslog
Image: rsyslog_server
Ports: 5144 tcp
Storage: /var/log/log_storage
```

#### Provision
`vagrant` directory contains a `Vagrant` file that sets up a test environment.  
Test environment contains 1 server and 1 client based on AlmaLinux, and it was tested on VirtualBox.  
To set it up, navigate to the directory and run:
```
cd vagrant
vagrant up
```

#### Add server
If it's the first time installation, `ca.pem` has to be created to sign self-signed certificates.  
It can be done together with the server setup:
```
ansible-playbook main.yaml -t cert -t server --limit servers --extra-vars '{"new_CA": true}'
```

#### Add client
To configure a client, add it's IP address to `inventory.ini`, and then run:
```
ansible-playbook main.yaml -t cert -t client --limit clients
```
After it's done, check `/var/log/log_storage` directory on the server, a new folder will be created with the same name as the client's hostname.  
