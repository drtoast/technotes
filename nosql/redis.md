http://redis.io/

# Install from source

    git clone git://github.com/antirez/redis.git
    cd redis
    cd src; make
    make install
    
# OR, install from homebrew

    brew install redis
    cd /usr/local/cellar/redis/2.0.4
    cp io.redis.redis-server.plist ~/Library/LaunchAgents
    launchctl load -w ~/Library/LaunchAgents/io.redis.redis-server.plist
    
# Install gem

    gem install redis
    
# Configure

edit /path/to/redis.conf
    
    port 6379               # use this port (default is 6379)
    daemonize yes           # run as a daemon
    dbfilename dump.rdb     # the filename for db dump
    dir /usr/local/redis/   # the working directory for db dump
    
# Run

redis-server /path/to/redis.conf
