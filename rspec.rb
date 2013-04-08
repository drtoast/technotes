# rspec - BDD
# http://www.pragprog.com/titles/achbd/the-rspec-book

def command_line_options
  # show test and group names:
  `rspec -f d`
end

def pending_examples
  it 'does something' do
    pending 'an announcement'
    # any code after the pending statement will not be run
  end

  xit 'does something' do
    # this will not be run
  end
end

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

# $ rspec game_spec.rb --color --format doc
#
# Game
#   #score
#     returns 0 for all gutter game
#
# Finished in 0.00057 seconds
# 1 example, 0 failures


