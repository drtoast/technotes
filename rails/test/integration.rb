require 'test_helper'
 
class UserFlowsTest < ActionController::IntegrationTest
  fixtures :users
 
  test "login and browse site" do
    # login via https
    https!
    get "/login"
    assert_response :success
 
    post_via_redirect "/login", :username => users(:avs).username, :password => users(:avs).password
    assert_equal '/welcome', path
    assert_equal 'Welcome avs!', flash[:notice]
 
    https!(false)
    get "/posts/all"
    assert_response :success
    assert assigns(:products)
  end
end