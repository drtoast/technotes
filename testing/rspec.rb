# rspec - BDD
# http://www.pragprog.com/titles/achbd/the-rspec-book

### BASICS

# game_spec.rb
require './game'
describe Game do
  describe "#score" do
    it "returns 0 for all gutter game" do
      game = Game.new
      20.times { game.roll(0) }
      game.score.should == 0
    end
  end
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

