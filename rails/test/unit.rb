# http://guides.rubyonrails.org/testing.html

require 'test_helper'

### extends Test::Unit::TestCase
class ArticleTest < ActiveSupport::TestCase
  
  # called before every single test
  def setup
    @post = posts(:one)
  end
 
  # called after every single test
  def teardown
    # do something
  end
  
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "all Test::Unit assertions" do
    ## see technotes/testing/test_unit.rb
  end
  
  test "Rails assertion additions" do
    # Ensures that the passed record is valid by Active Record standards and returns any error messages if it is not.
    assert_valid(record)
  end
  
end

=begin
1. run any migrations:
rake db:migrate
2. prepare test database:
rake db:test:load

## run only a specific test
ruby -Itest test/unit/post_test.rb -n test_the_truth
=end
