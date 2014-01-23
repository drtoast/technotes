// http://expressjs.com

// SETUP

/*
npm install express -g
express --version
express --help
*/


// CREATE AN APP

/*
mkdir my-app
cd my-app
express --sessions --css sass
npm install
*/


// RUN AN APP
/*
cd my-app
node app.js
*/


// package.json

{
  "name": "application-name",
  "version": "0.0.1",
  "private": true,          // don't publish to NPM
  "scripts": {
    "start": "node app.js"  // npm start
  },
  "dependencies": {
    "express": "3.4.8",
    "ejs": "*",
    "sass": "*"
  }
}


// MIDDLEWARE:

app = express();
app.use(express.cookieParser('your secret')); // req.cookies
app.use(express.session());                   // req.session


// CUSTOM MIDDLEWARE:

app.use(function (req, res, next) {
  console.log(req.url);
  next();
})


// CONFIG:
app.set('foo', 'bar');
console.log(app.get('foo'))
// => "bar"

// if process.env.NODE_ENV == 'development'
app.configure('development', function () {
  app.use(express.errorHandler())
});


// ROUTING:
app.get('/', routes.index);
app.post('/users', routes.userCreate);
console.log(app.routes);

// CONTROLLERS:
// routes/index.js: (controller)
exports.index = function(req, res){
  res.render('index', { title: 'Express' });
};


// VIEWS:
// views/index.jade
extends layout

block content
  h1= title
  p Welcome to #{title}


// REQUEST OBJECT:

// GET /users/alice
req.params.name // => "alice"

// GET /search?q=tobi+ferret
req.query.q // => "tobi ferret"

// POST user[name]=tobi&user[email]=tobi@learnboost.com
req.body.user.name
// => "tobi"


// RESPONSE OBJECT:

res.status(404).sendfile('path/to/404.png');
res.set('Content-Type', 'text/plain');
res.cookie('name', 'tobi', { domain: '.example.com', path: '/admin', secure: true });
res.redirect(301, 'http://example.com');

