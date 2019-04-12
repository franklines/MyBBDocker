#!/bin/bash

# If MyBB zip file is not found & no index, begin installation process.
if [ ! -f /tmp/mybb.zip ] && [ ! -f /var/www/html/index.php];
then
    curl -o /tmp/mybb.zip -fSL https://resources.mybb.com/downloads/mybb_1820.zip;
    unzip /tmp/mybb.zip -d /var/www/html/;
    mv /var/www/html/Upload/* /var/www/html/;
    chown -R www-data. /var/www/html/*;
    rm -rfv /var/www/html/Upload;
    rm -rfv /var/www/html/Documentation;
    rm -rfv /tmp/mybb.zip;
fi

# Start Apache
/usr/sbin/apache2ctl -D FOREGROUND;

tail -F /var/log/apache2/access.log
