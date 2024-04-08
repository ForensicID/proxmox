#!/bin/bash

# Global Variable
name1="named.conf.local"
name2="lks.forward"
name3="lks.reverse"
name4="named.conf.options"

echo Installing/Checking packages from list
apt install -y bind9 dnsutils
sleep 10

if cp /etc/bind/$name1 /etc/bind/$name1.bak; then
  echo "Backup file $name1 .."
  sleep 0.5
else
  echo "Cant backup $name1 .."
  sleep 0.5
fi

if rm -rf /etc/bind/$name1; then
  echo "Remove $name1.."
  sleep 0.5
else
  echo "Cant remove.."
  sleep 0.5
fi

if cp -R $name1 /etc/bind/; then
  echo "$name1 has been copied.."
  sleep 0.5
else
  echo "Cant copied $name1"
  sleep 0.5
fi

if cp -R $name2 /etc/bind/; then
  echo "$name2 has been copied.."
  sleep 0.5
else
  echo "Cant copied $name2 .."
  sleep 0.5
fi

if cp -R $name3 /etc/bind/; then
  echo "$name3 has been copied.."
  sleep 0.5
else
  echo "Cant copied $name3 .."
  sleep 0.5
fi

if cp /etc/bind/$name4 /etc/bind/$name4.bak; then
  echo "Backup file $name4 .."
  sleep 0.5
else
  echo "Cant backup $name4 .."
  sleep 0.5
fi

if rm -rf /etc/bind/$name4; then
  echo "Remove $name4 .."
  sleep 0.5
else
  echo "Cant remove.."
  sleep 0.5
fi

if cp -R $name4 /etc/bind/; then
  echo "$name4 has been copied.."
  sleep 0.5
else
  echo "Cant copied $name4 .."
  sleep 0.5
fi

echo Restarting named .....
sudo service named restart
sleep 3

echo checking conf  .....
sudo named-checkconf
sleep 2

echo INSTALLING DNS DONE...
