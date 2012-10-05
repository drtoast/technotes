# http://api.jquery.com/jQuery.ajax/

# GET
$.ajax
  url: 'ajax/test.html'
  success: ->
    $('#result').html(data)
    alert('Load was performed.')
  statusCode:
    404: ->
      alert('page not found')
