#!/bin/bash


[ -d /var/run/sshd ] || mkdir /var/run/sshd

if [ ! -r /root/authorized_keys2 ] ;
then
    echo "FataLYou must mount /root/authorized_keys2 as a volume"
    exit 1
fi

mkdir /root/.ssh/
cp /root/authorized_keys2 /root/.ssh/
chown -R root:root /root/.ssh
chmod 500 /root/.ssh
chmod 400 /root/.ssh/authorized_keys2

exec /usr/sbin/sshd -D -e 
