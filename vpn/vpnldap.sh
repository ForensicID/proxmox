apt install openvpn-auth-ldap
mkdir /etc/openvpn/auth
cp /usr/share/doc/openvpn-auth-ldap/examples/auth-ldap.conf /etc/openvpn/auth/
nano /etc/openvpn/auth/auth-ldap.conf
      URL             ldap://ldap.lksjogja1.lan
      BindDN          cn=admin,dc=lksjogja1,dc=lan
      Password        Skills39
      
      #TLSEnable      yes
      #TLSCACertFile  /usr/local/etc/ssl/ca.pem
      #TLSCACertDir   /etc/ssl/certs
      #TLSCertFile    /usr/local/etc/ssl/client-cert.pem
      #TLSKeyFile     /usr/local/etc/ssl/client-key.pem

      BaseDN          "ou=VPN,dc=lksjogja1,dc=lan"
      SearchFilter    "(&(uid=%u))"

      DISABLE GROUP

nano /etc/openvpn/server.conf
plugin /usr/lib/openvpn/openvpn-auth-ldap.so /etc/openvpn/auth/auth-ldap.conf

nano /etc/openvpn/client/client.ovpn
auth-user-pass

systemctl restart openvpn@server
