// https://developer.mozilla.org/en-US/docs/Gecko_DOM_Reference


function dialogs() {
    // Alert box with "OK" button:
    alert("sometext");
    // Confirm box with "OK/Cancel", returns true or false:
    confirm("sometext");
    // Prompt box with text field, "OK/Cancel":
    prompt("sometext","defaultvalue");
}

function dom_example() {
    paragraphs = document.getElementsByTagName("P");
    // paragraphs[0] is the first <p> element
    // paragraphs[1] is the second <p> element, etc.
    alert(paragraphs[0].nodeName);
}

function dom_navigator() {
    // Contains information about the client's browser
    navigator;
}


function dom_screen() {
    // Contains information about the client's display screen
    screen;
}


function dom_history() {
    // Contains the visited URLs in the browser window
    history;
}

function dom_location() {
    // Contains information about the current URL
    location;
}

