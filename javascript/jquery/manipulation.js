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
    // get form value:
    $('select.foo option:selected').val();
    // set an attribute value
    $('#greatphoto').attr('alt', 'Beijing Brush Seller');
    // remove an attribute value
    $("button").click(function () {
      $(this).next().removeAttr("disabled")
      .focus()
      .val("editable now");
    });
}

function getting_and_changing_class() {
    // add class
    $("p").addClass("myClass yourClass");
    // remove class
    $('p').removeClass('myClass noClass').addClass('yourClass');
    // detect class (returns true/false)
    $('#mydiv').hasClass('foo');
    // add or remove class, alternating
    $('div.tumble').toggleClass('bounce');
    // add if true, remove if false
    $('div.tumble').toggleClass('bounce', true);
}

function getting_and_changing_style() {
    // get css property
    $('div.left').css('background-color');
    // set css property
    $('div.left').css({'background-color': '#ffe', 'border-left': '5px solid #ccc'});
    // get height
    $("div").height();
    // set height
    $("div").height(200);
    // get width
    $("div").width();
    // set width
    $("div").width(200);
    // get inner height (including padding but not border)
    $("p:first").innerHeight();
    // get inner width (including padding but not border)
    $("p:first").innerWidth();
    // get coordinates of first element, relative to the document
    $("p:last").offset();
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
    $('p').after('<p>Hello</p>');
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
    // remove parents of element, leaving the matched element in their place
    $("p").unwrap();
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
    // remove all matched elements, keeping jQuery data in case of later reinsertion: 
    $("thing").detach(expr);
    // remove parents of element, leaving the matched element in their place
    $("p").unwrap();
}

function copying() {
    // clone matched elements: 
    $("thing").clone();
    // clone matched elements and their event handlers: 
    $("thing").clone(bool);
}