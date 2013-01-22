# http://rubydoc.info/gems/rspec-mocks/frames

# Doubles
book = double("book")

# Method Stubs
book.stub(:title) { "The RSpec Book" } # evaluated lazily
book.stub(:title => "The RSpec Book")
book.stub(:title).and_return("The RSpec Book") # evaluated immediately
die.stub(:roll).and_return(1,2,3)      # return consecutively

# Define a double and a method stub in one line
book = double("book", :title => "The RSpec Book")

# Partial stub/mock (test-specific extension)
person = double(person)
Person.stub(:find) { person }           # returns the double

# Message Expectations
# fail if double doesn't receive message before end of example
validator.should_receive(:validate).with("02134")

# Expecting Arguments
double.should_receive(:msg).with(no_args())
double.should_receive(:msg).with(any_args())
double.should_receive(:msg).with(1, kind_of(Numeric), "b") #2nd argument can be any kind of Numeric
double.should_receive(:msg).with(1, boolean(), "b") #2nd argument can be true or false
double.should_receive(:msg).with(1, /abc/, "b") #2nd argument can be any String matching the submitted Regexp
double.should_receive(:msg).with(1, anything(), "b") #2nd argument can be anything at all
double.should_receive(:msg).with(1, duck_type(:abs, :div), "b")

# Receive Counts
double.should_receive(:msg).once
double.should_receive(:msg).twice
double.should_receive(:msg).exactly(n).times
double.should_receive(:msg).at_least(:once)
double.should_receive(:msg).at_least(:twice)
double.should_receive(:msg).at_least(n).times
double.should_receive(:msg).at_most(:once)
double.should_receive(:msg).at_most(:twice)
double.should_receive(:msg).at_most(n).times
double.should_receive(:msg).any_number_of_times

# Ordering
double.should_receive(:msg).ordered
double.should_receive(:other_msg).ordered

# Setting responses
double.stub(:msg).and_return(value)
double.stub(:msg).and_return(value1, value2, value3)
double.stub(:msg).and_raise(error)
double.stub(:msg).and_throw(:msg)
double.stub(:msg).and_yield(values,to,yield)
double.stub(:msg).and_yield(values,to,yield).and_yield(some,other,values,this,time)

# Arbitrary handling
double.should_receive(:msg) do |arg|
  arg.size.should eq(7)
end

# Delegate to original
Person.should_receive(:find).and_call_original
