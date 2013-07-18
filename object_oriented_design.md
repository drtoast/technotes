Sandi Metz. Practical Object-Oriented Design in Ruby: An Agile Primer


** Ch. 1 - Object Oriented Design **


# SOLID

* Single Responsibility
* Open-Closed
* Liskov Substitution
* Interface Segregation
* Dependency Inversion


# TRUE

* Transparent: The consequences of change should be obvious in the code that is changing and in distant code relies upon it
* Reasonable: The cost of any change should be proportional to the benefits the change achieves
* Usable: Existing code should be usable in new and unexpected contexts
* Exemplary: The code itself should encourage those who change it to perpetuate these qualities


# Agile vs Big Up Front Design (BUFD)

Agile believes that your customers can’t define the software they want before seeing it, so it’s best to show them sooner rather than later. If this premise is true, then it logically follows that you should build software in tiny increments, gradually iterating your way into an application that meets the customer’s true need. Agile believes that the most cost-effective way to produce what customers really want is to collaborate with them, building software one small bit at a time such that each delivered bit has the opportunity to alter ideas about the next. The Agile experience is that this collaboration produces software that differs from what was initially imagined; the resulting software could not have been anticipated by any other means.

It should come as no surprise that some people are uncomfortable with Agile. “We don’t know what we’re doing” and “We don’t know when we’ll be done” can be a difficult sell. The desire for BUFD persists because, for some, it provides a feeling of control that would otherwise be lacking. Comforting though this feeling may be, it



** Ch. 2 - Single Responsibility **


# Single Responsibility Principle (SRP)

Attempt to describe it in one sentence. Remember that a class should do the smallest possible useful thing. That thing ought to be simple to describe. If the simplest description you can devise uses the word “and,” the class likely has more than one responsibility. If it uses the word “or,” then the class has more than one responsibility and they aren’t even very related.


# Depend on behavior, not data.

Data very often has behavior that you don’t yet know about. Send messages to access variables, even if you think of them as data. Hide instance variables using attr_reader.


# Separate structure from meaning.

Use the Struct class to wrap a raw data structure.

Wheel = Struct.new(:rim, :tire)
def wheelify(data)
  data.map {|cell| Wheel.new(cell[0], cell[1])}
end


# Each method should have one responsibility

Refactor methods that do two things until they only do one. Separate iteration from the action that’s being performed on each element.


# Extract commented code

If a bit of code inside a method needs a comment, extract that bit into a separate method. The new method name serves the same purpose as did the old comment.


** Ch. 3 - Managing Dependencies **


An object has a dependency when it knows:

* The name of another class.
* The name of a message that it intends to send to someone other than self.
* The arguments that a message requires.
* The order of those arguments.


# Use duck typing, inject dependencies into objects that need them

# Set default hash arguments

def initialize(args)
  @chainring = args.fetch(:chainring, 40)
  @cog = args.fetch(:cog, 18)
end

def initialize(args)
  args = defaults.merge(args)
  @chainring = args[:chainring]
  @cog = args[:cog]
end

def defaults
  { chainring: 40, cog: 18 }
end


# Create a wrapper module around external dependencies

module GearFactory
  def self.gear(args)
    SomeModule::Gear.new(args[:foo], args[:bar])
  end
end

gear = GearFactory.gear(args)


# Choosing dependency direction

Depend on things that change less than you do.


** Ch. 4 - Creating Flexible Interfaces **

