#!/bin/bash

# Global Variable
port="2004"

echo Installing/Checking packages from list
apt install -y ssh
sleep 0.5

if cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak; then
  echo "Copying banner ssh .."
  sleep 0.5
else
  echo "Cant Copying banner ssh .."
  sleep 0.5

echo Change configuration from /etc/ssh/sshd_config
sed -i "s/#Port 22/Port $port/g" /etc/ssh/sshd_config
sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
echo Banner /etc/ssh/banner >> /etc/ssh/sshd_config
sleep 0.5

if cp banner /etc/ssh/; then
  echo "Copying banner ssh .."
  sleep 0.5
else
  echo "Cant Copying banner ssh .."
  sleep 0.5

echo Restarting ssh...
systemctl restart ssh
sleep 2
