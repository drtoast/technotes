# HTTP reverse proxy (Nginx)

Handles HTTP-level processing, such as SSL and gzip, then passes connections to stack

# Dyno Grid

New instances launched in ~2 seconds using a "compiled slug" of your app (pre-compiled with all dependencies, and pre-tested to make sure it runs)

# Console setup

    heroku console --app foo

    Enter your Heroku credentials.
    Email: you@example.com
    Password: xxxxxx
    Found existing public key: /Users/you/.ssh/id_dsa.pub
    Would you like to associate it with your Heroku account? [Yn] Y
    Uploading ssh public key /Users/you/.ssh/id_dsa.pub
    Ruby console for foo.heroku.com

# Rake

heroku rake

# Database

heroku db:pull --app foo
