// http://api.jquery.com/category/manipulation/

function getting_and_changing_contents() {
    // get html contents: 
    $("thing").html();
    // set html contents: 
    $("thing").html("<b>yo</b>");
    // get text contents: 
    $("thing").text();
    // set text contents: 
    $("thing").text("hello");
}

function inserting_inside() {
    // append content to the inside of matched elements: 
    $("p").append("<strong>Hello</strong>");
    // append matched elements to other specified elements: 
    $("span").appendTo("#foo");
    // prepend to the inside of matched elements: 
    $("p").prepend("<b>Hello </b>");
    // prepend matched elements to other specified elements: 
    $("span").prependTo("#foo");
}

function inserting_outside() {
    // insert content after matched elements: 
    $("p").append("<strong>Hello</strong>");
    // insert content before matched elements: 
    $("p").before("<b>Hello</b>");
    // insert matched element after other specified elements: 
    $("p").insertAfter("#foo");
    // insert matched element before other specified elements: 
    $("p").insertBefore("#foo");
}

function wrapping() {
    // wrap html around elements: 
    $("p").wrap("<div></div>");
    // wrap jQuery element around elements: 
    $("p").wrap(document.createElement("div"));
    // wrap all elements in a single html element: 
    $("p").wrapAll("<div></div>");
    // wrap all elements in a single jQuery element: 
    $("p").wrapAll(document.createElement("div"));
    // wrap html around inner child contents of each element: 
    $("p").wrapInner("<b></b>");
    // wrap jQuery element around inner child contents of each element: 
    $("p").wrapInner(document.createElement("b"));
}

function replacing() {
    // replace with HTML or DOM elements:  
    $(this).replaceWith("<div>" + $(this).text() + "</div>");
    // replace matched elements with other matched elements: 
    $("<b>Paragraph. </b>").replaceAll("p");
}

function removing() {
    // remove all child nodes: 
    $("thing").empty();
    // remove all matched elements: 
    $("thing").remove(expr);
}

function copying() {
    // clone matched elements: 
    $("thing").clone();
    // clone matched elements and their event handlers: 
    $("thing").clone(bool);
}