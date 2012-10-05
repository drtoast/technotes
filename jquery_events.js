// http://api.jquery.com/category/events/

function pageload() {
    $(document).ready(function () {
        $("p").text("The DOM is now loaded and can be manipulated.");
    });
}

function event_handling() {
    // bind a handler to one or more events for each element: 
    $("p").bind("mouseenter mouseleave", function(e){
        $(this).toggleClass("over");
    });
    // element is clicked: 
    $("#something").click(function(e) { });
    // bind a handler to one or more events to be executed once: 
    $("div").one("click", function(){ ... });
    // trigger an event on every matched element: 
    $("button:first").trigger('click');
    // trigger all bound event handlers without executing browser defaults: 
    $("input").triggerHandler("focus");
    // unbind an event from elements:  
    $("#theone").unbind('click', aClick);
}

function live_events() {
    // bind a handler for all current and future elements: 
    $("p").live("click", function(){$(this).after("<p>Another paragraph!</p>");});
    // remove a handler: 
    $("#theone").die("click", aClick)
}

function interaction_helpers() {
    // mouse hover:
    $("li").hover(
        function () {
            $(this).append($("<span> ***</span>"));
        }, 
        function () {
            $(this).find("span:last").remove();
        }
    );
    // toggle: 
    $("li").toggle(
        function () {
            $(this).css({"list-style-type":"disc", "color":"blue"});
        },
        function () {
            $(this).css({"list-style-type":"disc", "color":"red"});
        },
        function () {
            $(this).css({"list-style-type":"", "color":""});
        }
    );
}

function event_helpers() {
    // element loses focus: 
    $("input").blur(function () {$(this).next("span").css('display','inline').fadeOut(1000);});
    // element loses focus and value has been modified: 
    $("select").change(function () { ... });
    // element is clicked: 
    $("p").click(function () { $(this).slideUp(); });
    // element is double-clicked: 
    $("div:first").dblclick(function () { $(this).toggleClass('dbl') }); 
    // element receives focus: 
    $("input").focus(function () {$(this).next("span").css('display','inline').fadeOut(1000);});
    // element receives a keydown event: 
    $(window).keydown(function(event){switch (event.keyCode) { ... });
    // element receives a keypress: 
    $("input").keypress(function (e) {if (e.which == 32 ... )});
}