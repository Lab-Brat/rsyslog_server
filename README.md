### Rsyslog Server
#### Info
rsyslog server is in a custom (built from Dockerfile in the repo) Docker container.  
More info about the container:
```
Name: rsyslog
Image: rsyslog_server
Ports: 514 tcp mapped to host
Storage: /var/log/log_storage mounted from host
```

#### Install container
Server can be installed using Docker Compose:
```console
[vagrant@node0 ~]$ docker compose up -d
```

#### Add client
To add a client, add it's IP address or hostname to the `inventory` file and update credentials in `ansible.cfg`. 
Then run `client.yaml` playbook
```console
[vagrant@node0 ~]$ ansible-playbook clients.yaml
```
After it's done, check ```/var/log/log_storage``` directory on the host, a new folder will be created with the same name as the client's hostname.  
