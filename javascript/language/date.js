function dates() {
    // defining (instantiates with current date and time):
    var d = new Date();

    // methods:
    Date();  	            // Returns today's date and time  
    d.getDate(); 	        // Returns the day of the month from a Date object (from 1-31) 
    d.getDay(); 	        // Returns the day of the week from a Date object (from 0-6) 
    d.getMonth(); 	        // Returns the month from a Date object (from 0-11) 
    d.getFullYear(); 	    // Returns the year, as a four-digit number, from a Date object
    d.getHours(); 	        // Returns the hour of a Date object (from 0-23) 
    d.getMinutes(); 	    // Returns the minutes of a Date object (from 0-59) 
    d.getSeconds(); 	    // Returns the seconds of a Date object (from 0-59) 
    d.getMilliseconds(); 	// Returns the milliseconds of a Date object (from 0-999) 
    d.getTime(); 	        // Returns the number of milliseconds since midnight Jan 1, 1970 
    d.getTimezoneOffset();  // Returns the difference in minutes between local time and Greenwich Mean Time (GMT) 
    d.getUTC...(); 	        // Get UTC time fields
    d.parse(); 	            // Takes a date string and returns the number of milliseconds since midnight of January 1, 1970 
    d.setDate(); 	        // Sets the day of the month in a Date object (from 1-31) 
    d.setMonth(); 	        // Sets the month in a Date object (from 0-11) 
    d.setFullYear(); 	    // Sets the year in a Date object (four digits) 
    d.setHours(); 	        // Sets the hour in a Date object (from 0-23) 
    d.setMinutes(); 	    // Set the minutes in a Date object (from 0-59) 
    d.setSeconds(); 	    // Sets the seconds in a Date object (from 0-59) 
    d.setMilliseconds(); 	// Sets the milliseconds in a Date object (from 0-999) 
    d.setTime();   	        // Calculates a date and time by adding or subtracting a specified number of milliseconds to/from midnight January 1, 1970 
    d.setUTC...(); 	        // Sets date parameters in Universal Time
    d.toSource(); 	        // Represents the source code of an object 
    d.toString(); 	        // Converts a Date object to a string 
    d.toLocaleString(); 	// Converts a Date object, according to local time, to a string 
    d.UTC(); 	            // Takes a date and returns the number of milliseconds since midnight of January 1, 1970 according to universal time 
    d.valueOf(); 	        // Returns the primitive value of a Date object 
}