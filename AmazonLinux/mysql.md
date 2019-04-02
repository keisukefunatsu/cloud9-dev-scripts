# How to use Mysql

sudo service mysqld start
sudo chkconfig mysqld on
create database dev default character set utf8 collate utf8_general_ci;

CREATE USER "app_cloud9"@"localhost" IDENTIFIED BY "app_cloud9_password";

GRANT ALL PRIVILEGES ON `app_cloud9`.* TO "app_cloud9"@"localhost";
FLUSH PRIVILEGES;