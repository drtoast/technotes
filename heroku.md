
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

# Deploy

Acceptance:

    git checkout develop
    git merge features/my-branch develop
    rake
      # verify specs pass
    git push origin develop
      # in web UI, pause heroku scheduler
    heroku maintenance:on --app my-app-acceptance
    git push acceptance develop:master
    heroku run rake db:migrate --app my-app-acceptance
      # run any one-off rake tasks
    heroku maintenance:off --app my-app-acceptance
      # in web UI, enable heroku scheduler

Production:

    git checkout master
    git merge develop
    rake
      # verify specs pass
      # in web UI, pause heroku scheduler
    git push origin master
    heroku maintenance:on --app my-app
    git push production master
    heroku run rake db:migrate --app my-app
      # run any one-off rake tasks
    heroku maintenance:off --app my-app
      # in web UI, enable heroku scheduler
