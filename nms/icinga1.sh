#!/bin/bash

echo Restarting service icinga2
systemctl restart icinga2.service
sleep 1

echo Installing/Checking packages from icingaweb2
apt install icingaweb2 libapache2-mod-php icingacli -y
sleep 1

if sed -i "s/;date.timezone =/date.timezone = Asia/Jakarta/g" /etc/php/7.4/apache2/php.ini; then
  echo "Change time in php.ini .."
  sleep 0.5
else
  echo "Cant Change time in php.ini .."
  sleep 0.5
fi

echo Create token authentication from icingaweb
icingacli setup token create
sleep 1

echo This is your token
icingacli setup token show
sleep 1

echo http://[domain-name-or-ip-address]/icingaweb2/setup
