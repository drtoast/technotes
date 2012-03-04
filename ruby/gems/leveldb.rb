# http://www.igvita.com/2012/02/06/sstable-and-log-structured-storage-leveldb
# https://github.com/wmorgan/leveldb-ruby

# library providing a sorted disk-based key-value store with fast reads and writes

require 'leveldb' # gem install leveldb-ruby

db = LevelDB::DB.new "/tmp/db"
db.put "b", "bar"
db.put "a", "foo"
db.put "c", "baz"

puts db.get "a" # => foo

db.each do |k,v|
 p [k,v] # => ["a", "foo"], ["b", "bar"], ["c", "baz"]
end

db.to_a # => [["a", "foo"], ["b", "bar"], ["c", "baz"]]

db.delete "c"
