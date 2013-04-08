# http://rubydoc.info/gems/rspec-expectations/frames
# Built-in matchers

def equivalence
  actual.should eq(expected)  # passes if actual == expected
  actual.should == expected   # passes if actual == expected
  actual.should eql(expected) # passes if actual.eql?(expected)
  # Note: we recommend the eq matcher over == to avoid Ruby's "== in a useless context" warning when the == matcher is used anywhere but the last statement of an example.
end

def identity
  actual.should be(expected)    # passes if actual.equal?(expected)
  actual.should equal(expected) # passes if actual.equal?(expected)
end

def comparisons
  actual.should be >  expected
  actual.should be >= expected
  actual.should be <= expected
  actual.should be <  expected
  actual.should be_within(delta).of(expected)
end

def regular_expressions
  actual.should match(/expression/)
  actual.should =~ /expression/
end

def types_and_classes
  actual.should be_an_instance_of(expected)
  actual.should be_a_kind_of(expected)
end

def truthiness
  actual.should be_true  # passes if actual is truthy (not nil or false)
  actual.should be_false # passes if actual is falsy (nil or false)
  actual.should be_nil   # passes if actual is nil
end

def expecting_errors
  expect { foo }.to raise_error
  expect { foo }.to raise_error(ErrorClass)
  expect { foo }.to raise_error("message")
  expect { foo }.to raise_error(ErrorClass, "message")
end

def expecting_throws
  expect { foo }.to throw_symbol
  expect { foo }.to throw_symbol(:symbol)
  expect { foo }.to throw_symbol(:symbol, 'value')
end

def yielding
  expect { |b| 5.tap(&b) }.to yield_control # passes regardless of yielded args
  expect { |b| yield_if_true(true, &b) }.to yield_with_no_args # passes only if no args are yielded
  expect { |b| 5.tap(&b) }.to yield_with_args(5)
  expect { |b| 5.tap(&b) }.to yield_with_args(Fixnum)
  expect { |b| "a string".tap(&b) }.to yield_with_args(/str/)
  expect { |b| [1, 2, 3].each(&b) }.to yield_successive_args(1, 2, 3)
  expect { |b| { :a => 1, :b => 2 }.each(&b) }.to yield_successive_args([:a, 1], [:b, 2])
end

def predicate_matchers
  actual.should be_xxx         # passes if actual.xxx?
  actual.should have_xxx(:arg) # passes if actual.has_xxx?(:arg)
end

def ranges # (Ruby >= 1.9 only)
  (1..10).should cover(3)
end

def collection_membership
  actual.should include(expected)
  actual.should start_with(expected)
  actual.should end_with(expected)
end

def examples
  [1,2,3].should include(1)
  [1,2,3].should include(1, 2)
  [1,2,3].should start_with(1)
  [1,2,3].should start_with(1,2)
  [1,2,3].should end_with(3)
  [1,2,3].should end_with(2,3)
  {:a => 'b'}.should include(:a => 'b')
  "this string".should include("is str")
  "this string".should start_with("this")
  "this string".should end_with("ring")

  # 'expect' syntax
  expect(actual).to eq expected
  expect(actual).to be > 3
  expect([1, 2, 3]).to_not include 4
end
