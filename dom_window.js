function dom_window() {
    // The top level object in the JavaScript hierarchy. 
    // The Window object represents a browser window. 
    // A Window object is created automatically with every instance of a <body> or <frameset> tag

    // properties:
    window.closed;  	        // Returns whether or not a window has been closed  
    window.defaultStatus; 	    // Sets or returns the default text in the statusbar of the window 
    window.document; 	        // Returns a reference to the Document object that the window contains.
    window.history; 	        // Returns a reference to the History object 
    window.location; 	        // Gets/sets the location, or current URL, of the window object.
    window.name; 		        // Sets or returns the name of the window 
    window.parent; 		        // Returns the parent window 
    window.status; 		        // Sets or returns the text in the statusbar of the window 
    window.statusbar; 	        // Returns the statusbar object, whose visibility can be toggled in the window.
    window.toolbar;		        // Returns the toolbar object, whose visibility can be toggled in the window

    // methods:
    window.alert();  	        // Displays an alert box with a message and an OK button  
    window.blur(); 		        // Removes focus from the current window 
    window.close(); 	        // Closes the current window 
    window.confirm(); 	        // Displays a dialog box with a message and an OK and a Cancel button 
    window.focus(); 	        // Sets focus on the current window 
    window.moveBy(); 	        // Moves the window a specified number of pixels in relation to its current co-ordinates 
    window.moveTo(); 	        // Moves the window's left and top edge to the specified co-ordinates 
    window.open(); 		        // Opens a new browser window 
    window.print(); 	        // Prints the contents of the current window 
    window.prompt(); 	        // Displays a dialog box that prompts the user for input 
    window.resizeTo(); 	        // Resizes the window to the specified width and height 
    window.scrollBy(); 	        // Scrolls the content by the specified number of pixels 
    window.scrollTo(); 	        // Scrolls the content to the specified coordinates 
    window.setInterval(); 	    // Evaluates an expression at specified intervals 
    window.setTimeout(); 	    // Evaluates an expression after a specified number of milliseconds 
    window.stop(); 	            // Cancels the current download (same as clicking the browser's Stop button)
}
