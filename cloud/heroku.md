### backups

heroku pgbackups:capture --app wellspace-production


### command line

heroku restart web.1 --app foo


### Rake

heroku rake


### Database

heroku db:pull
	--app wfx-demo
	--resume pull_201205020140.dat


### Logs

heroku logs
	--app growing-meadow-85
	--source heroku
	--source app
	--tail
	-n 1500


### Deploy (staging/production git workflow)

# standing in /rails_app_root
git checkout -b working

# after committing a change
git status

# nothing to commit (working directory clean)
git checkout staging
git merge working

# 'see' Fast forward
git push heroku_staging staging:master
heroku maintenance:off --app staging_app_name

# exercise the staging app to verify change
heroku maintenance:on --app staging_app_name
git push  # to GitHub
git checkout master
git merge staging

# 'see' Fast forward
heroku maintenance:on --app production_app_name
git push heroku_production
heroku maintenance:off --app production_app_name
git push  # to GitHub
git checkout working

# go forth and make more changes


### HTTP reverse proxy (Nginx)

Handles HTTP-level processing, such as SSL and gzip, then passes connections to stack


### Dyno Grid

New instances launched in ~2 seconds using a "compiled slug" of your app (pre-compiled with all dependencies, and pre-tested to make sure it runs)


### Console setup

heroku console --app wfx

Enter your Heroku credentials.
Email: you@example.com
Password: xxxxxx
Found existing public key: /Users/you/.ssh/id_dsa.pub
Would you like to associate it with your Heroku account? [Yn] Y
Uploading ssh public key /Users/you/.ssh/id_dsa.pub
Ruby console for wfx.heroku.com

