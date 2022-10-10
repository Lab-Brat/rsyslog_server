### Rsyslog Server
#### Info
rsyslog server is in a custom (built from Dockerfile in the repo) Docker container.  
More info about the container:
```
Name: rsyslog
Image: rsyslog_server
Ports: 514 tcp
Storage: /var/log/log_storage mounted from host
```

#### Add server
Server docker image can be installed with:
```console
ansilble-playbook main.yaml -t server --limit servers
```

#### Add client
To add a client: 
Then run `client.yaml` playbook
```console
ansilble-playbook main.yaml -t client --limit clients
```
After it's done, check ```/var/log/log_storage``` directory on the server, a new folder will be created with the same name as the client's hostname.  
