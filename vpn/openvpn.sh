#!/bin/bash

# Global Variable
domain="lksjogja25.lan"

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

echo Edit file vars ...
sed -i "s/#set_var EASYRSA        "${0%/*}"/set_var EASYRSA "$PWD"/g" /etc/openvpn/easy-rsa/vars
sed -i "s/#set_var EASYRSA_PKI            "$PWD/pki"/set_var EASYRSA_PKI             "$PWD/pki"/g" /etc/openvpn/easy-rsa/vars
sed -i "s/#set_var EASYRSA_DN     "cn_only"/set_var EASYRSA_DN      "cn_only"/g" /etc/openvpn/easy-rsa/vars
sed -i "s/#set_var EASYRSA_REQ_COUNTRY    "US"/set_var EASYRSA_REQ_COUNTRY     "ID"/g" /etc/openvpn/easy-rsa/vars
sed -i "s/#set_var EASYRSA_REQ_PROVINCE   "California"/set_var EASYRSA_REQ_PROVINCE    "DIY"/g" /etc/openvpn/easy-rsa/vars
sed -i "s/#set_var EASYRSA_REQ_CITY       "San Francisco"/set_var EASYRSA_REQ_CITY        "Kota Yogyakarta"/g" /etc/openvpn/easy-rsa/vars
sed -i "s/#set_var EASYRSA_REQ_ORG        "Copyleft Certificate Co"/set_var EASYRSA_REQ_ORG         "SMKN 2 Yogyakarta"/g" /etc/openvpn/easy-rsa/vars
sed -i "s/#set_var EASYRSA_REQ_EMAIL      "me@example.net"/set_var EASYRSA_REQ_EMAIL       "admin@mail.$domain"/g" /etc/openvpn/easy-rsa/vars
sed -i "s/#set_var EASYRSA_REQ_OU         "My Organizational Unit"/set_var EASYRSA_REQ_OU          "vpn.$domain"/g" /etc/openvpn/easy-rsa/vars
sed -i "s/#set_var EASYRSA_KEY_SIZE       2048/set_var EASYRSA_KEY_SIZE        2048/g" /etc/openvpn/easy-rsa/vars
sed -i "s/#set_var EASYRSA_ALGO           rsa/set_var EASYRSA_ALGO            rsa/g" /etc/openvpn/easy-rsa/vars
sed -i "s/#set_var EASYRSA_CA_EXPIRE      3650/set_var EASYRSA_CA_EXPIRE       3650/g" /etc/openvpn/easy-rsa/vars
sed -i "s/#set_var EASYRSA_CERT_EXPIRE    825/set_var EASYRSA_CERT_EXPIRE     825/g" /etc/openvpn/easy-rsa/vars
sed -i "s/#set_var EASYRSA_NS_SUPPORT     "no"/set_var EASYRSA_NS_SUPPORT     "no"/g" /etc/openvpn/easy-rsa/vars
sed -i "s/#set_var EASYRSA_EXT_DIR        "$EASYRSA/x509-types"/set_var EASYRSA_EXT_DIR "$EASYRSA/x509-types"/g" /etc/openvpn/easy-rsa/vars
sed -i "s/#set_var EASYRSA_SSL_CONF       "$EASYRSA/openssl-easyrsa.cnf"/set_var EASYRSA_SSL_CONF        "$EASYRSA/openssl-easyrsa.cnf"/g" /etc/openvpn/easy-rsa/vars
sed -i "s/#set_var EASYRSA_DIGEST         "sha256"/set_var EASYRSA_DIGEST          "sha256"/g" /etc/openvpn/easy-rsa/vars
echo Edited successfull ...
sleep 2

if sed -i "s/#set_var EASYRSA        "${0%/*}"/set_var EASYRSA "$PWD"/g" /etc/openvpn/easy-rsa/vars; then
  echo "named.conf.local has been copied.."
  sleep 0.5
else
  echo "Cant copied named.conf.local"
  sleep 0.5
fi
