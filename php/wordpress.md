# install

## set up virtual hosts

    see technotes/apache/virtual_hosts.md

## enable php in apache

    see technotes/apache/httpd.conf.md
    
## copy and fix php.ini

copy default
 
    sudo cp /etc/php.ini.default /etc/php.ini
    sudo chmod +w /etc/php.ini
    sudo emacs /etc/php.ini
    
change /var/mysql/mysql.sock to /tmp/mysql.sock
    
    pdo_mysql.default_socket=/tmp/mysql.sock
    mysql.default_socket = /tmp/mysql.sock
    mysqli.default_socket = /tmp/mysql.sock
    
## copy php files

into /Library/WebServer/Documents/drtoast.com

## load database

mysql toastwp -u smp -p < /Users/jamesreynolds/Dropbox/Sites/drtoast.com/toastwp.sql

change site url in db for development:

    UPDATE wp_options SET option_value = "http://drtoast" WHERE option_name = "home" OR option_name = "siteurl"

## edit wp-config.php

## run install script

http://drtoast/wp-admin/install.php

## install wordpress-importer

* copy wordpress-importer folder into plugins dir
* enable plugin
* upload posts

## configure akismet 

add api key

## edit .htaccess 

add rewrite rules

