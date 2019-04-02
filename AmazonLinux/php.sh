#!/bin/bash

curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

sudo yum update
sudo yum install -y php72-cli php72-common php72-devel php72-mysqlnd php72-pdo php72-xml php72-gd php72-intl php72-mbstring php72-mcrypt php72-opcache php72-pecl-apcu php72-pecl-imagick php72-pecl-memcached php72-pecl-redis php72-pecl-xdebug


sudo unlink /usr/bin/php
sudo ln -s /etc/alternatives/php7 /usr/bin/php