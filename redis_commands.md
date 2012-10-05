# Native commands

http://redis.io/commands


# Rubygem methods

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
    
LISTS:

    redis.rpush(key, value)     # push a value to the tail of a list
    redis.lpush(key, value)     # push a value to the head of a list
    redis.lpop(key, value)      # remove and return the value at the tail of a list
    redis.rpop(key, value)      # remove and return the value at the head of a list
    redis.llen(key)             # return the list length