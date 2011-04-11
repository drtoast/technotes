### Setup

# install redis

# git clone git://github.com/antirez/redis.git
# cd redis
# cd src; make
# make install
## OR:
# brew install redis

# gem install redis redis-namespace yajl-ruby

# add to Gemfile:
gem "redis",                "2.1.1"
gem "resque",               "1.10.0"

# add to Rakefile:
require 'resque/tasks'
namespace :resque do
  task :setup => :environment
end

# add to environment.rb: (used by workers)
config.after_initialize do
    Resque.redis = 'localhost:6379'
end

# add to config/resque/resque.rb: (used by resque-web)
Resque.redis = 'localhost:6379'

### add to config/resque/resque.redis.conf: (used by redis server)
# port 6378   # use this port (default is 6379)
# daemonize yes    # run as a daemon
# dbfilename resque-dump.rdb    # the filename for db dump
# dir /usr/local/redis/      # the working directory for db dump


### create a worker:
class ResqueTest
  @queue = :test
  def self.perform(text)
    File.open("/users/jamesreynolds/Desktop/resque.txt", "a") do |f|
      f.puts [Time.now, text].join("\t")
    end
  end
end

### Run Redis Server
# /usr/local/bin/redis-server /data/apps/smp/current/config/resque/resque.redis.conf

### Run Resque Workers
# cd smp
# RAILS_ENV=development RAILS_ROOT=/users/jamesreynolds/smp QUEUE=authoring WORKERS=2 god -c config/resque/resque.god

### Run Resque Web Interface
# cd smp
# resque-web config/resque/resque.rb
# http://localhost:5678/

### Send a Job to the Queue
# cd smp
# script/console
Resque.enque(ResqueTest, "hello world")
