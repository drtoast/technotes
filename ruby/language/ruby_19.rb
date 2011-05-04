### Modules and Mixins

require_relative 'trig'
y = Trig::PI/4


### Duck typing
class About::DuckTyping
  
  # One object walks and talks like another. 
  # e.g., File and String both respond to <<
  
end


### Procs
class About::Procs

  p = :upcase.to_proc
  # => #<Proc:0x00000100a7fe58>
  p.call("hello")
  # => "HELLO"

  names = ["ant", "bee", "cat"]
  names.map(&:upcase)
  # => ["ANT", "BEE", "CAT"]
  
end


### Eigenclass/Singleton/Anonymous classes
class About::Eigenclasses

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
end


### Blocks, Lambdas, Procs
class About::BlocksLambdasProcs
  
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
  
end


### Closures

# Variables in the surrounding scope that are referenced in a block remain accessible 
# for the life of that block and the life of any Proc object created from that block.