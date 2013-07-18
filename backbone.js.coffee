// EVENTS

// http://lostechies.com/derickbailey/2012/04/03/revisiting-the-backbone-event-aggregator-lessons-learned/
// http://freshbrewedcode.com/jimcowart/2012/03/19/client-side-messaging-in-javascript-part-3-anti-patterns/
// http://lostechies.com/derickbailey/2011/09/15/zombies-run-managing-page-transitions-in-backbone-apps/
// http://andrewhenderson.me/tutorial/how-to-detect-backbone-memory-leaks/

/*
PROBLEM: If you bind to an object's events in a view, then remove that view from the DOM without first unbinding the events, those objects can't be garbage collected.
*/

class App.MyView extends Backbone.View
  template: JST['myView']

  // view keeps track of subviews
  subviews: []

  initialize: ->
    // view keeps track of event bindings
    @listenTo @collection, 'reset', @render

  render: =>
    // remove any subviews previously rendered
    @removeSubviews()
    // reset our element's content
    $(@el).html @template(model: @model)
    for item in @collection
      // create a new subview
      view = new App.MySubview(model: item)
      // keep track of the subview
      @subviews.push view
      // append and render the subview
      @$el.append view.el
      view.render()

  removeSubviews: =>
    // remove each subview
    subview.remove() for subview in @subviews
    // clear the subview references
    @subviews = []

  remove: =>
    // on remove, the view removes any subviews
    @removeSubviews()
    // on remove, the view calls @stopListening to unbind any events that were bound via @listenTo
    super
