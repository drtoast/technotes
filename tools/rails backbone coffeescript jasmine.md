# Stack: Rails, MongoDB, CoffeeScript, Backbone.js, Sass
# Testing: Guard, Rspec, jasmine-headless-webkit, capybara-webkit


# Developer tools

Download and install the latest Xcode developer tools from the Apple App Store

# RVM/Ruby

http://beginrescueend.com/

add to .rvmrc in project root:

    rvm ruby-1.9.3-p0@yourappname --create

install Ruby 1.9.3:

    rvm install ruby-1.9.3-p0

install Bundler:

    gem install bundler


# MongoDB

http://www.mongodb.org/

install MongoDB via homebrew:

    brew install mongodb
    cp /usr/local/Cellar/mongodb/1.6.3-x86_64/org.mongodb.mongod.plist ~/Library/LaunchAgents
    launchctl load -w ~/Library/LaunchAgents/org.mongodb.mongod.plist

see if it's running:

    http://localhost:28017/

connect as client and poke around:

    mongo
    > show dbs
    > exit

if (when!) MongoDB exits abnormally, you'll need to remove the lockfile and repair the db:

   rm /usr/local/var/mongodb/mongod.lock
   mongod --repair --dbpath /usr/local/var/mongodb

optionally, edit the default mongodb config file here:

  /usr/local/Cellar/mongodb/1.6.3-x86_64/mongod.conf

## Rails

http://rubyonrails.org

create a Gemfile in project root:

    source 'http://rubygems.org'
    gem 'rails'
    gem 'jquery-rails'
    gem 'mongo'

    group :assets do
      gem 'sass-rails'
      gem 'coffee-rails'
      gem 'uglifier'
      gem 'therubyracer'
    end

    group :test, :development do
      gem 'jasmine', git: 'git://github.com/pivotal/jasmine-gem.git'
      gem 'jasmine-headless-webkit'
      gem 'rspec-rails'
      gem 'capybara'
      gem 'capybara-webkit'
      gem 'guard'
      gem 'guard-rails-assets'
      gem 'guard-jasmine-headless-webkit'
      gem 'rb-fsevent', require: false
      gem 'growl'
    end

Install the QT libraries required by headless webkit:

    http://qt.nokia.com/downloads/downloads#qt-lib

Install gems:

    bundle install

Create your project

    bundle exec rails new yourappname

Now that we've bootstrapped, move Gemfile and .rvmrc into your rails project

    mv Gemfile* yourappname
    mv .rvmrc yourappname
    cd yourappname


## Jasmine

http://johnbintz.github.com/jasmine-headless-webkit/

Setup Jasmine:

    bundle exec jasmine init
    rm lib/tasks/jasmine.rake

in spec/javascripts/support/jasmine.yml:

    # load application.js
    src_files:
      - public/assets/application.js

    # detect CoffeeScript specs
    spec_files:
      - '**/*[sS]pec.js.coffee'

add a spec: spec/javascripts/models/hello.js.coffee

    describe "Hello World", ->
      it "should say hi", ->
        expect("Hello World").toEqual("Hello World")


## Guard

initialize guard:

    bundle exec guard init

show installed guards:

    guard list
    
initialize guards:

    guard init rails-assets
    guard init jasmine-headless-webkit

run guard:

    bundle exec guard


## Backbone etc.

Add libs

    # vendor/assets/javascripts:
    backbone.js
    coffeekup.js
    jquery.js
    json2.js
    underscore.js

Require vendor and local libs

    # app/assets/javascripts/application.js:
    //= require jquery
    //= require jquery_ujs
    //= require underscore
    //= require coffeekup
    //= require json2
    //= require backbone
    //= require yourapp
    //= require_tree ./models
    //= require_tree ./collections
    //= require_tree ./views
    //= require_tree ./routers


Create the JS entry point

    # app/assets/javascripts/yourapp.js.coffee:
    window.YourApp =
      Models: {}
      Views: {}
      Collections: {}
      Routers: {}
      init: ->
        # do any initialization stuff here
        # @router = new YourApp.Routers.ApplicationRouter
        # Backbone.history.start()

    $ ->
      YourApp.init()

add a model

    # app/assets/javascripts/models/hello.js.coffee:
    Hello = BackBone.Model.extend

add a jasmine unit test

    # spec/javascripts/models/hello_spec.js.coffee:
    describe "Hello", ->
      beforeEach ->
        @hello = new Hello(message:"Hello World")

      it "should have an artist", ->
        expect(@hello.get('message')).toEqual("Hello World")

add a capybara acceptance spec


## Rails setup

Disable active record (TODO: breaks rails?)

    # config/application.rb:
    # require 'rails/all'
    require "action_controller/railtie"
    require "action_mailer/railtie"
    require "active_resource/railtie"
    require "rails/test_unit/railtie"
    require "sprockets/railtie"

Create a controller and action

    rails g controller Albums index

Route the root URL to this controller/action

    # config/routes.rb:
    root :to => 'albums#index'

Remove static index.html

    rm public/index.html

## Add a Backbone model

    # app/assets/javascripts/models/album.js.coffee
    class YourApp.Models.Album extends Backbone.Model
      urlRoot: '/albums'


<!-- ## Rails Asset Pipeline

save custom assets in app/assets, vendor assets in vendor/assets/

in config/application.rb:

    # enable asset pipeline
    config.assets.enabled = true

    # keep compiled test/development/production assets segregated
    config.paths['public'] = "#{Rails.root}/public/#{Rails.env}"

    # explicitly specify assets to precompile
    config.assets.precompile = %W(vendor.js application.js application.css) -->
