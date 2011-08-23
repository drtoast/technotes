# Add to hosts file

so you can load http://drtoast or http://toasthaiku

sudo emacs /etc/hosts

    127.0.0.1       drtoast
    127.0.0.1       toasthaiku

# Enable virtual hosts in apache

sudo emacs /etc/apache2/httpd.conf

uncomment:

    Include /private/etc/apache2/extra/httpd-vhosts.conf

# Configure virtual hosts

sudo emacs /etc/apache2/extra/httpd-vhosts.conf

    <VirtualHost *:80>
       DocumentRoot "/Library/WebServer/Documents"
       ServerName localhost
    </VirtualHost>
    
    <VirtualHost *:80>
       DocumentRoot "/Library/WebServer/Documents/toasthaiku.net"
       ServerName toasthaiku
    </VirtualHost>
    
    <VirtualHost *:80>
       DocumentRoot "/Library/WebServer/Documents/drtoast.com"
       ServerName drtoast
    </VirtualHost>

# Restart apache

