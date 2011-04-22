function dom_document() {
    // Represents the entire HTML document and can be used to access all elements in a page

    // example:
    document.title = "Some Page Title";

    // collections:
    document.anchors[]; 
    document.forms[];
    document.images[]; 
    document.links[];
    
    // properties:
    document.cookie;  	    // Sets or returns all cookies associated with the current document  
    document.domain; 		// Returns the domain name for the current document 
    document.lastModified; 	// Returns the date and time a document was last modified 
    document.referrer; 	    // Returns the URL of the document that loaded the current document 
    document.title; 		// Returns the title of the current document 
    document.URL; 		    // Returns the URL of the current document
    document.readyState;    // Returns the (loading) status of the document

    // methods:
    document.close();	                // Closes the output stream previously opened with document.open()
    document.getElementById('blah');	// Accesses the first element with the specified id
    document.getElementsByName('blah');	// Accesses all elements with a specified name
    document.getElementsByTagName('p');	// Accesses all elements with a specified tagname
    document.open();	                // Opens an output stream to collect the output from document.write() or document.writeln()
    document.write("<b>hello</b>");	    // Writes HTML expressions or JavaScript code to a document
    document.writeln("<b>hello</b>");	// Same as write(), but adds a newline character after each statement

    // Anchor;  Represents an <a> element
    // Area         Represents an <area> element inside an image-map
    // Base         Represents a <base> element
    // Body         Represents the <body> element
    // Button       Represents a <button> element
    // Event        Represents the state of an event
    // Form         Represents a <form> element
    // Frame        Represents a <frame> element
    // Frameset     Represents a <frameset> element
    // Iframe       Represents an <iframe> element
    // Image        Represents an <img> element
    // Input button     Represents a button in an HTML form
    // Input checkbox   Represents a checkbox in an HTML form
    // Input file   Represents a fileupload in an HTML form
    // Input hidden     Represents a hidden field in an HTML form
    // Input password   Represents a password field in an HTML form
    // Input radio  Represents a radio button in an HTML form
    // Input reset  Represents a reset button in an HTML form
    // Input submit     Represents a submit button in an HTML form
    // Input text   Represents a text-input field in an HTML form
    // Link     Represents a <link> element
    // Meta     Represents a <meta> element
    // Option   Represents an <option> element
    // Select   Represents a selection list in an HTML form
    // Style    Represents an individual style statement
    // Table    Represents a <table> element
    // TableData    Represents a <td> element
    // TableRow     Represents a <tr> element
    // Textarea     Represents a <textarea> element
}