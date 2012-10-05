// http://developer.mozilla.org/en/docs/AJAX

// 1. Create XMLHttp object
if (window.XMLHttpRequest) { // Mozilla, Safari, ...
    http_request = new XMLHttpRequest();
} else if (window.ActiveXObject) { // IE
    http_request = new ActiveXObject("Microsoft.XMLHTTP");
}

// 2. Assign the function that will be called when XMLHttp object is ready
http_request.onreadystatechange = nameOfTheFunction;

// 3. Make the request to the server
http_request.open('GET', 'http://www.example.org/some.file', true);
http_request.send(null);
// OR:
http_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
http_request.open('POST', 'http://www.example.org/some.file', true);
http_request.send('name=value&anothername=othervalue&so=on');

// 4. Handle the server response
function alertContents(http_request) {
       if (http_request.readyState == 4) {
            if (http_request.status == 200) {
                alert(http_request.responseText);
            } else {
                alert('There was a problem with the request.');
        }
    }
}