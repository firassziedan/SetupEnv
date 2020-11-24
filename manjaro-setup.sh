sudo pacman -Syu;\
sudo pacman -S zsh vim code;

#oh-my-zsh
cd ~; \
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install apache
sudo pacman -S apache;\
sudo systemctl enable httpd;\
sudo systemctl restart httpd;
####
# root dir sudo /srv/http/
#
# restart apache > sudo systemctl restart httpd
####

#install Mysql (MariaDB)
sudo pacman -S mysql;\
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql;\
sudo systemctl enable mysqld;\
sudo systemctl start mysqld;

#install Php
sudo pacman -S php php-apache
####
# open php config file
# > sudo vim  /etc/httpd/conf/httpd.conf
#
# Comment this line:
# #LoadModule mpm_event_module modules/mod_mpm_event.so
#
#  Copy and paste these lines to the bottom of the httpd.conf file:
#
#       LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
#       LoadModule php7_module modules/libphp7.so
#       AddHandler php7-script php
#       Include conf/extra/php7_module.conf
#
####