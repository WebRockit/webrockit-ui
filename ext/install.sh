#!/bin/bash

# install some java, remove this if you have a better way (like puppet, chef)
yum -y install java-1.7.0-openjdk memcached

# This is an old style init script since it was developed against cent6.. 
# newer distros need to use the right init scheme 
cp ext/webrockit-ui.init /etc/init.d/webrockit-ui
mkdir /opt/webrockit-ui/logs
chmod 755 /etc/init.d/webrockit-ui
chkconfig webrockit-ui on
/etc/init.d/webrockit-ui restart
