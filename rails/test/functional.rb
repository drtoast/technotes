### Available request types:
get
post
put
head
delete

### After each request, you get these four hashes:
assigns   # Any objects that are stored as instance variables in actions for use in views.
cookies   # Any cookies that are set.
flash     # Any objects living in the flash.
session   # Any object living in session variables.

### You also get three instance variables:
@controller # The controller processing the request
@request    # The request
@response   # The response

### Rails adds these assertions to those available in Test::Unit
# Test numeric difference between the return value of an expression as a result of what is evaluated in the yielded block.
assert_difference(expressions, difference = 1, message = nil) {...}
# Asserts that the numeric result of evaluating an expression is not changed before and after invoking the passed in block.
assert_no_difference(expressions, message = nil, &block)
# Asserts that the routing of the given path was handled correctly and that the parsed options (given in the expected_options hash) match path. Basically, it asserts that Rails recognizes the route given by expected_options.
assert_recognizes(expected_options, path, extras={}, message=nil)
# Asserts that the provided options can be used to generate the provided path. This is the inverse of assert_recognizes. The extras parameter is used to tell the request the names and values of additional request parameters that would be in a query string. The message parameter allows you to specify a custom error message for assertion failures.
assert_generates(expected_path, options, defaults={}, extras = {}, message=nil)
# Asserts that the response comes with a specific status code. You can specify :success to indicate 200, :redirect to indicate 300-399, :missing to indicate 404, or :error to match the 500-599 range
assert_response(type, message = nil)	
# Assert that the redirection options passed in match those of the redirect called in the latest action. This match can be partial, such that assert_redirected_to(:controller => "weblog") will also match the redirection of redirect_to(:controller => "weblog", :action => "show") and so on.
assert_redirected_to(options = {}, message=nil)
# Asserts that the request was rendered with the appropriate template file.
assert_template(expected = nil, message=nil)

# use CSS selector to test HTML response
assert_select 'title', "Welcome to Rails Testing Guide"


require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post :create, :article => @article.attributes
    end

    assert_redirected_to article_path(assigns(:article))
  end

  test "should show article" do
    get :show, :id => @article.to_param
    assert_response :success
  end


  test "should update article" do
    put :update, :id => @article.to_param, :article => @article.attributes
    assert_redirected_to article_path(assigns(:article))
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete :destroy, :id => @article.to_param
    end

    assert_redirected_to articles_path
  end
end