#!/bin/bash

# setup ls mysql
sudo service mysqld stop
sudo yum -y erase mysql-config mysql55-server mysql55-libs mysql55
sudo yum -y install mysql57-server mysql57

# setup apache2
sudo yum remove -y httpd* php*
sudo yum update -y
sudo yum install -y httpd24 php72 php72-cli php72-fpm php72-gd php72-common php72-devel php72-mysqlnd php72-pdo php72-xml php72-gd php72-intl php72-mbstring php72-mcrypt php72-opcache php72-pecl-apcu php72-pecl-imagick php72-pecl-memcached php72-pecl-redis php72-pecl-xdebug
sudo alternatives --set php /usr/bin/php-7.2 
sudo service httpd start
# sudo chkconfig httpd on

curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
