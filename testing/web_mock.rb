# https://github.com/bblimke/webmock
# Overall, more features than FakeWeb


# use one of:
require 'webmock/test_unit'
require 'webmock/rspec'
require 'webmock/cucumber'


#### Stubbing requests based on method, uri, body and headers

stub_request(:post, "www.example.com").with(:body => "abc", :headers => { 'Content-Length' => 3 })

uri = URI.parse("http://www.example.com/")
req = Net::HTTP::Post.new(uri.path)
req['Content-Length'] = 3
res = Net::HTTP.start(uri.host, uri.port) {|http|
  http.request(req, "abc")
}  # ===> Success



#### Matching request body and headers against regular expressions

stub_request(:post, "www.example.com").
  with(:body => /^.*world$/, :headers => {"Content-Type" => /image\/.+/}).to_return(:body => "abc")

uri = URI.parse('http://www.example.com/')
req = Net::HTTP::Post.new(uri.path)
req['Content-Type'] = 'image/png'
res = Net::HTTP.start(uri.host, uri.port) {|http|
  http.request(req, 'hello world')
}  # ===> Success