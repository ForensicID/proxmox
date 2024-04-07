#!/bin/bash

echo Set timezone to Asia/Jakarta
timedatectl set-timezone Asia/Jakarta
sleep 0.5

echo Installing/Checking packages from list
apt install chrony -y
sleep 0.5

if cp /etc/chrony/chrony.conf /etc/chrony/chrony.conf.bak; then
  echo "Backup file chrony.conf .."
  sleep 0.5
else
  echo "Cant backup chrony.conf .."
  sleep 0.5
fi

if rm -rf /etc/chrony/chrony.conf; then
  echo "Remove chrony.conf .."
  sleep 0.5
else
  echo "Cant remove.."
  sleep 0.5
fi

if cp -R chrony.conf /etc/chrony/; then
  echo "chrony.conf has been copied.."
  sleep 0.5
else
  echo "Cant copied chrony.conf .."
  sleep 0.5
fi

echo Restarting chrony...
systemctl restart chronyd
sleep 0.5

echo checking time...
chronyc sources
sleep 0.5
