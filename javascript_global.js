function global() {
    decodeURI("http://blah/%20%21");	// Decodes a URI
    decodeURIComponent()	            // Decodes a URI component
    encodeURI("http://blah/@#$%")	    // Encodes a URI
    encodeURIComponent()	            // Encodes a URI component
    escape("blah!")	        // Encodes a string
    eval("1 + 2")	        // Evaluates a string and executes it as if it was script code
    isFinite(1)	            // Determines whether a value is a finite, legal number
    isNaN(1)	            // Determines whether a value is an illegal number
    Number("1")	            // Converts an object's value to a number
    parseFloat("1.25")	    // Parses a string and returns a floating point number
    parseInt("1.25")	    // Parses a string and returns an integer
    String(1)	            // Converts an object's value to a string
    unescape("%20%21")	    // Decodes an encoded string
}