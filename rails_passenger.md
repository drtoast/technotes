# install passenger

    gem install passenger

# configure apache virtual host (fixme: this doesn't work)

sudo emacs /private/etc/apache2/users/jamesreynolds.conf

    <Directory "/Users/jamesreynolds/Sites/">
        Options Indexes MultiViews
        AllowOverride None
        Order allow,deny
        Allow from all
    </Directory>
    
    LoadModule passenger_module /Users/jamesreynolds/.rvm/gems/ruby-1.8.7-p174@smp/gems/passenger-3.0.4/ext/apache2/mod_passenger.so
    PassengerRoot /Users/jamesreynolds/.rvm/gems/ruby-1.8.7-p174/gems/passenger-3.0.4
    PassengerRuby /Users/jamesreynolds/.rvm/rubies/ruby-1.8.7-p174/bin/ruby

    <VirtualHost *:80>
      ServerName local.sheetmusicplus.com
      DocumentRoot /Users/jamesreynolds/code/smp-github/smp_rails/public
      <Directory /Users/jamesreynolds/code/smp-github/smp_rails/public>
        AllowOverride all
        Options -MultiViews
      </Directory>
    </VirtualHost>