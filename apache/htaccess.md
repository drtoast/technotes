# 404

To specify an error document:

    ErrorDocument 404 /home/drtoast/drtoast.com/wiki/test.txt

# password protection

To password-protect a directory, add this to .htaccess in that directory:

    AuthType Basic
    AuthUserFile /home/drtoast/.htpasswd
    AuthName "secret toast zone"
    require valid-user

To generate/overwrite an encrypted password file ".htpasswd" for user "drtoast":

    htpasswd -c /home/drtoast/.htpasswd drtoast

To edit or change a user's password in an existing htpasswd file:

    htpasswd /home/drtoast/.htpasswd drtoast

# redirects

To redirect a page, specify local page or directory (relative to web root) and absolute redirect url:

    Redirect /temp/test.txt http://www.google.com

To redirect using a regular expression, use RedirectMatch and the standard regex syntax:

    RedirectMatch ^/$ http://www.drtoast.com/departments/music

# index

To specify a default directory index to display:

    DirectoryIndex filename.html

# hot linking

To prevent hot linking to content:

    RewriteEngine on
    RewriteCond %{HTTP_REFERER} !^$
    RewriteCond %{HTTP_REFERER} !^http://(www.)?mydomain.com/.*$ [NC]
    RewriteRule .(gif|jpg|js|css)$ - [F]

# hide dir listing

To prevent directory index listing:

    IndexIgnore *

# MIME types

To force a filetype to be downloaded via the browser's "Save As":

    AddType application/octet-stream mp3

# wordpress

add static error document so wordpress's mod_rewrite rules don't screw up apache's Basic-Auth

    ErrorDocument 401 /home/drtoast/drtoast.com/error.html
    ErrorDocument 403 /home/drtoast/drtoast.com/error.html
    
modify WordPress's mod_rewrite rules to ignore whatever directories you want to save:

    RewriteEngine On
    RewriteBase /
    RewriteCond %{REQUEST_URI} ^/wiki/(.*)$ [OR]
    RewriteCond %{REQUEST_URI} ^/temp/(.*)$
    RewriteRule ^.*$ - [L]
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule . /index.php [L]