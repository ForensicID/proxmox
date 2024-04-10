#!/bin/bash

dbhost="127.0.0.1"
dbicinga2="icinga2"
dbicingaweb2="icingaweb2"
password="Skills39"

echo Installing/Checking packages for repository
apt install -y vim apt-transport-https wget gnupg
sleep 1

echo GET packages from repository
wget -O - https://packages.icinga.com/icinga.key | gpg --dearmor -o /usr/share/keyrings/icinga-archive-keyring.gpg
sleep 1

echo Installing/Checking packages from repository
. /etc/os-release; if [ ! -z ${UBUNTU_CODENAME+x} ]; then DIST="${UBUNTU_CODENAME}"; else DIST="$(lsb_release -c| awk '{print $2}')"; fi;  echo "deb [signed-by=/usr/share/keyrings/icinga-archive-keyring.gpg] https://packages.icinga.com/ubuntu icinga-${DIST} main" >  /etc/apt/sources.list.d/${DIST}-icinga.list
echo "deb-src [signed-by=/usr/share/keyrings/icinga-archive-keyring.gpg] https://packages.icinga.com/ubuntu icinga-${DIST} main" >>  /etc/apt/sources.list.d/${DIST}-icinga.list
sleep 1

echo UPDATE and Installing packages from repository
apt update && apt install icinga2 monitoring-plugins icinga2-ido-pgsql -y
sleep 2

if psql -h $dbhost -U $dbicinga2 -d $dbicinga2 < /usr/share/icinga2-ido-pgsql/schema/pgsql.sql; then
  echo "CONVERT DB .."
  sleep 0.5
else
  echo "Cant CONVERT DB .."
  sleep 0.5
fi
