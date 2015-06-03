#!/bin/bash

set -u
set -e

# Change the IP to our Dockerfile IP. 
if [ "$LOGSTASH_IP"  != "127.0.0.1" ]; then
    sed -i 's|127.0.0.1|'$LOGSTASH_IP'|g' /etc/logstash/logstash-forwarder.conf
fi

# Change the PORT to our Dockerfile LOGSTASH_PORT. 
if [ "LOGSTASH_PORT"  != "9876" ]; then
    sed -i 's|9876|'$LOGSTASH_PORT'|g' /etc/logstash/logstash-forwarder.conf
fi

# Execute the command to start logstash forwarder
/opt/logstash-forwarder/logstash-forwarder -config /etc/logstash/logstash-forwarder.conf
