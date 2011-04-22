function arrays() {
    // defining:
    var arr=new Array();
    arr[0]="Saab";
    arr[1]="Volvo";
    arr[2]="BMW";
    var arr=new Array("Saab","Volvo","BMW");

    // properties:
    arr.length;

    // methods:
    arr.concat();  	// Joins two or more arrays and returns the result  
    arr.join(); 	// Puts all the elements of an array into a string. The elements are separated by a specified delimiter 
    arr.pop(); 		// Removes and returns the last element of an array 
    arr.push(); 	// Adds one or more elements to the end of an array and returns the new length 
    arr.reverse(); 	// Reverses the order of the elements in an array 
    arr.shift(); 	// Removes and returns the first element of an array 
    arr.slice(); 	// Returns selected elements from an existing array 
    arr.sort(); 	// Sorts the elements of an array 
    arr.splice(); 	// Removes and adds new elements to an array 
    arr.toSource(); // Represents the source code of an object 
    arr.toString(); // Converts an array to a string and returns the result 
    arr.unshift(); 	// Adds one or more elements to the beginning of an array and returns the new length 
    arr.valueOf(); 	// Returns the primitive value of an Array object
}