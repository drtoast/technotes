Pusher.log = (message) ->
  if (window.console && window.console.log) window.console.log(message)

pusher = new Pusher('093cb22bb8f5acdc3')
channel = pusher.subscribe('test_channel')
channel.bind 'update_app_index', (data) ->
  alert(data)
