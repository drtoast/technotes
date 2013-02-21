// http://www.youtube.com/watch?v=4mf_yNLlgic
// http://code.google.com/chrome/devtools/docs/console.html

// show XMLHttpRequests, preserve log: control-click

/*
KEYBOARD SHORTCUTS:

* toggle dev tools (cmd-opt-i)
* toggle dev tools and open console (cmd-opt-j)
* show shortcuts (?)
* go to prev/next panel (cmd-[, cmd-])
*/


// print time between events
console.time('ajax');
// do something, then:
console.timeEnd('ajax');

// print dom-level view of an object
element = $('#something')[0];
console.dir(element);

// show element in browser
console.inspect(element);

// get reference to selected element in inspector
element = $0;
element.outerHTML;
$element = $($0); // as jQuery

// select elements on page
$$('div .foo');

// monitor events on an object
console.monitorEvents($$('textarea')[0]);
console.monitorEvents($$('textarea')[0], 'key'); // only keyboard events

// print keys or values of an object
console.keys(obj);
console.values(obj);

// copy to clipboard
console.copy(foo);

// clear the console
console.clear();
