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

# Commands (gem)

http://redis.io/commands

ALL TYPES:

    redis.keys("*")   # all keys matching a pattern
    redis.flushdb     # remove all keys from db
    redis.dbsize      # how many total keys
    redis.info        # hash of db info
    redis.save        # save db synchronously
    redis.exists(key)
    redis.del(key)    # delete the key
    redis.type(key)   # 

STRINGS:

    redis.set(key, value)
    redis.get(key)
    redis.getset(key, value)    # return the old value
    redis.incr(key)             # add 1
    redis.decr(key)             # subtract 1

SETS:

    redis.sadd(key, value)      # add value to set
    redis.srem(key, value)      # remove value from set
    redis.smembers(*keys)       # get members of the set
    redis.sunion(*keys)         # get union of members of the sets
    redis.sinter(*keys)         # get interesection of members of the sets
    redis.scard(key)            # get the size of the set

HASHES:

    redis.hgetall(key)              # get hash of values
    redis.hincrby(key, field, int)  # increment the value of field by int
    redis.hdel(key, field)          # delete the field