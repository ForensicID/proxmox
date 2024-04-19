#!/bin/bash

#Jangan lupa buat certivicate dengan
echo sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem

#Variable
port="2022"

echo Installing/Checking packages from postgresql
apt install vsftpd -y
sleep 5

if cp -R /etc/vsftpd.conf /etc/vsftpd.conf.bak; then
  echo "Backup file /etc/vsftpd.conf .."
  sleep 0.5
else
  echo "Cant backup /etc/vsftpd.conf .."
  sleep 0.5
fi

echo Change configuration from /etc/postgresql/14/main/postgresql.conf
sed -i "s/listen=NO/listen=YES/g" /etc/vsftpd.conf
sed -i '15i\listen_port=$port' /etc/vsftpd.conf
sed -i "s/listen_ipv6=YES/listen_ipv6=NO/g" /etc/vsftpd.conf
sed -i "s/#write_enable=YES/write_enable=YES/g" /etc/vsftpd.conf
sed -i '150i\listen_port=2022' /etc/vsftpd.conf
sed -i "s/rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem/rsa_cert_file=/etc/ssl/private/vsftpd.pem/g" /etc/vsftpd.conf
sed -i "s/rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key/rsa_private_key_file=/etc/ssl/private/vsftpd.pem/g" /etc/vsftpd.conf
sed -i "s/ssl_enable=NO/ssl_enable=YES/g" /etc/vsftpd.conf
sed -i '153i\force_local_data_ssl=YES' /etc/vsftpd.conf
sed -i '154i\force_local_logins_ssl=YES' /etc/vsftpd.conf
sed -i '155i\ssl_tlsv1=YES' /etc/vsftpd.conf
sed -i '156i\ssl_sslv2=NO' /etc/vsftpd.conf
sed -i '157i\ssl_sslv3=NO' /etc/vsftpd.conf
sed -i '158i\require_ssl_reuse=NO' /etc/vsftpd.conf
sed -i '159i\ssl_ciphers=HIGH' /etc/vsftpd.conf
sed -i '160i\pasv_min_port=40000' /etc/vsftpd.conf
sed -i '161i\pasv_max_port=50000' /etc/vsftpd.conf
sleep 2

echo Installing/Checking packages from postgresql
systemctl restart vsftpd.service
sleep 5
