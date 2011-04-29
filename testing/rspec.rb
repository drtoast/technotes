# rspec - BDD

# bowling_spec.rb
require 'bowling'

describe Bowling, "#score" do
  it "returns 0 for all gutter game" do
    bowling = Bowling.new
    20.times { bowling.hit(0) }
    bowling.score.should == 0
  end
end

# bowling.rb
class Bowling
  def hit(pins)
  end

  def score
    0
  end
end

### RUN

# # rspec-2
# $ rspec bowling_spec.rb --format nested
# 
# # rspec-1
# $ spec bowling_spec.rb --format nested
# 
# Bowling#score
#   returns 0 for all gutter game
# 
# Finished in 0.007534 seconds
# 
# 1 example, 0 failures