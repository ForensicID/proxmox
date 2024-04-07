#!/bin/bash

pkg = ["bind9", "dnsutils"]
file1 = named.conf.local
file2 = lks.forward
file3 = lks.reverse
file4 = named.conf.options

echo Installing/Checking packages from list
apt install -y "${pkg[@]}"
sleep 10

if cp /etc/bind/$file1 /etc/bind/$file1.bak; then
  echo "Backup file $file1 .."
  sleep 0.5
else
  echo "Cant backup $file1 .."
  sleep 0.5
fi

if rm -rf /etc/bind/$file1; then
  echo "Remove named.conf.local.."
  sleep 0.5
else
  echo "Cant remove.."
  sleep 0.5
fi

if cp -R $file1 /etc/bind/; then
  echo "$file1 has been copied.."
  sleep 0.5
else
  echo "Cant copied $file1"
  sleep 0.5
fi

if cp -R $file2 /etc/bind/; then
  echo "$file2 has been copied.."
  sleep 0.5
else
  echo "Cant copied $file2 .."
  sleep 0.5
fi

if cp -R $file3 /etc/bind/; then
  echo "$file3 has been copied.."
  sleep 0.5
else
  echo "Cant copied $file3 .."
  sleep 0.5
fi

if cp /etc/bind/$file4 /etc/bind/$file4.bak; then
  echo "Backup file $file4 .."
  sleep 0.5
else
  echo "Cant backup $file4 .."
  sleep 0.5
fi

if rm -rf /etc/bind/$file4; then
  echo "Remove $file4 .."
  sleep 0.5
else
  echo "Cant remove.."
  sleep 0.5
fi

if cp -R $file4 /etc/bind/; then
  echo "$file4 has been copied.."
  sleep 0.5
else
  echo "Cant copied $file4 .."
  sleep 0.5
fi

echo Restarting bind .....
sudo systemctl restart bind9.service
sleep 3

echo Restarting named .....
sudo service named restart
sleep 3

echo checking conf  .....
sudo named-checkconf
sleep 2

echo INSTALLING DNS DONE...
