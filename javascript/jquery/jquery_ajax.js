// http://api.jquery.com/jQuery.ajax/

// <html>
//   <head>
//     <title>jQuery</title>
//     <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
//     <script type="text/javascript" src="jquery_ajax.js"></script>
//     </style>
//   </head>
//   <body onload="ajax_get();">
//     <h2>Ajax</h2>
//     <div id="result"></div>
//   </body>
// </html>

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