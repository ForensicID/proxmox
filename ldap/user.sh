#! /bin/bash
for i in {1..10};
do
   if [ $i -eq 10 ];
   then
        echo "dn: uid=vpnuser10,cn=vpn,ou=VPN,dc=lksjogja1,dc=lan" >> vpnuser.ldif
        echo "objectClass: inetOrgPerson" >> vpnuser.ldif
        echo "objectClass: posixAccount" >> vpnuser.ldif
        echo "objectClass: shadowAccount" >> vpnuser.ldif
        echo "uid: vpnuser10" >> vpnuser.ldif
        echo "sn: vpn10" >> vpnuser.ldif
        echo "givenName: vpnuser10" >> vpnuser.ldif
        echo "cn: vpnuser10" >> vpnuser.ldif
        echo "displayName: vpnuser10" >> vpnuser.ldif
        echo "uidNumber: 2010" >> vpnuser.ldif
        echo "gidNumber: 2000" >> vpnuser.ldif
        echo "userPassword: Skill1" >> vpnuser.ldif
        echo "gecos: vpnuser10" >> vpnuser.ldif
        echo "loginShell: /bin/bash" >> vpnuser.ldif
        echo "homeDirectory: /home/vpnuser$i" >> vpnuser.ldif
        echo "" >> vpnuser.ldif
   else
        echo "dn: uid=vpnuser$i,cn=vpn,ou=VPN,dc=lksjogja1,dc=lan" >> vpnuser.ldif
        echo "objectClass: inetOrgPerson" >> vpnuser.ldif
        echo "objectClass: posixAccount" >> vpnuser.ldif
        echo "objectClass: shadowAccount" >> vpnuser.ldif
        echo "uid: vpnuser$i" >> vpnuser.ldif
        echo "sn: vpn$i" >> vpnuser.ldif
        echo "givenName: vpnuser$i" >> vpnuser.ldif
        echo "cn: vpnuser$i" >> vpnuser.ldif
        echo "displayName: vpnuser$i" >> vpnuser.ldif
        echo "uidNumber: 200$i" >> vpnuser.ldif
        echo "gidNumber: 2000" >> vpnuser.ldif
        echo "userPassword: Skill1" >> vpnuser.ldif
        echo "gecos: vpnuser$i" >> vpnuser.ldif
        echo "loginShell: /bin/bash" >> vpnuser.ldif
        echo "homeDirectory: /home/vpnuser$i" >> vpnuser.ldif
        echo "" >> vpnuser.ldif
   fi
done
