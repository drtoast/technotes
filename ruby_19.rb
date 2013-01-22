# http://www.ruby-doc.org/

class RubyExamples

  # require a file relative to the current directory
  def requires
    require_relative 'trig'
    Trig::PI / 4
  end


  def hashes
    # Hash#merge (h2 wins!)
    h1 = { "a" => 100, "b" => 200 }
    h2 = { "b" => 254, "c" => 300 }
    h1.merge(h2)   #=> {"a"=>100, "b"=>254, "c"=>300}
    puts h1        #=> {"a"=>100, "b"=>200}

    # Hash#reverse_merge (h1 wins!)
    h1 = { "a" => 100, "b" => 200 }
    h2 = { "b" => 254, "c" => 300 }
    h1.reverse_merge(h2)   #=> {"b"=>200, "c"=>300, "a"=>100}
    puts h1        #=> {"a"=>100, "b"=>200}
  end

  # Eigenclass/Singleton/Anonymous classes
  def eigenclass
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
  end

  class ClassAttributeExample
    @var = 99
    class << self
      attr_accessor :var
    end
  end

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

  def blocks
    eg = BlockExample.new
    block = eg.return_closure { "original" }
    block.call
    # => [0, 1, 2, 3, "original"]
    eg.change_values
    block.call
    # => [0, 1, 3, 4, "original"]
  end

  def procs_1
    p = :upcase.to_proc
    # => #<Proc:0x00000100a7fe58>
    p.call("hello")
    # => "HELLO"

    names = ["ant", "bee", "cat"]
    names.map(&:upcase)
    # => ["ANT", "BEE", "CAT"]
  end

  def procs_2
    # Procs operate in the context in which they were defined.
    # A return from inside a raw block that’s still in scope acts as a return from that scope.
    def meth4
      p = Proc.new { return 99 }
      p.call
      puts "Never get here"
    end
    meth4 # => 99
  end

  def lambdas
    # A lambda is a Proc that behaves more like a free-standing method body:
    # a return simply returns from the block to the caller of the block:
    def meth5
      p = lambda { return 99 }
      result = p.call
      "The block returned #{result}"
    end
    meth5 # => "The block returned 99"

    foo = lambda { |a, b| a + b }
    # OR:
    foo = ->(a, b) { a + b }
    foo.call 1,2
    # => 3

    # vs Coffeescript:
    # foo = (a, b) -> a + b
    # foo(1,2)
  end
end

### Closures

# Variables in the surrounding scope that are referenced in a block remain accessible
# for the life of that block and the life of any Proc object created from that block.
