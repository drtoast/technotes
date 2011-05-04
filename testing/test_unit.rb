class SomeTests < Test::Unit::TestCase

  # called before every single test
  def setup
    # do something
  end
 
  # called after every single test
  def teardown
    # do something
  end

  # from Test::Unit::Assertions
  def test_all_available_assertions
    assert true
    assert_equal obj1, obj2
    assert_not_equal obj1, obj2
    assert_same obj1, obj2
    assert_not_same obj1, obj2
    assert_nil obj
    assert_not_nil obj
    assert_match regexp, string
    assert_no_match regexp, string
    assert_in_delta expecting, actual, delta
    assert_throws(:something) { throw :something }
    assert_raise(ZeroDivisionError) { 1 / 0 }
    assert_nothing_raised(ZeroDivisionError) { 1 / 1 }
    assert_instance_of String, "hello"
    assert_kind_of String, "hello"
    assert_respond_to "hello", :length
    assert_operator obj1, operator, obj2
    assert_send( array, [msg] )# Ensures that executing the method listed in array[1] on the object in array[0] with the parameters of array[2 and up] is true. This one is weird eh?
    flunk "test not finished"
  end

end