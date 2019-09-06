#!/bin/bash
# Check Open port based on haproxy conf
HAPROXY_PORTS=$(grep "bind " /etc/haproxy/haproxy.cfg | sed 's/:/ /g' | awk '{print $3}')

STATUS=0

for port in $HAPROXY_PORTS; do
  netstat -nlt | grep -q $port
  [ $? -ne 0 ] && STATUS=1
done 

exit $STATUS
