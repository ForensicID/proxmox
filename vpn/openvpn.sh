#!/bin/bash

echo Installing/Checking packages from openvpn & easy-rsa
apt install openvpn easy-rsa -y
sleep 5

if cp -R /usr/share/easy-rsa/ /etc/openvpn/; then
  echo "Copying file easy rsa to openvpn .."
  sleep 0.5
else
  echo "Cant Copying file easy rsa to openvpn .."
  sleep 0.5
fi

if cp -R /etc/openvpn/easy-rsa/vars.example /etc/openvpn/easy-rsa/vars; then
  echo "Copying directory vars.example to vars .."
  sleep 0.5
else
  echo "Cant Copying directory vars.example to vars .."
  sleep 0.5
fi

if cp -R named.conf.local /etc/bind/; then
  echo "named.conf.local has been copied.."
  sleep 0.5
else
  echo "Cant copied named.conf.local"
  sleep 0.5
fi
