#!/bin/bash

# Install dependencies
#apt-get update
#apt-get install -y apache2 mariadb-server libapache2-mod-php
#### apt install -y software-properties-common
#### add-apt-repository -y ppa:ondrej/php
apt update
#### apt-get install -y apache2 mariadb-server libapache2-mod-php7.3
#### apt-get install -y php7.3 php7.3-gd php7.3-json php7.3-mysql php7.3-curl php7.3-mbstring
#### apt-get install -y php7.3-intl php7.3-imagick php7.3-xml php7.3-zip
#apt-get install -y php-gd php-json php-mysql php-curl php-mbstring
#apt-get install -y php-intl php-imagick php-xml php-zip
sudo apt-get install -y apache2 php zip libapache2-mod-php php-gd php-json php-mysql php-curl php-mbstring php-intl php-imagick php-xml php-zip php-mysql php-bcmath php-gmp zip
# Download and unpack Nextcloud
wget https://download.nextcloud.com/server/releases/latest.tar.bz2
tar -xjf latest.tar.bz2
