#!/bin/bash

# Created by
#    ____
#   / __ \ _ __ ___ __  __ _____   _ _   _
#  / / _` | '_ ` _ \\ \/ /|_  / | | | | | |
# | | (_| | | | | | |>  <  / /| |_| | |_| |
#  \ \__,_|_| |_| |_/_/\_\/___|\__, |\__, |
#   \____/                      __/ | __/ |
#                              |___/ |___/


# Global Variable
dir=lks # Directory on Bind File
name1=forward # Name of your domain without TLD
name2=reverse # Name of your domain without TLD
domain=lksjogja20.lan # Domain aja
ip=172.63.20.3 # IP of Main Domain

pkg="bind dnsutils"
pkg_true=$(dpkg-query -W --showformat='${Status}\n' $pkg | grep "install ok installed")
echo Checking for $pkg: $pkg_true
if [ "" = "$pkg_true" ]; then
  echo "No $pkg. Setting up $pkg."
  sudo apt-get --yes install $pkg
fi


# Copy Forward Zone File
if cp -R /etc/bind/db.local /etc/bind/lks.$name1; then
  echo "DB Local has been copied.."
  sleep 0.5
else
  echo "File exist or i dont know"
  sleep 0.5
fi

# Copy Reverse Zone File
if cp -R /etc/bind/db.127 /etc/bind/lks.$name2; then
  echo "DB Rev has been copied.."
  sleep 0.5
else
  echo "File exist or i dont know"
  sleep 0.5
fi

# Copy Reverse Zone File
if cp -R /etc/bind/db.127 /etc/bind/lks.$name2.172; then
  echo "DB Rev has been copied.."
  sleep 0.5
else
  echo "File exist or i dont know"
  sleep 0.5
fi


# Change Localhost to Domain
if sed -i s/localhost/$domain/g /etc/bind/lks.$name1; then
  echo "Forward File Localhost Changed to $domain .."
  sleep 0.5
else
  echo "Error, Check your db.$name1"
  sleep 0.5
fi

if sed -i s/localhost/$domain/g /etc/bind/lks.$name2; then
  echo "Reverse File Localhost Changed to $domain .."
  sleep 0.5
else
  echo "Error, Check your lks.$name2"
  sleep 0.5
fi

if sed -i s/localhost/$domain/g /etc/bind/lks.$name2.172; then
  echo "Reverse File Localhost Changed to $domain .."
  sleep 0.5
else  echo "Error, Check your lks.$name2.172"
  sleep 0.5
fi


# Change Forward Zone IP Address
if sed -i s/127.0.0.1/$ip/g /etc/bind/lks.$name1; then
  echo "Localhost Changed to $domain .."
  sleep 0.5
else
  echo "Error, Check your db.$name"
  sleep 0.5
fi

# Copy named.conf.local
if mv /proxmox/DNS/named.conf.local /etc/bind/named.conf.local; then
  echo "named.conf.local has been moved.."
  sleep 0.5
else
  echo "File exist or i dont know"
  sleep 0.5
fi
