#!/bin/bash
file=/opt/dist/deployed.done
if [ ! -f $file ] ; then
  while [ ! -f /var/www/html/wp-config.php ]; do sleep 1; done
  sleep 2
  

  apt-get update
  apt-get install nano

  mv /var/wp-config.php /var/www/html/wp-config.php
  
  mkdir /opt/dist/
  touch /opt/dist/deployed.done
  #service apache2 start
  #tail -f /var/log/dpkg.log  
fi
