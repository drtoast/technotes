http://www.justin.tv/mongodb/videos
http://www.mongodb.org/

# install mongo

    http://www.mongodb.org/display/DOCS/Quickstart+OS+X

# start and stop

    launchctl stop org.mongodb.mongod
    launchctl start org.mongodb.mongod

# monitor

    http://localhost:28017/

# repair after crash

    rm /usr/local/var/mongodb/mongod.lock
    mongod --repair --config /usr/local/Cellar/mongodb/1.6.3-x86_64/mongod.conf

# Connect as client

    mongo

# Databases, collections, documents

    show dbs            # show all databases
    use foo             # use database "foo"; database lazily created on insert
    db.dropDatabase()   # delete the current database
    db.bar.save({a: 1}) # add document to collection "bar"; collection lazily created

# Creating Records

    db.foo.save({a: 1})

# Querying

    db.foo.count()      # count all records
    db.foo.find()       # find and print all records
    db.foo.find({a: 1}) # find all documents where the value of "a" is 1
    db.foo.find({a: 1}, {b: 1}) # find all documents where "a" is 1 and return the value of b

# Replication

    http://engineering.foursquare.com/2011/05/24/fun-with-mongodb-replica-sets/

# Configuration

    http://docs.mongodb.org/manual/administration/configuration/

# Returning a random record

Why can't you do an $or instead of 2 queries?

    { $or: [ { rand: { $lte: random_val } }, { rand: { $gte: random_val } } ] }

The problem is that to ensure an even distribution, you really need to find the one record that is closest to the target random value. The random value is indexed in ascending order, which is crucial. Example: there may be one indexed value that is just barely greater than the target, which you would correctly encounter in an index scan if you were only doing a $gte. But adding $lte via the $or criteria, a value less than the random target may be encountered first during that index scan. And that will always be the first value in the index.
