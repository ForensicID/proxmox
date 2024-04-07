#!/bin/bash

echo Set timezone to Asia/Jakarta
timedatectl set-timezone Asia/Jakarta
sleep 0.5

echo Installing/Checking packages from list
apt install chrony -y
sleep 0.5

echo Installing/Checking packages from list
cp chrony.conf
sleep 0.5

systemctl restart chronyd

nano /etc/systemd/timesyncd.conf
systemctl restart systemd-timesyncd
