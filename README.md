
# How to Use

## choose your Environment 
For now only for AmazonLinux
- git clone https://github.com/keisukefunatsu/cloud9-dev-scripts.git
- cd cloud9-dev-scripts
- cd AmazonLinux

## Install All packages
- bash init.sh

## Install Basic useful packages
- bash basic.sh

## Ruby on Rails
- `bash rails.sh`
- `rails server` to start serve at localhost

## PHP
- `bash php.sh`
- `bin/cake server -H $IP -p $PORT` to start CakePHP
- `php artisan serve --host=$IP --port=$PORT` to start Laravel

## Apache
- Copy `httpd.conf` to your apache2 configuration file

- `sudo service restart httpd2`
- `mkdir public ~/environment`
- `sudo chmod 755 ~/environment/public`