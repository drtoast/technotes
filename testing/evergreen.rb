# client-side JavaScript testing
# https://github.com/jnicklas/evergreen

# uses Jasmine
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