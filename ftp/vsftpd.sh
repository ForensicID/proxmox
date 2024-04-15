#!/bin/bash

echo Installing/Checking packages from vsftpd
apt install vsftpd -y
sleep 0.5

if chmod 600 /etc/ssl/private/vsftpd.key; then
  echo "Change mode key for vsftpd .."
  sleep 0.5
else
  echo "Cant Change mode key for vsftpd .."
  sleep 0.5
fi

if chmod 600 /etc/ssl/private/vsftpd.crt; then
  echo "Change mode cert for vsftpd .."
  sleep 0.5
else
  echo "Cant Change mode cert for vsftpd .."
  sleep 0.5
fi

if cp /etc/vsftpd.conf /etc/vsftpd.conf.orig; then
  echo "Copying file original vsftpd .."
  sleep 0.5
else
  echo "Cant Copying file original vsftpd .."
  sleep 0.5
fi

echo Change configuration from /etc/vsftpd.conf
sed -i "s/listen=NO/listen=YES/g" /etc/vsftpd.conf
sed -i "s/listen_ipv6=YES/listen_ipv6=NO/g" /etc/vsftpd.conf
sed -i '15i\listen_port=2022' /etc/vsftpd.conf
sed -i "s/#write_enable=YES/write_enable=YES/g" /etc/vsftpd.conf
sed -i "s/#chroot_local_user=YES/chroot_local_user=YES/g" /etc/vsftpd.conf
sed -i "s/ssl_enable=NO/ssl_enable=YES/g" /etc/vsftpd.conf
sed -i '153i\force_local_data_ssl=YES' /etc/vsftpd.conf
sed -i '154i\force_local_logins_ssl=YES' /etc/vsftpd.conf
sed -i '155i\ssl_tlsv1=YES' /etc/vsftpd.conf
sed -i '156i\ssl_sslv2=NO' /etc/vsftpd.conf
sed -i '157i\ssl_sslv3=NO' /etc/vsftpd.conf
sed -i '158i\require_ssl_reuse=NO' /etc/vsftpd.conf
sed -i '159i\ssl_ciphers=HIGH' /etc/vsftpd.conf
sleep 2

echo Restarting service vsftpd...
systemctl restart vsftpd.service
sleep 0.5

echo Status service vsftpd...
systemctl status vsftpd.service
sleep 0.5
