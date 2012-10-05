function strings() {
    var str = "hello";
    
    // properties:
    str.length;                 // Returns the length of the string

    // methods:
    str.charAt(0); 	            // Returns the character at a specified position 
    str.charCodeAt(0); 	        // Returns the Unicode of the character at a specified position 
    str.concat(" there"); 	    // Joins two or more strings 
    String.fromCharCode(64,68); // Takes the specified Unicode values and returns a string 
    str.indexOf("e") 	        // Returns the position of the first occurrence of a specified string value in a string 
    str.lastIndexOf("l"); 	    // Returns the position of the last occurrence of a specified string value, searching backwards from the specified position in a string 
    str.match(/l/); 	        // Searches for a specified value in a string 
    str.replace("ll", "x"); 	// Replaces some characters with some other characters in a string 
    str.search("l"); 	        // Searches a string for a specified value 
    str.slice(); 	    // Extracts a part of a string and returns the extracted part in a new string 
    str.split(); 	    // Splits a string into an array of strings 
    str.substr(); 	    // Extracts a specified number of characters in a string, from a start index 
    str.substring(); 	// Extracts the characters in a string between two specified indices 
    str.toLowerCase(); 	// Displays a string in lowercase letters 
    str.toUpperCase(); 	// Displays a string in uppercase letters 
    str.toSource(); 	// Represents the source code of an object 
    str.valueOf(); 	    // Returns the primitive value of a String object
    str.anchor();  	    // Creates an HTML anchor  
    str.big(); 		    // Displays a string in a big font 
    str.blink(); 	    // Displays a blinking string 
    str.bold(); 		// Displays a string in bold 
    str.fixed(); 	    // Displays a string as teletype text 
    str.fontcolor();    // Displays a string in a specified color 
    str.fontsize(); 	// Displays a string in a specified size 
    str.italics(); 	    // Displays a string in italic 
    str.link(); 		// Displays a string as a hyperlink 
    str.small(); 	    // Displays a string in a small font 
    str.strike(); 	    // Displays a string with a strikethrough 
    str.sub(); 		    // Displays a string as subscript 
    str.sup(); 		    // Displays a string as superscript 
}