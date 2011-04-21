# Install

http://jeroenbourgois.be/nginx-alongside-apache-on-osx-snow-leopard

    brew install nginx

In the interest of allowing you to run `nginx` without `sudo`, the default
port is set to localhost:8080.

If you want to host pages on your local machine to the public, you should
change that to localhost:80, and run `sudo nginx`. You'll need to turn off
any other web servers running port 80, of course.

You can start nginx automatically on login with:

    cp /usr/local/Cellar/nginx/0.8.53/org.nginx.plist ~/Library/LaunchAgents
    launchctl load -w ~/Library/LaunchAgents/org.nginx.plist
