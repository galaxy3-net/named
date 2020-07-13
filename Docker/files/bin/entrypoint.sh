#!/bin/sh

exec >> /var/log/entrypoint/entrypoint.log
exec 2>&1

service named start
#service squid start
#/usr/local/squid/sbin/squid --foreground -d 0

tail -f /dev/null
