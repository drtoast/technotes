# Disable two-finger swipe navigation

    defaults write com.google.Chrome.plist AppleEnableSwipeNavigateWithScrolls -bool FALSE

# Profile Javascript CPU usage

* Select "Tree (Top Down)"
* Sort by "Total"
* drill down

# Debugger

* continue (cmd /)
* step over (cmd ')
* step into (cmd ;)
* step out (shift cmd ;)
* next call frame (ctrl .)
* prev call frame (ctrl ,)

# Console

print time between events

    console.time('ajax');
    // do something, then:
    console.timeEnd('ajax');

print dom-level view of an object

    element = $('#something')[0];
    console.dir(element);

show element in browser

    console.inspect(element);

get reference to selected element in inspector

    element = $0;
    element.outerHTML;
    $element = $($0); // as jQuery

select elements on page

    $$('div .foo');

monitor events on an object

    console.monitorEvents($$('textarea')[0]);
    console.monitorEvents($$('textarea')[0], 'key'); // only keyboard events

print keys or values of an object

    console.keys(obj);
    console.values(obj);

copy to clipboard

    console.copy(foo);

clear the console

    ctrl-k
    console.clear();
