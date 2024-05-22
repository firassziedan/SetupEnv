sudo add-apt-repository ppa:lazygit-team/release;\
sudo add-apt-repository ppa:git-core/ppa;\
sudo apt update;\
sudo apt upgrade -y;\
sudo apt install vim links lynx git diffutils htop curl wget p7zip-full unzip zip zsh fonts-powerline xclip clipit lazygit chromium-browser synapse -y;

#oh-my-zsh
cd ~; \
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh; \
sh install.sh;

sudo chmod -R 777 .zsh_history .oh-my-zsh;\
sudo chown -R $(whoami) .zsh_history .oh-my-zsh;\
cd .oh-my-zsh;\
git config core.fileMode false;
zsh; compaudit | xargs chmod g-w,o-w;


#install apache
sudo apt update ;\
sudo apt-get install apache2 -y;\
sudo apache2ctl configtest;


#php
sudo apt-get install software-properties-common;\
sudo add-apt-repository ppa:ondrej/php;\
sudo apt-get update;\
sudo apt-get install -y php php7.3

#php 7.3
sudo apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages \
php7.3-cli php7.3-dev \
php7.3-pgsql php7.3-sqlite3 php7.3-gd \
php7.3-curl php7.3-memcached \
php7.3-imap php7.3-mysql php7.3-mbstring \
php7.3-xml php7.3-zip php7.3-bcmath php7.3-soap \
php7.3-intl php7.3-readline php-xdebug php-pear php7.3-fpm;\
libapache2-mod-php7.3 php7.3-common php7.3-xmlrpc php7.3-gd;\
sudo service apache2 restart;

#php 7.4
sudo apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages \
php7.4-cli php7.4-dev \
php7.4-pgsql php7.4-sqlite3 php7.4-gd \
php7.4-curl php7.4-memcached \
php7.4-imap php7.4-mysql php7.4-mbstring \
php7.4-xml php7.4-zip php7.4-bcmath php7.4-soap \
php7.4-intl php7.4-readline php-xdebug php-pear php7.4-fpm;\
libapache2-mod-php7.4 php7.4-common php7.4-xmlrpc php7.4-gd;\
sudo service apache2 restart;

#php 8
sudo apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages \
php-cli php-dev \
php-pgsql php-sqlite3 php-gd \
php-curl php-memcached \
php-imap php-mysql php-mbstring \
php-xml php-zip php-bcmath php-soap \
php-intl php-readline php-xdebug php-pear php-fpm;\
libapache2-mod-php php-common php-xmlrpc php-gd;\
sudo service apache2 restart;

#Change php version
sudo a2enmod php7.4
### dismod 
# sudo a2dismod php7.3
sudo update-alternatives --set php /usr/bin/php7.4;

# [xdebug]
# zend_extension="/etc/php/7.3/mods-available/xdebug.so"
# xdebug.remote_autostart=0
# xdebug.remote_enable=1
# xdebug.remote_handler="dbgp"
# xdebug.remote_host="127.0.0.1"
# xdebug.remote_connect_back=1
# xdebug.remote_port=9000
# xdebug.remote_mode=req
# xdebug.idekey="netbeans-xdebug"

# make sure important apache modules are enabled
sudo a2enmod headers rewrite env mime expires ssl;\
sudo service apache2 restart ;

#enable autoindex
sudo a2dismod autoindex;\
sudo systemctl restart apache2;

#Content-Encoding Gzip
sudo a2enmod deflate;

sudo vim /etc/apache2/apache2.conf

## Add this lines 
<IfModule mod_deflate.c>
    AddOutputFilterByType DEFLATE text/html
    AddOutputFilterByType DEFLATE text/css
    AddOutputFilterByType DEFLATE text/javascript
    AddOutputFilterByType DEFLATE application/javascript
    AddOutputFilterByType DEFLATE application/json
</IfModule>

sudo service apache2 restart


#mysql
sudo apt update ;\
sudo apt-get install mysql-server -y ;\
sudo ufw allow mysql ;\
sudo apt update ;\
sudo apt upgrade -y;

### OR
#mariadb
sudo apt-get install mariadb-server;

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
  
  #MySql 8 
  #mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
  #mysql> FLUSH PRIVILEGES;
  #mysql> exit;

  
  #For mysql 8
  #sudo mysql -uroot;
  #mysql> use mysql ;
  # UPDATE mysql.user SET authentication_string=null WHERE User='root';
  # flush privileges;
  # ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
  # flush privileges;


# Set Up a Node.js Application
cd ~;\
sudo curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - ;\
sudo apt install nodejs -y; \
sudo apt install build-essential;\
sudo apt-get install gcc g++ make;\
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -;\
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list; \
sudo apt-get update && sudo apt-get install yarn;

## Installing PM2
sudo npm install pm2@latest -g;

# Install less + grunt + sass + less-each
sudo npm install -g less grunt grunt-cli sass gulp-less lessc-each gulp-cli;
#sudo chown -R $USER:$(id -gn $USER) ~/.config
 
# Install composer
sudo curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer --version=1.10.17;

# Drush install latest (9.x)
sudo git clone https://github.com/drush-ops/drush.git /usr/local/src/drush;\
cd /usr/local/src/drush;\
sudo git checkout 9.7.2;\
sudo ln -s /usr/local/src/drush/drush /usr/bin/drush;\
sudo composer install;\
sudo chown -R $(whoami) /usr/local/src/drush;\
sudo chmod -R 777 /usr/local/src/drush;\
git config core.fileMode false;

#config
echo fs.inotify.max_user_watches=10524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p;
echo "alias lg='lazygit'" >> ~/.zshrc;

#java
sudo apt install default-jre -y;\
sudo apt install default-jdk -y;

sudo update-alternatives --config java;
sudo update-alternatives --config javac;
  #add java path to environment file
  #sudo nano /etc/environment;
  #add this line
  #JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/bin/"
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
sudo apt-get update;\
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y;\
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - ;\
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y;\
sudo apt-get update;\
sudo apt-get install docker-ce -y;\
sudo usermod -aG docker $USER;\
sudo chmod 666 /var/run/docker.sock;

#Lando
cd ~;\
wget https://files.devwithlando.io/lando-stable.deb ; sudo dpkg -i lando-stable.deb;
