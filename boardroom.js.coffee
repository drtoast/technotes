# Start
#



# node index.js
require('coffee-script');
require('./lib/server');

# lib/server.coffee
Router = require './services/router'
router = new Router
router.start()

# lib/services/router.coffee
express = require 'express'
BoardsController = require './controllers/boards'

class Router
  constructor: ->
    @app = express.createServer()
    @app.get '/boards/:id', @authenticate, @createSocketNamespace, boardsController.show
  createSocketNamespace: (request, _, next) ->
    Sockets.findOrCreateByBoardId request.params.id
    next()
  start: ->
    @app.listen parseInt(process.env.PORT) || 7777
    Sockets.start @app

# lib/services/sockets.coffee
class Sockets
  @findOrCreateByBoardId: (boardId) ->
    # ...
  @start: (app) ->
    @io = sockets.listen app
