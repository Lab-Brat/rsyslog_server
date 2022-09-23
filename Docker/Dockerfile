FROM almalinux:latest

# install rsyslog
RUN dnf -y update
RUN dnf install -y rsyslog

# copy configuration file
COPY Docker/rsyslog.conf /etc/rsyslog.conf

# create a directory to store logs
RUN mkdir /var/log/log_storage

# run rsyslog
ENTRYPOINT ["rsyslogd", "-n"]