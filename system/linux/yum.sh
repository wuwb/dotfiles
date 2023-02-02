
adduser lanxi
passwd lanxi
visudo
# root ALL=(ALL) ALL

yum install screen
yum install gcc
yum install gcc-c++

sudo rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
sudo yum install nginx
sudo systemctl start nginx.service

# make nginx start on boot
sudo systemctl enable nginx.service

# How To Find Your Server's Public IP Address
ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'

yum install httpd
service httpd start

yum install mysql mysql-server
service mysqld start

# 修改密码
mysqladmin -u root -p password 12345678

yum install php
service httpd restart
# 访问网站地址查看是否成功
yum install php-mysql php-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlrpc php-mcrypt php-mbstring php-bcmath php-mhash libmcrypt libmcrypt-devel
service httpd restart

# 设置开机启动
chkconfig --levels 2345 httpd on
chkconfig --levels 2345 mysqld on

#screen命令

#在SSH断开的情况下，服务器端继续执行程序。

#screen -S test
#输入要执行的命令，enter
#Ctrl + a + d保存screen
#查看所有screen
#screen -ls
#恢复screen
#screen -r test
#退出screen
#exit


crontab命令

crontab [-u 用户名] [-elr]
#crontab -e
#分  时  日  月  周    [用户]  command
#每分钟执行一次第一个参数可以写成样 1-59 或者 */1
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7)  OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  *  command to be executed
