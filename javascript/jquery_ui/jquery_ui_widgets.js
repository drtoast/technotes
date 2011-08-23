// http://docs.jquery.com/UI_Developer_Guide#The_widget_factory
// http://bililite.com/blog/understanding-jquery-ui-widgets-a-tutorial/

// create the widget:
$(document).ready(function() {
  $('form.lab_note_form').myWidget();
});

// manipulate the widget:
$('form.lab_note_form').myWidget('value');


// define the widget:

$.widget("ui.myWidget", {
  // default options
  options: {
    option1: "defaultValue",
    hidden: true
  },
  _create: function() {
    // creation code for mywidget
    // can use this.options
    if (this.options.hidden) {
      // and this.element
      this.element.hide(); 
    }
  },
  _doSomething: function() {
     // internal functions should be named with a leading underscore
     // manipulate the widget
  },
  value: function() {
    // calculate some value and return it
    return this._calculate();
  },
  length: function() {
    return this._someOtherValue();
  },
  destroy: function() {
      $.Widget.prototype.destroy.apply(this, arguments); // default destroy
       // now do other stuff particular to this widget
  }
});