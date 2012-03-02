#http://docs.jquery.com/Plugins/Authoring

# create a chainable function that can be called on any jQuery object
# $('.completion a').myPlugin()
jQuery.fn.myPlugin = (opts) ->

  $(@).each ->
    $el = $(@)
    $capacity_input = $('input[name="capacity"]', $el)