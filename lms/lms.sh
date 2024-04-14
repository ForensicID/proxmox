#!/bin/bash

echo Updating packages
apt update
sleep 0.5

if apt install software-properties-common -y; then
  echo "Installing package for add repository .."
  sleep 0.5
else
  echo "Cant Installing package for add repository .."
  sleep 0.5
fi

if add-apt-repository ppa:ondrej/php; then
  echo "Adding repository for php .."
  sleep 0.5
else
  echo "Cant Adding repository for php .."
  sleep 0.5
fi

if apt install php8.3 php8.3-{fpm,common,mbstring,xmlrpc,soap,gd,xml,intl,mysql,cli,mcrypt,ldap,zip,curl,pgsql} -y; then
  echo "Installing packages php and plugin .."
  sleep 0.5
else
  echo "Cant Installing packages php and plugin .."
  sleep 0.5
fi

if php -v; then
  echo "Checking php version .."
  sleep 0.5
else
  echo "Cant Checking php version .."
  sleep 0.5
fi

echo Change configuration from /etc/postgresql/14/main/postgresql.conf
sed -i "s/;max_input_vars = 1000/max_input_vars = 5000/g" /etc/php/8.3/fpm/php.ini
sed -i "s/;extension=ldap/extension=ldap/g" /etc/php/8.3/fpm/php.ini
sed -i "s/;extension=curl/extension=curl/g" /etc/php/8.3/fpm/php.ini
sed -i "s/;extension=intl/extension=intl/g" /etc/php/8.3/fpm/php.ini
sed -i "s/;extension=imap/extension=imap/g" /etc/php/8.3/fpm/php.ini
sed -i "s/;extension=mbstring/extension=mbstring/g" /etc/php/8.3/fpm/php.ini
sed -i "s/;extension=openssl/extension=openssl/g" /etc/php/8.3/fpm/php.ini
sed -i "s/;extension=zip/extension=zip/g" /etc/php/8.3/fpm/php.ini
sleep 2

if systemctl restart php8.3-fpm.service; then
  echo "Restarting php service .."
  sleep 0.5
else
  echo "Cant Restarting php service .."
  sleep 0.5
fi

if wget https://packaging.moodle.org/stable403/moodle-4.3.3.tgz; then
  echo "Installation package for moodle .."
  sleep 0.5
else
  echo "Cant Install package for moodle .."
  sleep 0.5
fi

if tar -zxvf moodle-4.3.3.tgz; then
  echo "Extracted moodle package .."
  sleep 0.5
else
  echo "Cant Extract moodle package .."
  sleep 0.5
fi

if mv moodle /var/www/html/; then
  echo "Moved moodle to /var/www/html/ .."
  sleep 0.5
else
  echo "Cant Moved moodle to /var/www/html/ .."
  sleep 0.5
fi

if mkdir /var/www/html/moodledata; then
  echo "Created folder moodledata .."
  sleep 0.5
else
  echo "Cant Created folder moodledata .."
  sleep 0.5
fi

if chown -R www-data:www-data /var/www/html/moodle/; then
  echo "Change owner from moodle .."
  sleep 0.5
else
  echo "Cant Change owner from moodle .."
  sleep 0.5
fi

if chmod -R 755 /var/www/html/moodle/; then
  echo "Change mode from moodle .."
  sleep 0.5
else
  echo "Cant Change mode from moodle .."
  sleep 0.5
fi

if chown -R www-data:www-data /var/www/html/moodledata; then
  echo "Change owner from moodledata .."
  sleep 0.5
else
  echo "Cant Change owner from moodledata .."
  sleep 0.5
fi

if chmod -R 755 /var/www/html/moodledata; then
  echo "Change mode from moodledata .."
  sleep 0.5
else
  echo "Cant Change mode from moodledata .."
  sleep 0.5
fi

if apt install nginx -y; then
  echo "Installing package nginx .."
  sleep 0.5
else
  echo "Cant Installing package nginx .."
  sleep 0.5
fi

if cp -R moodle.conf /etc/nginx/sites-available/; then
  echo "Copying configuration moodle to nginx .."
  sleep 0.5
else
  echo "Cant Copying configuration moodle to nginx .."
  sleep 0.5
fi

if ln -s /etc/nginx/sites-available/moodle.conf /etc/nginx/sites-enabled/; then
  echo "Enabling site moodle.conf .."
  sleep 0.5
else
  echo "Cant Enabling site moodle.conf .."
  sleep 0.5
fi

if mv /etc/nginx/sites-enabled/default /home/; then
  echo "Moved to backup default conf nginx .."
  sleep 0.5
else
  echo "Cant Moved to backup default conf nginx .."
  sleep 0.5
fi

if nginx -t; then
  echo "Checking nginx configuration .."
  sleep 0.5
else
  echo "Cant Checking nginx configuration .."
  sleep 0.5
fi

if systemctl restart nginx.service; then
  echo "Restarting nginx service .."
  sleep 0.5
else
  echo "Restarting nginx service .."
  sleep 0.5
fi

echo INSTALLING MOODLE DONE...
