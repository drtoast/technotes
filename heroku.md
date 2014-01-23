
https://devcenter.heroku.com/categories/command-line

# Rake

    heroku run rake
      --app foobar

# Postgres Database

Upgrades and migrations with changeovers:

heroku addons:add heroku-postgresql:crane --follow HEROKU_POSTGRESQL_WHITE_URL --app sushi

# Logs

    heroku logs
    	--app growing-meadow-85
    	--source heroku
    	--source app
    	--tail
    	-n 1500

# Config

    heroku:config

    heroku config:add SOME_VAR=foo
        --app appname

# JRuby

    heroku config:add BUILDPACK_URL=https://github.com/jruby/heroku-buildpack-jruby

# Remote

    git remote add heroku git@heroku.com:your-app-name.git
    git config heroku.remote heroku

# Workers

list workers

    heroku ps

scale workers up/down

    heroku ps:scale web=2
