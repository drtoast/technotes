def booleans() {
    // defining with initial value of "false":
    var b=new Boolean();
    var b=new Boolean(0);
    var b=new Boolean(null);
    var b=new Boolean("");
    var b=new Boolean(false);
    var b=new Boolean(NaN);

    // defining with initial value of "true":
    var b=new Boolean(true);
    var b=new Boolean("true");
    var b=new Boolean("false");
    var b=new Boolean("Richard");
    
    // methods:
    b.toSource();  	    // Represents the source code of an object  
    b.toString(); 	    // Converts a Boolean value to a string and returns the result 
    b.valueOf(); 	    // Returns the primitive value of a Boolean object
}