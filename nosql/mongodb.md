http://www.justin.tv/mongodb/videos

# install mongo

    http://www.mongodb.org/display/DOCS/Quickstart+OS+X

or

    brew install mongodb
    cp /usr/local/Cellar/mongodb/1.6.3-x86_64/org.mongodb.mongod.plist ~/Library/LaunchAgents
    launchctl load -w ~/Library/LaunchAgents/org.mongodb.mongod.plist
    
then open http://localhost:28017/

# install mongoid

http://railscasts.com/episodes/238-mongoid

    gem install mongoid

# start daemon 

with path to db dir (default is /data/db)

    mongod --dbpath ./data/db

# fix db after crash

    rm /usr/local/var/mongodb/mongod.lock
    mongod --repair --config /usr/local/Cellar/mongodb/1.6.3-x86_64/mongod.conf

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
    