http://johnbintz.github.com/jasmine-headless-webkit/

# Run in guard

install:

    gem install guard-jasmine-headless-webkit

add the necessary bits to your Guardfile to test a Rails 3.1:

    guard init jasmine-headless-webkit 

run:

    bundle exec guard

# Run manually or via rake:

    jasmine-headless-webkit -c
    rake jasmine:headless

# Run a specific spec

    jasmine-headless-webkit -c spec/javascripts/api_spec.coffee

