# express.js
# http://expressjs.com/api.html

express = require 'express'
app = express()

app.get '/', (req, res) ->
  res.send('hello world')

app.listen(3000)
