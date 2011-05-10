# /etc/rc.conf

    apache22_enable="YES"
    mongod_enable="YES"
    
# /usr/local/etc/apache22/httpd.conf

    ServerRoot "/usr/local"
    Listen 80
    LoadModule passenger_module /usr/local/rvm/gems/ruby-1.9.2-p180@global/gems/passenger-3.0.7/ext/apache2/mod_passenger.so
    PassengerRoot /usr/local/rvm/gems/ruby-1.9.2-p180@global/gems/passenger-3.0.7
    PassengerRuby /usr/local/rvm/wrappers/ruby-1.9.2-p180@global/ruby

# /usr/local/etc/apache22/extra/httpd-vhosts.conf

    <VirtualHost *:80>
        ServerAdmin benchun@false-profit.com
        DocumentRoot "/www/toastunes/public"
        ServerName tunes.false-profit.com
        ErrorLog "/var/log/httpd/tunes.false-profit.com/error_log"
        CustomLog "/var/log/httpd/tunes.false-profit.com/access_log" common
        <Directory /www/toastunes/public>
            Allow from all
            Options -MultiViews
        </Directory>
    </VirtualHost>

    <Directory "/www/toastunes">
        Options FollowSymLinks
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>
