function conditionals() {
    if (condition) { 
        do something
    } else if (condition) { 
        do something 
    } else { 
        do something 
    };
    
    // shorthand
    var greeting = (visitor=="PRES") ? "Dear President " : "Dear ";
}


function loops() {
    // for/in: iterate over members of a collection
    var x;
    var mycars = new Array();
    mycars[0] = "Saab";
    mycars[1] = "Volvo";
    mycars[2] = "BMW";
    for (x in mycars) {
       document.write(mycars[x] + "<br />");
    }
    
    // break/continue: exit/continue a loop
    for (i=0;i<=10;i++) {
       if (i==3){
          break;
       }
       document.write("The number is " + i);
       document.write("<br />");
    }
}