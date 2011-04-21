# Running on dreamhost:

# http://stackoverflow.com/questions/1829973/deploying-sinatra-app-on-dreamhost-passenger-with-custom-gems

# Install Ruby gems on dreamhost
# http://www.blog.bridgeutopiaweb.com/post/installing-ruby-gems-on-dreamhost/
# Change config.ru (works for Sinatra 1.0)

require 'rubygems'
require 'vendor/sinatra/lib/sinatra.rb'
ENV['GEM_HOME'] = '/home/username/.gems'
ENV['GEM_PATH'] = '$GEM_HOME:/usr/lib/ruby/gems/1.8'
require 'rubygems'
Gem.clear_paths

disable :run, :reload

set :environment, :production

require 'yourapp'
run Sinatra::Application
