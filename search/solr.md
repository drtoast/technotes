# Docs

http://lucene.apache.org/solr/

# Rubygem

https://github.com/mwmitchell/rsolr

RSolr is fairly new and very actively maintained; it's just a much lower-level API to Solr. Sunspot is actually built on top of it.

# Integrating with MongoDB

http://groups.google.com/group/mongodb-user/browse_thread/thread/b4a2417288dabe97/6268402ec69986fb?pli=1

    We tapped into before_create, after_update and after_delete mongomapper hooks to use rsolr to send update and delete calls over http to the solr server.

