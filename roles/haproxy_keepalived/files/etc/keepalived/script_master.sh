
echo "# $0 #" >> /tmp/script_mst.log
#md5old=$(md5sum /etc/haproxy/haproxy.cfg)
cat /etc/haproxy/haproxy_public.cfg /etc/haproxy/haproxy_private.cfg > /etc/haproxy/haproxy.cfg
#md5new=$(md5sum /etc/haproxy/haproxy.cfg)

#if [ "$md5old" != "$md5new" ]; then 
  service haproxy restart
  if [ $? -eq 0 ]; then 
    echo "# START HAPROXY PUB OK #" >> /tmp/script_mst.log
    STATUS=0
  else
    echo "# START HAPROXY PUB KO #" >> /tmp/script_mst.log
    STATUS=1
  fi
#fi

exit $STATUS
