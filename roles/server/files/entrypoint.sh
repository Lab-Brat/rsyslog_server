#!/bin/bash
# install CA certificate
update-ca-trust force-enable
cp /opt/rsyslog_certs/ca.pem /etc/pki/ca-trust/source/anchors/
update-ca-trust extract

# launch rsyslog
rsyslogd -n
