#!/bin/bash

echo Installing/Checking packages from postgresql
apt install -y postgresql postgresql-contrib
sleep 5

echo Change configuration from /etc/postgresql/14/main/postgresql.conf
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/14/main/postgresql.conf
sleep 2

echo Change configuration from /etc/postgresql/14/main/pg_hba.conf
sed -i '97i\host    all             all             0.0.0.0/0               md5' /etc/postgresql/14/main/pg_hba.conf
sleep 2

echo Restarting postgresql...
systemctl restart postgresql.service
sleep 0.5

echo Statuses postgresql...
systemctl status postgresql.service
sleep 0.5
