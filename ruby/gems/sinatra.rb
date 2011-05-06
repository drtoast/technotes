# http://sinatra-book.gittr.com/
# http://www.sinatrarb.com/

### myapp.rb
require 'sinatra'
require 'haml'
require 'json'

set :views, 'views'
set :public, 'public'
set :sessions, true
set :run, true
set :port, 4567

mime_type :swf, 'application/x-shockwave-flash'

# run this before every request
before do
  session['counter'] ||= 0
  session['counter'] += 1
end

# return text
get '/' do
  "Hello World #{session['counter']} times!" 
end

# return JSON
# GET http://localhost:4567/assets
get '/assets' do
  content_type :json
  {:a => 1, :b => 2}.to_json
end

# return HTML/HAML
# GET http://localhost:4567/user?name=Bill
get '/user' do
  @name = params[:name]
  haml :name
end

# return a file
# GET http://localhost:4567/file?name=blah.swf
get '/file' do
  file = File.join('public', 'assets', params[:name])
  if File.exists?(file)
    send_file file
  else
    raise Sinatra::NotFound
  end
end

# routing
get '/dog/:id' do
  @dog = Dog.find(params[:id])
end

### views/layout.haml
%html
  %head
    %body
      = yield

### views/name.haml
%h1= "Hello #{@name}!"



### Running on dreamhost:
# http://stackoverflow.com/questions/1829973/deploying-sinatra-app-on-dreamhost-passenger-with-custom-gems

# Install Ruby gems on dreamhost:
# http://www.blog.bridgeutopiaweb.com/post/installing-ruby-gems-on-dreamhost/
