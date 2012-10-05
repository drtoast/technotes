# Help

* http://middlemanapp.com/getting-started/welcome/

# Setup

    gem install middleman

# Usage

new project

    middleman init myproject

run in dev mode

    bundle exec middleman server
    open http://localhost:4567/

build static site

    bundle exec middleman build


# My template

add to Gemfile:

    gem 'slim'

add to config.rb under configure: build

    require 'slim'

add to source/javascripts/all.js:

    //= require_tree ./vendor

add to source/javascripts/vendor/:

    jquery-1.7.2.min.js
    d3.v2.min.js
