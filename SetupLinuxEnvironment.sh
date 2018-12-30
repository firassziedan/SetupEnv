sudo apt update;
sudo apt upgrade -y;
sudo apt install vim links lynx git diffutils htop curl wget p7zip-full unzip zip zsh fonts-powerline xclip -y;

#oh-my-zsh
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
sudo chsh -s /bin/zsh;

#install apache
sudo apt update ;
sudo apt-get install apache2 -y;
sudo apache2ctl configtest;

#php 5.6
add-apt-repository ppa:ondrej/php ;\
sudo apt-get update ;\
sudo apt install php5.6 php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml -y;\
sudo apt-get install php-pear -y ;\
sudo a2dismod php5.6 ;\
sudo apt install php5.6-cgi php5.6-cli php5.6-common php5.6-curl php5.6-gd php5.6-imap php5.6-intl php5.6-mysql php5.6-pspell php5.6-sqlite3 php5.6-tidy php5.6-opcache php5.6-json php5.6-bz2 php5.6-mcrypt php5.6-readline php5.6-xml php5.6-xmlrpc php5.6-enchant php5.6-xsl php-all-dev php5.6-zip -y; \
sudo service apache2 restart;

#php 7.1
sudo apt-get install php; \
sudo apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages \
php7.1-cli php7.1-dev \
php7.1-pgsql php7.1-sqlite3 php7.1-gd \
php7.1-curl php7.1-memcached \
php7.1-imap php7.1-mysql php7.1-mbstring \
php7.1-xml php7.1-zip php7.1-bcmath php7.1-soap \
php7.1-intl php7.1-readline php-xdebug php-pear php7.1-fpm;\
sudo apt install php7.1 libapache2-mod-php7.1 php7.1-common php7.1-mbstring php7.1-xmlrpc php7.1-soap php7.1-gd php7.1-xml php7.1-intl php7.1-mysql php7.1-cli php7.1-mcrypt php7.1-zip php7.1-curl ;\
sudo apt install php-pear php-fpm php-dev php-zip php-curl php-xmlrpc php-gd php-mysql php-mbstring php-xml libapache2-mod-php
sudo service apache2 restart;

#php 7.2
sudo apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages \
php7.1-cli php7.2-dev \
php7.2-pgsql php7.2-sqlite3 php7.2-gd \
php7.2-curl php7.2-memcached \
php7.2-imap php7.2-mysql php7.2-mbstring \
php7.2-xml php7.2-zip php7.2-bcmath php7.2-soap \
php7.2-intl php7.2-readline php-xdebug php-pear php7.2-fpm;\
sudo apt install php7.2 libapache2-mod-php7.2 php7.2-common php7.2-mbstring php7.2-xmlrpc php7.2-soap php7.2-gd php7.2-xml php7.2-intl php7.2-mysql php7.2-cli php7.2-zip php7.2-curl ;\
sudo apt-get install php-cli
sudo service apache2 restart;

#php 7.3
sudo apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages \
php7.3-cli php7.3-dev \
php7.3-pgsql php7.3-sqlite3 php7.3-gd \
php7.3-curl php7.3-memcached \
php7.3-imap php7.3-mysql php7.3-mbstring \
php7.3-xml php7.3-zip php7.3-bcmath php7.3-soap \
php7.3-intl php7.3-readline php-xdebug php-pear php7.3-fpm;\
sudo apt install php7.3 libapache2-mod-php7.3 php7.3-common php7.3-mbstring php7.3-xmlrpc php7.3-soap php7.3-gd php7.3-xml php7.3-intl php7.3-mysql php7.3-cli php7.3-zip php7.3-curl ;\
sudo apt-get install php-cli
sudo service apache2 restart;

#Change php version
sudo update-alternatives --set php /usr/bin/php7.2;

#Set some PHP CLI settings
sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.1/cli/php.ini; \
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.1/cli/php.ini; \
sudo sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.1/cli/php.ini; \
sudo sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.1/cli/php.ini; \
sudo service apache2 restart;

#php 7.2
sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.2/cli/php.ini; \
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.2/cli/php.ini; \
sudo sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.2/cli/php.ini; \
sudo sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.2/cli/php.ini; \
sudo service apache2 restart;

#Php 7.3
sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.3/cli/php.ini; \
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.3/cli/php.ini; \
sudo sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.3/cli/php.ini; \
sudo sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.3/cli/php.ini; \
sudo service apache2 restart;

#Setup some PHP-FPM options Php 7.1
sudo echo "xdebug.remote_enable = 1" >> /etc/php/7.1/mods-available/xdebug.ini;\
sudo echo "xdebug.remote_connect_back = 1" >> /etc/php/7.1/mods-available/xdebug.ini;\
sudo echo "xdebug.remote_port = 9000" >> /etc/php/7.1/mods-available/xdebug.ini;\
sudo echo "xdebug.max_nesting_level = 512" >> /etc/php/7.1/mods-available/xdebug.ini;\
sudo echo "opcache.revalidate_freq = 0" >> /etc/php/7.1/mods-available/opcache.ini;\
sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.1/fpm/php.ini;\
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.1/fpm/php.ini;\
sudo sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.1/fpm/php.ini;\
sudo sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.1/fpm/php.ini;\
sudo sed -i "s/upload_max_filesize = .*/upload_max_filesize = 100M/" /etc/php/7.1/fpm/php.ini;\
sudo sed -i "s/post_max_size = .*/post_max_size = 100M/" /etc/php/7.1/fpm/php.ini;\
sudo sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.1/fpm/php.ini;\
sudo printf "[openssl]\n" | tee -a /etc/php/7.1/fpm/php.ini;\
sudo printf "openssl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/7.1/fpm/php.ini;\
sudo printf "[curl]\n" | tee -a /etc/php/7.1/fpm/php.ini;\
sudo printf "curl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/7.1/fpm/php.ini;

#Setup some PHP-FPM options php 7.2
sudo echo "xdebug.remote_enable = 1" >> /etc/php/7.2/mods-available/xdebug.ini;\
sudo echo "xdebug.remote_connect_back = 1" >> /etc/php/7.2/mods-available/xdebug.ini;\
sudo echo "xdebug.remote_port = 9000" >> /etc/php/7.2/mods-available/xdebug.ini;\
sudo echo "xdebug.max_nesting_level = 512" >> /etc/php/7.2/mods-available/xdebug.ini;\
sudo echo "opcache.revalidate_freq = 0" >> /etc/php/7.2/mods-available/opcache.ini;\
sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.2/fpm/php.ini;\
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.2/fpm/php.ini;\
sudo sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.2/fpm/php.ini;\
sudo sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.2/fpm/php.ini;\
sudo sed -i "s/upload_max_filesize = .*/upload_max_filesize = 100M/" /etc/php/7.2/fpm/php.ini;\
sudo sed -i "s/post_max_size = .*/post_max_size = 100M/" /etc/php/7.2/fpm/php.ini;\
sudo sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.2/fpm/php.ini;\
sudo printf "[openssl]\n" | tee -a /etc/php/7.2/fpm/php.ini;\
sudo printf "openssl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/7.2/fpm/php.ini;\
sudo printf "[curl]\n" | tee -a /etc/php/7.2/fpm/php.ini;\
sudo printf "curl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/7.2/fpm/php.ini;

#Setup some PHP-FPM options Php 7.3
sudo echo "xdebug.remote_enable = 1" >> /etc/php/7.3/mods-available/xdebug.ini;\
sudo echo "xdebug.remote_connect_back = 1" >> /etc/php/7.3/mods-available/xdebug.ini;\
sudo echo "xdebug.remote_port = 9000" >> /etc/php/7.3/mods-available/xdebug.ini;\
sudo echo "xdebug.max_nesting_level = 512" >> /etc/php/7.3/mods-available/xdebug.ini;\
sudo echo "opcache.revalidate_freq = 0" >> /etc/php/7.3/mods-available/opcache.ini;\
sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.3/fpm/php.ini;\
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.3/fpm/php.ini;\
sudo sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.3/fpm/php.ini;\
sudo sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.3/fpm/php.ini;\
sudo sed -i "s/upload_max_filesize = .*/upload_max_filesize = 100M/" /etc/php/7.3/fpm/php.ini;\
sudo sed -i "s/post_max_size = .*/post_max_size = 100M/" /etc/php/7.3/fpm/php.ini;\
sudo sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.3/fpm/php.ini;\
sudo printf "[openssl]\n" | tee -a /etc/php/7.3/fpm/php.ini;\
sudo printf "openssl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/7.3/fpm/php.ini;\
sudo printf "[curl]\n" | tee -a /etc/php/7.3/fpm/php.ini;\
sudo printf "curl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/7.3/fpm/php.ini;

# make sure important apache modules are enabled
sudo a2enmod headers rewrite env mime expires ssl;\
sudo service apache2 restart ;


#mysql
sudo apt update ;
sudo apt-get install mysql-server -y ;
sudo ufw allow mysql ;
sudo apt update ;
sudo apt upgrade -y;
  #Access to mysql to chenage root user password
  #sudo mysql -uroot;
  #mysql> use mysql ;
  #mysql> select * from user \G ;
  #Change root use plugin form  auth_socket  TO mysql_native_password to accept new  password
  #mysql> UPDATE user SET  plugin ='mysql_native_password' WHERE User = 'root';
  #change user password
  #mysql> UPDATE user SET authentication_string = PASSWORD('root') WHERE User = 'root';
  #mysql> FLUSH PRIVILEGES;
  #mysql> exit;

# Install node js
sudo curl -sL https://deb.nodesource.com/setup | sudo bash - ; \
sudo apt install nodejs; \
sudo apt install build-essential;\
sudo apt update ;

######
# [source](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-ubuntu-18-04#step-3-%E2%80%94-installing-pm2)
######

# Set Up a Node.js Application
cd ~;\
curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh;\
#nano nodesource_setup.sh
sudo bash nodesource_setup.sh;\
sudo apt install nodejs;\
sudo apt install build-essential;

# Install node npm
sudo curl -L https://npmjs.com/install.sh | sudo sh ;


## Installing PM2
sudo npm install pm2@latest -g;


# Install less + grunt + sass + less-each
sudo apt install npm -y;\
sudo npm install -g less grunt grunt-cli;\
sudo npm install -g sass;\
npm install gulp-less;\
npm i lessc-each;

# Install composer
sudo curl -sS https://getcomposer.org/installer | sudo php; \
sudo mv composer.phar /usr/local/bin/composer; \
sudo ln -s /usr/local/bin/composer /usr/bin/composer;

# Drush install latest (9.x)
sudo git clone https://github.com/drush-ops/drush.git /usr/local/src/drush;\
cd /usr/local/src/drush;\
sudo git checkout 9.5.2;\
sudo ln -s /usr/local/src/drush/drush /usr/bin/drush;\
sudo composer install;

#java
sudo apt-get install default-jre -y ; \
sudo apt-get install default-jdk -y;\
sudo add-apt-repository ppa:webupd8team/java ;\
sudo apt-get update; \
sudo apt-get install oracle-java8-installer -y; \

  #add java path to environment file
  #sudo nano /etc/environment;
  #add this line
  #JAVA_HOME="/usr/lib/jvm/java-8-oracle"
  #source /etc/environment
  #echo $JAVA_HOME

  #Create ssh
  ssh-keygen -t rsa -b 4096;
    #copy the key
    #cat ~/.ssh/id_rsa.pub | xclip -sel clip

# Add it to git aliases:
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# Use "git lg" instead of "git log"
# git lg

#Docker
sudo apt-get update ;
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y;
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - ;
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y;
sudo apt-get update;
sudo apt-get install docker-ce -y;
#for testing
sudo docker run hello-world
