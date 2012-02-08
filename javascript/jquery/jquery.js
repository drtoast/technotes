// <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>

// http://docs.jquery.com/Main_Page
// http://www.bibeault.org/jqia2/
// http://visualjquery.com/


// create three boxes
$('body').append('<div id="red"></div>');
$('#red').css({'background-color': 'red','width':'100px','height':'100px'});
$('body').append('<div id="green"></div>');
$('#green').css({'background-color':'green','width':'100px','height':'100px'});
$('body').append('<div id="blue"></div>');
$('#blue').css({'background-color':'blue','width':'100px','height':'100px'});

// RELATIVE: move green to the right by 100px without affecting others
$('#green').css({'position':'relative','left':'100px'});

// ABSOLUTE: move green to right by 100px and let blue reflow
$('#green').css({'position':'absolute','left':'100px'});

// put green inside of blue and move it to bottom right corner
$('#blue').css({'position':'relative'});
$('#blue').append($('#green'));
$('#green').css({'width':'50','height':'50','position':'absolute','right':0,'bottom':0});