#!/bin/bash

echo Installing/Checking packages from list
apt install -y bind9 dnsutils
sleep 10

if cp /etc/bind/named.conf.local /etc/bind/named.conf.local.bak; then
  echo "Backup file named.conf.local .."
  sleep 0.5
else
  echo "Cant backup named.conf.local .."
  sleep 0.5
fi

if rm -rf /etc/bind/named.conf.local; then
  echo "Remove named.conf.local.."
  sleep 0.5
else
  echo "Cant remove.."
  sleep 0.5
fi

if cp -R named.conf.local /etc/bind/; then
  echo "named.conf.local has been copied.."
  sleep 0.5
else
  echo "Cant copied named.conf.local"
  sleep 0.5
fi

if cp -R lks.forward /etc/bind/; then
  echo "lks.forward has been copied.."
  sleep 0.5
else
  echo "Cant copied lks.forward .."
  sleep 0.5
fi

if cp -R lks.reverse /etc/bind/; then
  echo "lks.reverse has been copied.."
  sleep 0.5
else
  echo "Cant copied lks.reverse .."
  sleep 0.5
fi

if cp /etc/bind/named.conf.options /etc/bind/named.conf.options.bak; then
  echo "Backup file named.conf.options .."
  sleep 0.5
else
  echo "Cant backup named.conf.options .."
  sleep 0.5
fi

if rm -rf /etc/bind/named.conf.options; then
  echo "Remove named.conf.options .."
  sleep 0.5
else
  echo "Cant remove.."
  sleep 0.5
fi

if cp -R named.conf.options /etc/bind/; then
  echo "named.conf.options has been copied.."
  sleep 0.5
else
  echo "Cant copied named.conf.options .."
  sleep 0.5
fi

echo Restarting named .....
sudo service named restart
sleep 3

echo checking conf  .....
sudo named-checkconf
sleep 2

echo INSTALLING DNS DONE...
