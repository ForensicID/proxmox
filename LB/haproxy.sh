#!/bin/bash

echo Installing/Checking packages from haproxy
apt install haproxy -y
sleep 5

if cp -R /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.bak; then
  echo "Backup file /etc/haproxy/haproxy.cfg .."
  sleep 0.5
else
  echo "Cant backup /etc/haproxy/haproxy.cfg .."
  sleep 0.5
fi
