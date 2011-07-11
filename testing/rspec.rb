# rspec - BDD
# http://www.pragprog.com/titles/achbd/the-rspec-book

### COMMAND LINE OPTIONS
# show test and group names:
# rspec -f d


### BASICS

# game_spec.rb
require './game'
describe Game do                          # context
  describe "#score" do                    # context
    it "returns 0 for all gutter game" do # docstring
      game = Game.new
      20.times { game.roll(0) }
      game.score.should == 0              # matcher
    end
  end
  pending "not yet implemented" do        # this won't run yet
    it "should do something" do
      blah.should == 5
    end
end

describe "Examples with no docstrings generate their own:" do
  specify { 3.should be < 5 }
  # output: "should be < 5"
  specify { [1,2,3].should include(2) }
  # output: "should include 2"
  specify { [1,2,3].should respond_to(:size) }
  # output: "should respond to #size"
end

# game.rb
class Game
  def roll(pins)
  end

  def score
    0
  end
end

# $ rspec game_spec.rb --color --format doc
# 
# Game
#   #score
#     returns 0 for all gutter game
# 
# Finished in 0.00057 seconds
# 1 example, 0 failures

### STUBS

# tell the die object to return the value 3 when it receives the roll message.
die.stub(:roll) { 3 }

blah.stub(:something).and_return(something_else)    # result evaluated immediately
blah.stub(:something) { something_else }  # result evaluated lazily

describe "some feature" do
  it "should do something" do
    blah.should == something
    blah.should be_nil
  end
end

### MOCKS


### EXPECTATIONS

actual.should matcher(expected)
actual.should_not matcher(expected)


### MATCHERS

# be
obj.should be_true  # passes if obj is truthy (not nil or false)
obj.should be_false # passes if obj is falsy (nil or false)
obj.should be_nil   # passes if obj is nil
obj.should be       # passes if obj is not nil

# be_within
area_of_circle.should be_within(0.1).of(28.3)

# equality
a.should equal(b) # passes if a.equal?(b)
a.should eql(b)   # passes if a.eql?(b)
a.should == b     # passes if a == b
a.should be(b) # passes if a.equal?(b)
a.should eq(b) # passes if a == b

# exists
obj.should exist # passes if obj.exist? or obj.exists?

# expect change
expect { Counter.increment }.to change{Counter.count}.from(0).to(1)
expect { Counter.increment }.to change{Counter.count}.by(2)
expect { Counter.increment }.to_not change{Counter.count} # or not_to

# raise error
expect { raise StandardError }.to raise_error # or raise_exception

# have count
collection.should have(x).items
collection.should have_at_least(x).items
collection.should have_at_most(x).items
Dir.new("my/directory").should have(7).entries

# include
"a string".should include("a")
"a string".should include("str")
"a string".should include("str", "g")
"a string".should_not include("foo")
{:a => 1, :b => 2}.should include(:a)
{:a => 1, :b => 2}.should include(:a, :b)
{:a => 1, :b => 2}.should include(:a => 1)
{:a => 1, :b => 2}.should include(:b => 2, :a => 1)
{:a => 1, :b => 2}.should_not include(:c)
{:a => 1, :b => 2}.should_not include(:a => 2)
{:a => 1, :b => 2}.should_not include(:c => 3)

# match
"a string".should match(/str/) # passes
"a string".should match(/foo/) # fails
/foo/.should match("food") # passes
/foo/.should match("drinks") # fails

# operator
37.should be < 100
37.should be <= 38
37.should be >= 2
37.should be > 7

# predicate matchers (dynamic)
7.should_not be_zero       # calls 7.zero?
[].should be_empty         # calls [].empty?
x.should be_multiple_of(3) # calls x.multiple_of?(3)

# respond_to
obj.should respond_to(:foo, :bar) # passes if obj.respond_to?(:foo) && obj.respond_to?(:bar)

# satisfy
10.should satisfy { |v| v % 5 == 0 }
7.should_not satisfy { |v| v % 5 == 0 }

# cover (ranges)
(1..10).should cover(5)
(1..10).should cover(4, 6)
(1..10).should_not cover(11)



### CUSTOM MATCHERS

require 'rspec/expectations'

RSpec::Matchers.define :be_a_multiple_of do |expected|
  match do |actual|
    actual % expected == 0
  end
  failure_message_for_should do |actual|
    "expected that #{actual} would be a multiple of #{expected}"
  end
end

# fail intentionally to generate expected output
describe 9 do
  it {should be_a_multiple_of(4)}
end
