//// STRUCTURE

//// setup: (origin [0, 0] is at upper left of screen)
void setup()			// set up initial environment properties before loop() begins running
size(width, height);	// size of display window
loop()					// continuously execute code contained in its block
HLine h1 = new Hline();			// create a new object: HLine h1 = new Hline();
background(0); 
noFill(); 
stroke(255); 


//// ENVIRONMENT
width			// system variable with display window's width
height			// system variable with display window's height
framerate(fps)	// specifies number of frames per second
delay(ms)		// pause program for specified number of milliseconds
smooth()		// draw any following geometry with anti-aliased edges
noSmooth()		// draw any following geometry with aliased edges
cursor()		// turn on the cursor if hidden via noCursor()
cursor(MODE)	// change cursor, where MODE is one of ARROW,CROSS,HAND,MOVE,TEXT,WAIT
cursor(image,x,y)	// where image is variable of type BImage, x/y = active spot of cursor
noCursor()		// hide cursor (won't work when running in web browser)
save(filename)	// make an image from display window, saved as tif (.tif) or targa (.tga)
saveFrame()		// called in a loop, saves frames as screen-0000.tif, screen-0001.tif, etc
saveFrame("filename-####.ext")	// saves frames with the specified template filename


//// DATA

//primitive
int				// 32-bit integer
float			// 32-bit float
char			// unicode-format 16-bit (2 byte) character (escape with backslash: \377 = delete)
byte			// 8-bit signed int, 127 to -128
boolean			// true or false
color			// datatype for storing color values created with get and color() functions
color c1 = color(204, 153, 0); 
color c2 = #FFCC00; 

//composite
String			// a sequence of characters "ABCDE" etc
	String var = "text";
	var.length();
Array			// a list of data, can be any data type, create with "new datatype[length]"
	int[] numbers = new int[3];
	numbers[0] = 90;
	numbers.length();
Object			// instance of a class (SEE SECTION ON OBJECTS BELOW)

//conversion
int(value)		// convert another primitive type to int (int,float,char,byte,boolean,color)
	int i = int(245.456);
float(value)	// convert another primitive type to float (int,float,char,byte,boolean,color)
	float f = float(true);
char(value)		// convert another primitive type to numeric character (int,float,char,byte,boolean,color)
	char c = char(126);
byte(value)		// convert another primitive type to byte (int,float,char,byte,boolean,color)
	byte b = byte(260);

//parsing
splitInts(string,char)		// split a string of ints into an array of ints
	String numbers = "8,67,5,309"; 
	int list[] = splitInts(numbers, ','); 
splitFloats(string,char)	// split a string of floats into an array of floats
	String numbers = "8.67,5.309,1.334"; 
	float list[] = splitFloats(numbers, ','); 
splitStrings(string,char)	// split a group of strings into an array
	String words = "apple,bear,cat,dog"; 
	String list[] = splitStrings(words, ','); // or '\t' for tab-delimited
join(array,separator)			// combine an array of elements into a string separated by string "separator"
join(array,separator,digits)	// specify number of digits to pad left side with zeroes
join(array,separator,left,right)// specify digits to left/right of float's decimal point
	String formatted = join(textlist, ", ");		// "some, test, text"
	String withzeroes = join(intlist, " ", 3); 		// "008 067 005"
	String zerofloats = join(floatlist, " ", 3, 2); // "001.30 092.80 007.70"
sort(array)		// sort an array of numbers from smallest to largest, words in alphabetical order

//formatting
nf(intValue,digits)				// int to string: specify number of digits to pad left side with zeroes
nf(floatValue,left,right)		// floast to string: specify digits to left/right of float's decimal point


//// CONTROL

while (i < 80) { statements }
for (int i=5; i<height; i+=5) { statements }
if (i < 35) { statements } else { otherstatements }
if (i < 35) { statements } else if (i > 50) { otherstatements }
> < >= <= == != || && !		// the usual


//// SHAPE

// 2D
point(x1, y1);						// draw 2d point
point(x1, y1, z1); 					// draw 3d point
line(x1, y1, x2, y2);				// draw 2d line
line(x1, y1, z1, x2, y2, z2);		// draw 3d line
triangle(x1, y1, x2, y2, x3, y3);	// draw triangle
quad(x1, y1, x2, y2, x3, y3, x4, y4);	// draw quadrilateral
rect(x, y, width, height);			// draw rectangle (x,y=origin)
  rectMode(CORNER|CORNERS|CENTER_DIAMETER);	// specify origin of rectangle
ellipse(x, y, width, height);		// draw ellipse (x,y=origin)
  ellipseMode(CORNER|CORNERS|CCENTER_DIAMETER|CENTER_RADIUS);	// specify origin of ellipse
curve(x1, y1, x2, y2, x3, y3, x4, y4);	// draw a curve along four points
bezier(x1, y1, x2, y2, x3, y3, x4, y4); // bezier curve: anchor1,control1,anchor2,control2

// 3D
box(size);					// draw a cube
box(width,height,depth)		// specify width(x-dimension), height(y-dimension), depth(z-dimension)
sphere(radius);				// draw a sphere
sphereDetail(n);			// specify number of vertices in sphere (default 30)

// stroke
stroke(153);				// set the stroke color
strokeWeight(width);		// set width in pixels for border around a shape

// vertex
beginShape(mode);			// begin drawing a shape, where "mode" is
	// either LINES, LINE_STRIP, LINE_LOOP, TRIANGLES, TRIANGLE_STRIP, QUADS, QUAD_STRIP, POLYGON
endShape();					// end a shape begun with beginShape()
vertex(x, y);				// draw a vertex for a 2d shape
vertex(x, y, z);			// draw a vertex for a 3d shape
curveVertex(x, y);			// draw a curved vertex 2d
curveVertex(x, y, z);		// draw a curved vertex 3d
bezierVertex(x, y);			// draw a bezier vertex 2d
bezierVertex(x, y, z);		// draw a bezier vertex 3d



//// INPUT/OUTPUT

//mouse
mouseX			// system variable with current horiz coord of mouse
mouseY			// system variable with current vert coord of mouse
pmouseX			// system variable with previous horiz coord of mouse
pmouseY			// system variable with previous vert coord of mouse
mousePressed	// system variable with "true" if button is pressed, "false" if not
mousePressed()	// function called whenever mouse is pressed
mouseReleased()	// function called whenever mouse is released
mouseMoved()	// function called whenever mouse is moved AND button IS NOT pressed
mouseDragged()	// function called whenever mouse is moved AND button IS pressed

//keyboard
keyPressed		// system variable with "true" if any key is pressed, "false" if not
key				// system variable with the value of most recently pressed key. special values include UP,DOWN,LEFT,RIGHT,ALT,CONTROL,SHIFT
keyPressed()	// function called whenever a key is pressed
keyReleased()	// function called whenever a key is released

//time&date
millis()	// number of milliseconds since starting an applet
second()	// current second (0-59)
minute()	// current minute (0-59)
hour()		// current hour (0-23)
day()		// current day (1-31)
month()		// current month (1-12)
year()		// current year (YYYY)

//text output
print(text)		// writes to text output area
println(text)	// writes a new line if text to text output area

//files
loadStrings(filename)			// read contents of a file or URL, create a String array of individual lines
loadBytes(filename)				// read contents of a file or URL, create in a byte array
saveStrings(filename, strings)	// writes an array of strings to a file, one line per string
saveBytes(filename, bytes)		// writes an array of bytes to a file

//web
link(url)						// opens URL in current browser
link(url, target)				// opens URL in specified window ('_new' etc)
param(string)					// read value of that param in a web browser
status(text)					// display message in browser's status area
online(text)					// "true" if program is running in a browser, "false" if not


//// TRANSFORM

translate(x,y)					// move objects in 2D space
translate(x,y,z)				// move objects in 3D space
rotate(angle)					// rotate object (in radians) relative to origin
	rotate(PI/3.0);
rotateX(angle)					// rotate object (in radians) around X axis
rotateY(angle)					// rotate object (in radians) around Y axis
rotateZ(angle)					// rotate object (in radians) around Z axis
scale(size)						// scale object by "size" multiplier (2.0 = 200%)
scale(x,y)						// scale object by x times on the x axis, y times on the y axis
scale(x,y,z)					// scale object by specified multipliers on x,y,z axis
push()							// push current transformation matrix onto matrix stack
pop()							// pop the current transformation matrix off of matrix stack


//// LIGHTS AND CAMERA

//lights
lights()						// enables lighting (use light() to specify lighting parameters)
noLights()						// disables lighting

//camera
screenX(x,y,z)		// takes 3D x,y,z position and returns the "x" value for where it will appear on 2D screen
screenY(x,y,z)		// takes 3D x,y,z position and returns the "y" value for where it will appear on 2D screen
screenZ(x,y,z)		// takes 3D x,y,z position and returns the "z" value for where it will appear on 2D screen


//// COLOR

//setting
background(r,g,b)	// set background color in colorMode(RGB)
background(h,s,b)	// set background color in colorMode(HSB)
background(image)	// set background as BImage
stroke(gray)		// set stroke color as a shade of gray (0=black, 255=white)
stroke(r,g,b)		// set stroke color in colorMode(RGB)
stroke(h,s,b)		// set stroke color in colorMode(HSB)
stroke(color)		// set stroke color with an object of type "color"
noStroke()			// disables drawing of outlines
fill(gray)			// set fill color as a shade of gray (0=black, 255=white)
fill(gray,alpha)	// ... with alpha channel
fill(r,g,b)			// set fill color in colorMode(RGB)
fill(r,g,b,a)		// ... with alpha channel
fill(h,s,b)			// set fill color in colorMode(HSB)	
fill(h,s,b,a)		// ... with alpha channel
fill(color)			// set fill color as object of type "color"
noFill()			// disable filling geometry
colorMode(mode)							// set colormode as RGB or HSB (hue/saturation/brightness)
colorMode(mode, range)					// range for color elements
	colorMode(RGB, 255)					// colors specified as value from 0 to 255 (default)
	colorMode(RGB, 1.0)					// colors specified as value from 0 to 1.0
colorMode(mode, range1, range2, range3)

//creating+reading
color(r,g,b)		// create a color with "color" datatype, in colorMode(RGB)
color(r,g,b,a)		// ... with alpha channel
color(h,s,b)		// create a color with "color" datatype, in colorMode(HSB)
color(h,s,b,a)		// ... with alpha channel
	color c1 = color(102, 102, 0); 
	fill(c1); 
red(color)			// extract red channel from color
green(color)		// extract green channel from color
blue(color)			// extract blue channel from color
hue(color)			// extract hue from color
saturation(color)	// extract saturation from color
brightness(color)	// extract brightness from color


//// IMAGE

BImage				// datatype for storing images (.gif and .jpg)
	BImage img;
	img = loadImage("laDefense.jpg"); 
	image(img, 0, 0); // draw to screen
	img.width		// get width
	img.height		// get height
	img.pixels[]	// array containing the color of every pixel in the image
	img.get(60,90)				// read color of pixel at coordinates (60,90)
	img.get(x,y,width,height)	// get a group of pixels, return as new BImage
	img.set(x,y,color)			// set a pixel with specified color
	img.set(x,y,image)			// write an image into another image
	img.copy()					// copy BImage into another BImage
	img.alpha(alphaImg)			// set another BImage as this image's alpha channel
	img.alpha(array)			// use an int[] array as alpha channel (same length as image)
	img.replicate(sx,sy,dx,dy)	// 
	
/************* programming **************/

//// BASIC PROGRAM STRUCTURE:

void setup() {				// set up initial environment properties before loop() begins running
	size(200, 200);			// size of display window
	background(100,50,10);	// RGB values for background color 
	stroke(255); 			// set line drawing color
	framerate(30);			// set framerate
}

float y;

void loop() {				// function called once per frame
	background(100,50,10);	// Set the background to clear previously drawn pixels
	y = y - 1; 
	if (y < 0) { y = height; } 
	line(0, y, width, y);  
}



//// OBJECTS

HLine h1 = new HLine(20, 1.0);

void setup() { 
  size(200, 200); 
} 

void loop() { 
  if(h1.speed > 1.0) { 
    h1.speed -= 0.01; 
  } 
  h1.update(); 
} 

class HLine { 
  float ypos, speed; 
  HLine (float y, float s) {	// constructor
    ypos = y; 					// instance variable
    speed = s; 					// instance variable
  } 
  void update() {				// method
    ypos += speed; 
    if (ypos > width) { 
      ypos = 0; 
    } 
    line(0, ypos, width, ypos); 
  } 
} 





//// USEFUL FUNCTIONS:


// translucent point (jared tarbell)
void tpoint(int x1, int y1, color myc, float a) {
	if (a>=1.0) {
	  stroke(myc);
	  point(x1,y1);
	} else {
	  int r, g, b;
	  color c;
	
	  c = get(x1, y1);
	
	  r = int(red(c) + (red(myc) - red(c)) * a);
	  g = int(green(c) +(green(myc) - green(c)) * a);
	  b = int(blue(c) + (blue(myc) - blue(c)) * a);
	  color nc = color(r, g, b);
	  stroke(nc);
	  point(x1,y1);
	}
}

// load a color palette from an image (jared tarbell)
void takecolor(String fn) {
  BImage b;
  b = loadImage(fn);
  image(b,0,0);

  for (int x=0;x<b.width;x++){
    for (int y=0;y<b.height;y++) {
      color c = get(x,y);
      boolean exists = false;
      for (int n=0;n<numpal;n++) {
        if (c==goodcolor[n]) {
          exists = true;
          break;
        }
      }
      if (!exists) {
        // add color to pal
        if (numpal<maxpal) {
          goodcolor[numpal] = c;
          numpal++;
        }
      }
    }
  }
}


// circles

void se::SlowCircle(long xcenter,long ycenter, long radius)
{ long x,y;
 for(float theta=0;theta < (2*M_PI);theta+=.01)
  { x=xcenter+(long)(radius*sin(theta));
    y=ycenter+(long)(radius*cos(theta));
    video->quickpixel(x,y,15);
  }
}

 This routine is pretty simple. We use the old sin and cos and inrement theta from 0 to 2 PI. We can then make our circle a known radius by multiplying each sin and cos by the radius variable. The problem with this routine is that it uses the sin and cos functions. These are very slow and simply will not work for our uses. Also, we increment theta by 1/100ths every itteration until we reach 2PI. At best we will make a solid circle, but some points will be written multiple times. Even worse, with larger circles we will skip pixels. We made a circle, but at a very high cost. The next function will do things a lot better, please read on. 

</pre>


