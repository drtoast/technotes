// OBJECT LITERALS
var obj = {a: 1, b: 2, 'c-d-e': 3};
typeof obj;
// => "object"



// PROTOTYPE
// http://yehudakatz.com/2011/08/12/understanding-prototypes-in-javascript

// create an object that will act as a prototype for new objects
var person = {
  firstName: null,
  lastName: null,
  toString: function() { return this.firstName + ' ' + this.lastName; }
};

// create a new object whose prototype is "person"
var joe = Object.create(person);
joe.firstName = "Joe";
joe.lastName = "Smith";
joe.toString();
// "Joe Smith"

person.species = "Human";
joe.species
// "Human"



// NATIVE OBJECT ORIENTATION using the "new" keyword
// http://phrogz.net/js/classes/OOPinJS.html

// define a "class" with a constructor (actually a function object, which will also be the prototype)
var Person = function(firstName, lastName) {
  
  // public properties - anyone may read and write
  this.firstName = firstName;
  this.lastName = lastName;
  
  // private variables and functions - can only be used inside
  var alive = true, age=1, maxAge=100;
  function makeOlder(){ return alive = (++age <= maxAge) };
  
  // privileged methods - may be invoked publicly, but not changed
  this.weigh = function(){ return weight }
  this.toString: function() { return this.firstName + ' ' + this.lastName; }
}
 
// optionally add another instance method
Person.prototype.amputate = function(){ this.legs-- }

// use the class
var joe = new Person("Joe", "Smith");
joe.toString();
// => "Joe Smith"

