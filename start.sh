#!/bin/sh

#Uruchomienie MySQL
/usr/bin/mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
/usr/bin/mysqld_safe &
#opóźnienie
sleep 10

# Uruchomienie nginx
nginx -g "daemon off;"
