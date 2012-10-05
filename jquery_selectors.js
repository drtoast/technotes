// http://api.jquery.com/category/selectors/

/*

All Elements	            *
All P Elements              p
All Child Elements	        p > *
Descendent Element          p table
Element By ID	            #foo
Element By Class	        .foo
Element With Attribute	    *[title]
First Child of All P	    p > *:first-child
All P with an A child	    Not possible
Next Element	            p + *

*/

function within_context() {
    $('div.foo').click(function() {
    // only search for 'span' tags within div.foo
      $('span', this).addClass('bar');
    });
}

function basic_selectors() {
    // by id: 
    $("#timer-bar").css("border","3px solid blue");
    // by class: 
    $(".handle").css("border","3px solid red");
    // by tag name: 
    $("title");
    $("ul");
    $("div").css("border","9px solid red");
    // by XPath:
    $('input[type="text"]');
}

function hierarchy_selectors() {
    // child: 
    $("ul.topnav > li").css("border", "3px double red");
    // descendant: 
    $("form input").css("border", "2px dotted blue");
    // next to: 
    $("label + input").css("color", "blue").val("Labeled!");
    // siblings: 
    $("#prev ~ div").css("border", "3px groove blue");
}

function position_filters() {
    // first: 
    $("tr:first").css("font-style", "italic");
    // last: 
    $("tr:last").css({backgroundColor: 'yellow', fontWeight: 'bolder'});
    // not: 
    $("input:not(:checked) + span").css("background-color", "yellow");
    // even: 
    $("tr:even").css("background-color", "#bbbbff");
    // odd: 
    $("tr:odd").css("background-color", "#bbbbff");
    // by index: 
    $("td:eq(2)").css("color", "red");
    // greater than index: 
    $("td:gt(4)").css("text-decoration", "line-through");
    // less than index: 
    $("td:lt(4)").css("color", "red");
    // header(h1,h2,etc): 
    $(":header").css({ background:'#CCC', color:'blue' });
}

function content_filters() {
    // contains text: 
    $("div:contains('John')").css("text-decoration", "underline");
    // empty (no children): 
    $("td:empty").text("Was empty!").css('background', 'rgb(255,220,200)');
    // has matching element: 
    $("div:has(p)").addClass("test");
    // parent: 
    $("td:parent").fadeTo(1500, 0.3);
}

function visibility_filters() {
    // hidden: 
    $("div:hidden").show(3000);
    // visible: 
    // $("div:visible").click(function ()...
}

function attribute_filters() {
    // has attribute: 
    $("div[id]")
    // equals this value: 
    $("input[name='newsletter']").next().text(" is newsletter");
    // does not equal this value: 
    $("input[name!=newsletter]").next().append("<b>; not newsletter</b>");
    // starts with: 
    $("input[name^='news']").val("news here!");
    // ends with: 
    $("input[name$='letter']").val("a letter");
    // contains string:
    $('input[name*="man"]').val('has man in it!');
    // contains word:
    $('input[name~="man"]').val('mr. man is in it!');
    // equals, or starts with plus hyphen ("en" or "en-us")
    $('a[hreflang|="en"]').css('border','3px dotted green');
    // multiple attributes: 
    $("input[id][name$='man']").val("only this one");
}

function child_filters() {
    // nth child: 
    $("ul li:nth-child(2)").append("<span> - 2nd!</span>");
    // first child: 
    $("div span:first-child").css("text-decoration", "underline");
    // last child: 
    $("div span:last-child").css({color:"red", fontSize:"80%"})
    // only child: 
    $("div button:only-child").text("Alone").css("border", "2px blue solid");
}

function form_selectors() {
    // inputs: 
    $(":input");
    // text: 
    $("form input:text").css({background:"yellow", border:"3px red solid"});
    // radio: 
    $("form input:radio").wrap('<span></span>').parent().css({background:"yellow", border:"3px red solid"});
    // checkbox: 
    $("form :checkbox");
    // submit: 
    $(":submit").parent('td');
    // image: 
    $(":image");
    // reset: 
    $(":reset");
    // button: 
    $(":button");
    // file: 
    $(":file");
}

function form_filters() {
    // enabled: 
    $("input:enabled").val("this is it");
    // disabled: 
    $("input:disabled").val("this is it");
    // checked: 
    $("input:checked").length;
    // selected: 
    $("select option:selected");
}

function refine_found_set() {
    // search all descendants: 
    $('#timer').find('a');
    // filter the initial results: 
    $('#timer').filter('div').fadeIn();
}

function selectors() {
    basic_selectors();
    hierarchy_selectors();
    position_filters();
    content_filters();
    visibility_filters();
    attribute_filters();
    child_filters();
    form_selectors();
    form_filters();
    refine_found_set();
}
