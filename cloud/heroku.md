https://devcenter.heroku.com/categories/command-line

# Rake

    heroku run rake
      --app foobar

# Database

load remote database into local app

    heroku db:pull
    	--app wfx-demo
    	--resume pull_201205020140.dat

open a console

    heroku pg:psql
      --app wellspace-production

capture a backup

    heroku pgbackups:capture
      --app wellspace-production

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
        --app wellspace-production

# Scale workers

    heroku ps:scale web=2

### Console setup

    heroku login

    Enter your Heroku credentials.
    Email: you@example.com
    Password: xxxxxx
    Found existing public key: /Users/you/.ssh/id_dsa.pub
    Would you like to associate it with your Heroku account? [Yn] Y
    Uploading ssh public key /Users/you/.ssh/id_dsa.pub
    Ruby console for wfx.heroku.com

