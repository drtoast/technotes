# https://github.com/technoweenie/faraday
# Modular HTTP client library that uses middleware. Heavily inspired by Rack.

conn = Faraday.new(:url => 'http://sushi.com') do |builder|
  builder.request  :url_encoded
  builder.response :logger
  builder.adapter  :net_http
end

response = conn.get '/nigiri/sake.json'     # GET http://sushi.com/nigiri/sake.json
response.body

conn.get '/nigiri', 'X-Awesome' => true     # custom request header

conn.get do |req|                           # GET http://sushi.com/search?page=2&limit=100
  req.url '/search', :page => 2
  req.params['limit'] = 100
end

# More middleware for Faraday (OAuth, etc:)
# https://github.com/pengwynn/faraday_middleware