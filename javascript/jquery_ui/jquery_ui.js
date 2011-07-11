// autocomplete

/* The local data can be a simple Array of Strings, 
or it contains Objects for each item in the array, 
with either a label or value property or both. 
The label property is displayed in the suggestion menu.
The value will be inserted into the input element 
after the user selected something from the menu.
*/

$(function() {
	var availableTags = [
		"ActionScript",
		"AppleScript",
		"Asp",
		"BASIC",
		"C",
		"C++",
		"Clojure",
		"COBOL",
		"ColdFusion",
		"Erlang",
		"Fortran",
		"Groovy",
		"Haskell",
		"Java",
		"JavaScript",
		"Lisp",
		"Perl",
		"PHP",
		"Python",
		"Ruby",
		"Scala",
		"Scheme"
	];
	$( "#tags" ).autocomplete({
		source: availableTags
	});
});

// <div class="ui-widget">
//  <label for="tags">Tags: </label>
//  <input id="tags">
// </div>