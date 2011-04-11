### Modules and Mixins

require_relative 'trig'
y = Trig::PI/4


### Duck typing
# 
# One object walks and talks like another. e.g., File and String both respond to <<


### Procs

p = :upcase.to_proc
# => #<Proc:0x00000100a7fe58>
p.call("hello")
# => "HELLO"

names = ["ant", "bee", "cat"]
names.map(&:upcase)
# => ["ANT", "BEE", "CAT"]


### Eigenclass/Singleton/Anonymous classes

# first, animal is a String
animal = "cat"

# then, animal becomes an anonymous class whose superclass is String
def animal.speak
  puts "The #{self} says miaow"
end

# OR:
class << animal
    def speak
        puts "The #{self} says miaow"
    end
end

# the "speak" method is in the anonymous class
animal.speak
# => "The cat says miaow"

# the "upcase" method is now in the superclass, String
animal.upcase
# => "CAT"

class Test
    @var = 99
    class << self
        attr_accessor :var
    end
end

### Blocks, Lambdas, Procs

# bo is a Proc
bo = lambda { |param| puts "You called me with #{param}" }
bo.call 99
# => "You called me with 99"


### Closures

# Variables in the surrounding scope that are referenced in a block remain accessible 
# for the life of that block and the life of any Proc object created from that block.