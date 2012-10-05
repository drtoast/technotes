### Modules and Mixins

# require a file relative to the current directory
require_relative 'trig'
y = Trig::PI/4


### Hashes

# new hash syntax when keys are symbols (like JSON)
blah = {
  ok: 'yes',
  nope: 'nope'
}

# traditional hash syntax
blah = {
  :ok => 'yes',
  :nope => 'nope'
}


### Duck typing
class About::DuckTyping

  # One object walks and talks like another.
  # e.g., File and String both respond to <<

end


### Procs

p = :upcase.to_proc
# => #<Proc:0x00000100a7fe58>
p.call("hello")
# => "HELLO"

names = ["ant", "bee", "cat"]
names.map(&:upcase)
# => ["ANT", "BEE", "CAT"]

class BlockExample
  CONST = 0
  @@a = 3
  def return_closure
    a=1
    @a = 2
    lambda { [ CONST, a, @a, @@a, yield ] }
  end
  def change_values
    @a += 1
    @@a += 1
  end
end

eg = BlockExample.new
block = eg.return_closure { "original" }
block.call
# => [0, 1, 2, 3, "original"]
eg.change_values
block.call
# => [0, 1, 3, 4, "original"]



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

# Procs operate in the context in which they were defined.
# A return from inside a raw block that’s still in scope acts as a return from that scope.
def meth4
  p = Proc.new { return 99 }
  p.call
  puts "Never get here"
end
meth4	# => 99

# A lambda behaves more like a free-standing method body:
# a return simply returns from the block to the caller of the block:
def meth5
  p = lambda { return 99 }
  result = p.call
  "The block returned #{result}"
end
meth5	# => "The block returned 99"



### Closures

# Variables in the surrounding scope that are referenced in a block remain accessible
# for the life of that block and the life of any Proc object created from that block.
