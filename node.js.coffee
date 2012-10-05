# node index.js
require('coffee-script');
require('./lib/server.coffee');

# lib/server.coffee
Router = require './router'
router = new Router
router.start()

# lib/router.coffee
express = require 'express'
BoardsController = require './controllers/boards'

class Router
  constructor: ->
    @app = express.createServer()
    @app.configure =>
      @app.set 'views', "#{__dirname}/views"
      @app.set 'view engine', 'jade'
      @app.use connectAssets(src: "#{__dirname}/../assets")
      @app.use express.bodyParser()

    boardsController = new BoardsController
    @app.get '/boards/:id', @authenticate, @createSocketNamespace, boardsController.show
    @app.post '/boards/:id', @authenticate, boardsController.destroy
    @app.post '/boards', @authenticate, boardsController.create
    @app.get '/boards/:board/info', @authenticate, boardsController.info
