// create a chainable function that can be called on any jQuery object
// $('.completion a').myFunc();
jQuery.fn.extend({
    myFunc:function() {
        // do something to elements, return them
        return this.each(function() {
        ....
        });
    },
});