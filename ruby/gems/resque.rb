=begin rdoc
=== SETUP:

brew install redis
gem install redis redis-namespace yajl-ruby
=end

=begin rdoc
=== CONFIGURATION:

add to config/resque/resque.redis.conf: (used by redis server)

port 6378           # use this port (default is 6379)
daemonize yes       # run as a daemon
dbfilename resque-dump.rdb    # the filename for db dump
dir /usr/local/redis/         # the working directory for db dump
=end

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

### create a worker:
class ResqueTest
  @queue = :test
  def self.perform(text)
    File.open("/users/jamesreynolds/Desktop/resque.txt", "a") do |f|
      f.puts [Time.now, text].join("\t")
    end
  end
end


=begin rdoc
=== RUN

Run Redis server:
redis-server /path/to/redis.conf

Run Resque workers in foreground:
RAILS_ENV=development QUEUE=authoring rake resque:work

=== WEB INTERFACE

resque-web config/resque/resque.rb
http://localhost:5678/
=end

### Send a Job to the Queue
Resque.enqueue(ResqueTest, "hello world")


=begin rdoc
=== COMMAND LINE TOOL

resque list -r redis01:6301
resque remove catproc2:32621:authoring -r redis01:6301
resque kill catproc2:32621:authoring -r redis01:6301

=== SIGNALS

Resque workers respond to a few different signals:

QUIT - Wait for child to finish processing then exit
TERM / INT - Immediately kill child then exit
USR1 - Immediately kill child but don't exit
USR2 - Don't start to process any new jobs
CONT - Start to process new jobs again after a USR2
=end

