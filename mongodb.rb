# Native ruby driver:
# https://github.com/mongodb/mongo-ruby-driver

# Ruby API documentation:
# http://api.mongodb.org/ruby/current/

require 'rubygems'
require 'mongo'


### CONNECTION

# > var conn = new Mongo('127.0.0.1:27017');
conn = Mongo::Connection.new
conn = Mongo::Connection.new('localhost',27017)


### DATABASES

# > show dbs
conn.database_info    # Hash
conn.database_names   # Array

# > use foo
# > var mydb = conn.getDB('foo');
db = conn['foo']

# > db.dropDatabase();
conn.drop_database('foo')


### COLLECTIONS

# > db.getCollectionNames();
db.collection_names

# > var coll = db.bar (or db['bar']);
coll = db['test']

# > coll.remove();
coll.remove # delete everything

# > coll.ensureIndex(keypattern[,options]);
coll.create_index('fieldname')

# > coll.insert({baz: 1});
id = coll.insert foo: 1


### COLLECTIONS - FIND

# > var count = coll.count();
count = coll.count

# > var first = coll.findOne();
first = coll.find_one

# > var all = coll.find();
coll.find.each { |doc| puts doc }

# > var some = coll.find({baz: 3});
some = coll.find baz: 3
some.first['baz']

# find all documents whose 'i' is greater than 50, and print fields 'a' and 'b'
coll.find('i' => {'$gt' => 50}, :fields => ['a', 'b']).each { |row| puts row }

# document: inspect
doc.keys
doc['title']
doc['tracks'].each {|track| puts track['title']}

# UPDATE

coll.update({'_id' => doc['_id']}, {'$set' => {'name' => 'MongoDB Ruby'}})
