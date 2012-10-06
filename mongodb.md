http://www.justin.tv/mongodb/videos
http://www.mongodb.org/

install MongoDB via homebrew:

    brew install mongodb
    cp /usr/local/Cellar/mongodb/1.6.3-x86_64/org.mongodb.mongod.plist ~/Library/LaunchAgents
    launchctl load -w ~/Library/LaunchAgents/org.mongodb.mongod.plist

    # start and stop:
    launchctl stop org.mongodb.mongod
    launchctl start org.mongodb.mongod

see if it's running:

    http://localhost:28017/

connect as client and poke around:

    mongo
    > show dbs
    > exit

if (when!) MongoDB exits abnormally, you'll need to remove the lockfile and repair the db:

   rm /usr/local/var/mongodb/mongod.lock
   mongod --repair --dbpath /usr/local/var/mongodb

optionally, edit the default mongodb config file here:

  /usr/local/Cellar/mongodb/1.6.3-x86_64/mongod.conf

# install mongoid

http://railscasts.com/episodes/238-mongoid

    gem install mongoid

# start daemon 

with path to db dir (default is /data/db)

    mongod --dbpath ./data/db


# connect as client

    mongo
    db.foo.save( { a : 1 } )
    db.foo.find()
    
# Replication

http://engineering.foursquare.com/2011/05/24/fun-with-mongodb-replica-sets/

# DB admin

    show dbs
    use tunes
    db.dropDatabase()
    