# About

http://www.elasticsearch.org/

* Distributed
* RESTful (using JSON)
* built on top of Lucene

# Adding a document as JSON

By default, schemaless docs will be auto-indexed, field types auto detected:

    $ curl -XPUT http://localhost:9200/twitter/tweet/1 -d '{
        "user": "kimchy",
        "post_date": "2009-11-15T13:12:00",
        "message": "Trying out elasticsearch, so far so good?"
    }'
    
# Getting a document as JSON

The index name, type, and id comprise the doc's unique identifier:

    $ curl -XGET http://localhost:9200/twitter/tweet/1

# Searching

    $ curl -XGET http://localhost:9200/twitter/tweet/_search?q=user:kimchy

    $ curl -XGET http://localhost:9200/twitter/tweet/_search -d '{
        "query" : {
            "term" : { "user": "kimchy" }
        }
    }'

    $ curl -XGET http://localhost:9200/twitter/_search?pretty=true -d '{
        "query" : {
            "range" : {
                "post_date" : {
                    "from" : "2009-11-15T13:00:00",
                    "to" : "2009-11-15T14:30:00"
                }
            }
        }
    }'

# Defining schema

    $ curl -XPUT http://localhost:9200/twitter/user/_mapping -d '{
        "properties" : {
            "name" : { "type" : "string" }
        }
    }'

# Search multiple indexes at once

    $ curl -XPUT http://localhost:9200/kimchy
    
    $ curl -XPUT http://localhost:9200/elasticsearch
    
    $ curl -XPUT http://localhost:9200/elasticsearch/tweet/1 -d '{
        "post_date": "2009-11-15T14:12:12",
        "message": "Zug Zug",
        "tag": "warcraft"
    }'
    
    $ curl -XPUT http://localhost:9200/kimchy/tweet/1 -d '{
        "post_date": "2009-11-15T14:12:12",
        "message": "Whatyouwant?",
        "tag": "warcraft"
    }'
    
    $ curl -XGET http://localhost:9200/kimchy,elasticsearch/tweet/_search?q=tag:warcraft
    
    $ curl -XGET http://localhost:9200/_all/tweet/_search?q=tag:warcraft

# Settings/sharding
    
    $ curl -XPUT http://localhost:9200/elasticsearch/ -d '{
        "settings" : {
            "number_of_shards" : 2,
            "number_of_replicas" : 3
        }
    }'