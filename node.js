// DEBUGGER

// add to code:
debugger;
// then:
// node debug thing.js
// c (continue execution until "debugger")
// repl (start repl)



// MODULES

// mymodule.js:
exports.someProp = 'hey there';
exports.sayHello = function() {
  console.log('hello there!');
}

// main.js:
var myMod = require('./mymodule');
console.log(myMod.someProp);
myMod.sayHello();

// npm and core modules:
var express = require('express');

// directory: ~/mymodule/index.js
var myMod = require('./mymodule');


// NPM

/*
https://npmjs.org

install a module into ./node_modules:
    npm install express

install a module globally:
    npm install express -g
*/

var passport = require('passport'), // authentication middleware
    facebook = require('passport-facebook'), // facebook oauth strategy
    moment = require('moment'), // date formatting and math
    marked = require('marked'), // markdown parsing
