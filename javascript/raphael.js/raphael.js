// http://raphaeljs.com/
// high-level JavaScript SVG drawing library


// EXAMPLE

var paper = Raphael(10, 50, 320, 200);
var circle = paper.circle(50, 40, 10);
circle.attr("fill", "#f00");
circle.attr("stroke", "#fff");


// DRAWING

var paper = Raphael(10, 50, 320, 200);  // 320 × 200 at 10, 50
var paper = Raphael(document.getElementById("notepad"), 320, 200);
var paper = Raphael("notepad", 320, 200); // same as above

var c = paper.circle(50, 50, 40); // x, y, radius
var c = paper.rect(40, 40, 50, 50, 10); // x, y, w, h, corner radius
var c = paper.ellipse(50, 50, 40, 20); // x, y, horizontal radius, vertical radius
var c = paper.image("apple.png", 10, 10, 80, 80); // src, x, y, w, h

// create an array of elements and manipulate them all at once
var st = paper.set();
st.push(
    paper.circle(10, 10, 5),
    paper.circle(30, 10, 5)
);
st.attr({fill: "red"});

var t = paper.text(50, 50, "Raphaël\nkicks\nbutt!"); // x, y, text
var c = paper.path("M10 10L90 90"); // Path data in SVG path string format (move to 10,10, line to 90,90)


// MANIPULATING

paper.clear(); // remove all elements

var c = paper.circle(10, 10, 10);
c.node.onclick = function () {
    c.attr("fill", "red");
};

c.remove(); // remove element from the DOM
c.hide() // make element invisible
c.show() // make element visible
rotate
translate
scale
attr
animate
stop
animateWith
animateAlong
animateAlongBack
getBBox
toFront
toBack
insertBefore
insertAfter
clone
raphael
getTotalLength
getPointAtLength
getSubpath
setSize
setWindow
getRGB
angle
rad
deg
snapTo
getColor
getColor.reset
registerFont
getFont
print
