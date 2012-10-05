# client-side JavaScript testing
# https://github.com/jnicklas/evergreen

# Evergreen is a tool to run javascript unit tests for client side JavaScript. 
# It combines a server which allows you to serve up and run your specs in a browser, 
# as well as a runner which uses Capybara and any of its drivers to run your specs. 
# Evergreen uses the Jasmine unit testing framework for JavaScript.

# goal: best possible out-of-the-box experience
# Templates:
#   special div on the page gets cleared from the DOM after each test, so state is consistent

# cucumber feature:
When I select "Islay" from "region"
And I drag the whisky "Ardbeg Provence" to the cart
Then I should see the whisky "Ardbeg PRovence" in the cart

# cucumber step definition:
whisky = find('#whiskies > li', :text => whisky_name)
cart = find('#cart')
whisky.drag_to(cart)

# to run javascripts headless:
# rake spec:javascripts
# OR:
# evergreen run

# to run in browser:
# evergreen serve
