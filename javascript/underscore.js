// http://documentcloud.github.com/underscore/

// Collections

_.each([1, 2, 3], function(num){ alert(num); });
// => alerts each number in turn...
_.map([1, 2, 3], function(num){ return num * 3; });
// => [3, 6, 9]
var sum = _.reduce([1, 2, 3], function(memo, num){ return memo + num; }, 0);
// => 6
reduceRight
detect
select
reject
all
any
include
invoke
pluck
max
min
sortBy
groupBy
sortedIndex
toArray
size

// Arrays

first
rest
last
compact
flatten
without
union
intersection
difference
uniq
zip
indexOf
lastIndexOf
range

// Functions

bind
bindAll
memoize
delay
defer
throttle
debounce
once
after
wrap
compose

// Objects

keys
values
functions
extend
defaults
clone
tap
isEqual
isEmpty
isElement
isArray
isArguments
isFunction
isString
isNumber
isBoolean
isDate
isRegExp isNaN
isNull
isUndefined

// Utility

noConflict
identity
times
mixin
uniqueId
template

// Chaining

chain
value