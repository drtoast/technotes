# http://fakeweb.rubyforge.org/

require 'fakeweb'



#### Registering basic string responses

FakeWeb.register_uri(:get, "http://example.com/test1", :body => "Hello World!")

Net::HTTP.get(URI.parse("http://example.com/test1"))
# => "Hello World!"

Net::HTTP.get(URI.parse("http://example.com/test2"))
# => FakeWeb is bypassed and the response from a real request is returned



#### Replaying a recorded response

page = `curl -is http://www.google.com/`
FakeWeb.register_uri(:get, "http://www.google.com/", :response => page)

Net::HTTP.get(URI.parse("http://www.google.com/"))
# => Full response, including headers

