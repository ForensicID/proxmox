#!/bin/bash

# Global Varibale
username="gladiator25"

echo Installing/Checking packages from samba ..
apt install samba -y
sleep 1

if cp -R /etc/samba/smb.conf /etc/samba/smb.conf.bak; then
  echo "Backup file /etc/samba/smb.conf .."
  sleep 0.5
else
  echo "Cant backup /etc/samba/smb.conf .."
  sleep 0.5
fi

echo Change configuration from /etc/samba/smb.conf
echo [public] >> /etc/samba/smb.conf
echo #comment = Samba share directory >> /etc/samba/smb.conf
echo path = /home/gladiator20/public >> /etc/samba/smb.conf
echo read only = no >> /etc/samba/smb.conf
echo writable = yes >> /etc/samba/smb.conf
echo browseable = yes >> /etc/samba/smb.conf
echo guest ok = no >> /etc/samba/smb.conf
echo #valid users = @saraz >> /etc/samba/smb.conf
sleep 1

echo Checking configuration from samba ..
testparm
sleep 1

if sudo smbpasswd -a $username; then
  echo "Configure password from user $username .."
  sleep 0.5
else
  echo "Cant Configure password from user $username .."
  sleep 0.5
fi

if sudo smbpasswd -e $username; then
  echo "Enable password from user $username .."
  sleep 0.5
else
  echo "Cant Enable password from user $username .."
  sleep 0.5
fi

if systemctl restart smbd.service; then
  echo "Restarting samba service .."
  sleep 0.5
else
  echo "Cant Restarting samba service .."
  sleep 0.5
fi
