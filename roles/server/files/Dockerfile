FROM almalinux:latest

# install rsyslog
RUN dnf -y -q update
RUN dnf install -y -q rsyslog rsyslog-gnutls gnutls gnutls-utils ca-certificates

# copy configuration file and entry scripts
COPY Docker/rsyslog.conf /etc/rsyslog.conf
COPY Docker/entrypoint.sh /opt/entrypoint.sh
 
# create a directory to store logs
RUN mkdir /var/log/log_storage

# run rsyslog
ENTRYPOINT ["/bin/bash", "/opt/entrypoint.sh"]
