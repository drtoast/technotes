# Native ruby driver: https://github.com/mongodb/mongo

# Ruby API documentation:
# http://api.mongodb.org/ruby/current/index.html

require 'rubygems'
require 'mongo'

# connect to database
conn = Mongo::Connection.new('localhost',27017)

# show all databases
conn.database_info.each { |info| puts info.inspect}

# get a datbase and collection
db   = conn['sample-db']
coll = db['test']

# delete everything
coll.remove

# insert some documents
3.times do |i|
  coll.insert({'a' => i+1})
end

# show documents
puts "There are #{coll.count} records. Here they are:"
coll.find.each { |doc| puts doc.inspect }

# find all documents whose "i" is greater than 50, and print fields "a" and "b"
coll.find("i" => {"$gt" => 50}, :fields => ["a", "b"]).each { |row| puts row }
