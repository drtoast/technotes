https://developers.google.com/chrome-developer-tools/docs/tips-and-tricks

# Disable two-finger swipe navigation

    defaults write com.google.Chrome.plist AppleEnableSwipeNavigateWithScrolls -bool FALSE

# Profile Javascript CPU usage

* Select "Tree (Top Down)"
* Sort by "Total"
* drill down


# Find Memory Leaks

* Go to Profiles panel, perform action, take heap snapshot
* Repeat 3 times
* Select last snapshot
* Change filter "All Objects" to "Objects between Snapshots 1 and 2"
* Select object and look at list of retainers in retaining tree


# Styles

* show all allowed property values (ctrl-space)


# Cache

* clear cache (Network/ctrl-click)


# Console

shortcuts:

* open Inspector (cmd-option-I)
* open JS console (cmd-option-J)
* open JS console from any inspector tab (esc)
* open inspector to click on element (cmd-shift-C)

display data in a table

    console.table(data)

print time between events

    console.time('ajax');
    // do something, then:
    console.timeEnd('ajax');

performance profile

    console.profile("Processing")
    // do something, then
    console.profileEnd()
    // added to inspector and profiles array
    console.profiles

timeline profile

    // add annotation to timeline recording
    console.timeStamp("Processing")


print dom-level view of an object

    element = $('#something')[0];
    console.dir(element);

print colored text

    console.log('%c Hello', 'background-color:yellow;')

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
