https://github.com/fastestforward/heroku_san

# Show available rake tasks

rake -T | grep heroku


rake staging deploy
rake staging restart
rake staging heroku:rake[db:populate]
