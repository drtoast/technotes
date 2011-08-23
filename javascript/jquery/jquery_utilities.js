// http://api.jquery.com/category/utilities/

function utilities() {
    // iterate over arrays or objects
    $.each([52, 97], function(index, value) { 
      alert(index + ': ' + value); 
    });
}

function data() {
  // store arbitrary data in an element
  $('#something').data('name', 'Joe Smith').data('email', 'joe@example.com')
  
  // retrieve stored data
  $("#something").data("name")
}