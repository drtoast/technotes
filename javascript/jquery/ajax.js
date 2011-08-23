// http://api.jquery.com/jQuery.ajax/

function ajax_get() {
  $.ajax({
    url: 'ajax/test.html',
    success: function(data) {
      $('#result').html(data);
      alert('Load was performed.');
    },
    statusCode: {
      404: function() {
        alert('page not found');
      }
    }
  });
}

function ajax_post() {
  
}