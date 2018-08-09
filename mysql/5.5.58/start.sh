#!/bin/bash

/usr/local/mysql/scripts/mysql_install_db --user=mysql --basedir=/usr/local/mysql --datadir=/var/lib/mysql

chown -R root /usr/local/mysql

chown -R mysql /var/lib/mysql

mysqld --user=mysql

