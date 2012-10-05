# Native ruby driver: https://github.com/mongodb/mongo

# Ruby API documentation:
# http://api.mongodb.org/ruby/current/index.html

require 'rubygems'
require 'mongo'

# CONNECTION
connection = Mongo::Connection.new('localhost',27017)

# DATABASE
connnection.database_info.each { |info| puts info.inspect }
connection.database_names.each { |db| puts db }
database = connection['sample-db']
connection.drop_database('sample-db')

# COLLECTION
database.collection_names.each { |coll| puts coll }
collection = database['test']
collection.remove # delete everything

# INDEXES
collection.create_index("fieldname")

# INSERT
3.times do |i|
  collection.insert({'a' => i+1})
end

# FIND
count = coll.count
first = collection.find_one
collection.find.each { |doc| puts doc.inspect }
doc = collection.find("title" => 'xx').first

# find all documents whose "i" is greater than 50, and print fields "a" and "b"
collection.find("i" => {"$gt" => 50}, :fields => ["a", "b"]).each { |row| puts row }

# INSPECT
doc.keys
doc['title']
doc['tracks'].each {|track| puts track['title']}

# UPDATE
collection.update({"_id" => doc["_id"]}, {"$set" => {"name" => "MongoDB Ruby"}})