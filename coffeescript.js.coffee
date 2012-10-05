# http://jashkenas.github.com/coffee-script/
# https://github.com/jashkenas/coffee-script-tmbundle

# Assignment:
number   = 42
opposite = true

# (javascript:)
# var number, opposite;
# number = 42;
# opposite = true;


# Conditions:
number = -42 if opposite

# (javascript:)
# if (opposite) {
#   number = -42;
# }


# Functions:
square = (x) -> x * x

# (javascript:)
# var square;
# square = function(x) {
#   return x * x;
# };
    
fill = (container, liquid = "coffee") ->
  "Filling the #{container} with #{liquid}..."

# (javascript:)
# var fill;
# fill = function(container, liquid) {
# if (liquid == null) {
#   liquid = "coffee";
# }
# return "Filling the " + container + " with " + liquid + "...";
# };


# Arrays:
list = [1, 2, 3, 4, 5]

# (javascript:)
# var list;
# list = [1, 2, 3, 4, 5];


# Objects:
math =
  root:   Math.sqrt
  square: square
  cube:   (x) -> x * square x

# (javascript:)
# var math;
# math = {
#   root: Math.sqrt,
#   square: square,
#   cube: function(x) {
#     return x * square(x);
#   }
# };

kids =
  brother:
    name: "Max"
    age:  11
  sister:
    name: "Ida"
    age:  9

# (javascript:)
# var kids;
# kids = {
#   brother: {
#     name: "Max",
#     age: 11
#   },
#   sister: {
#     name: "Ida",
#     age: 9
#   }
# };


# Splats:
race = (winner, runners...) ->
  print winner, runners


# Existence:
alert "I knew it!" if elvis?

# (javascript:)
# if (typeof elvis !== "undefined" && elvis !== null) {
#   alert("I knew it!");
# }


# Array comprehensions:
eat food for food in ['toast', 'cheese', 'wine']

# (javascript:)
# var food, _i, _len, _ref;
# _ref = ['toast', 'cheese', 'wine'];
# for (_i = 0, _len = _ref.length; _i < _len; _i++) {
#   food = _ref[_i];
#   eat(food);
# }