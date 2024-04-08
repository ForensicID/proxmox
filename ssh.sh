#!/bin/bash

# Global Variable
port="2004"

echo Installing/Checking packages from list
apt install -y ssh
sleep 10

echo Change configuration from /etc/ssh/sshd_config
sed -i "s/#Port 22/Port $port/g" /etc/ssh/sshd_config
sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
sed -i "s/#Banner none/Banner /etc/ssh/banner/g" /etc/ssh/sshd_config
sleep 0.5
