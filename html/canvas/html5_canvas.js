function tri(ctx) {
  // Filled triangle
  ctx.beginPath();
  ctx.moveTo(25,25);
  ctx.lineTo(105,25);
  ctx.lineTo(25,105);
  ctx.fill();

  // Stroked triangle
  ctx.beginPath();
  ctx.moveTo(125,125);
  ctx.lineTo(125,45);
  ctx.lineTo(45,125);
  ctx.closePath();
  ctx.stroke();
}

function rect(ctx) {
  ctx.fillRect(25,25,100,100);
  ctx.clearRect(45,45,60,60);
  ctx.strokeRect(50,50,50,50);
}

function rect_path(ctx) {
  ctx.fillStyle = "#000";
  ctx.beginPath();
  ctx.rect(25,25,100,100);
  ctx.closePath();
  ctx.fill();
}

function smiley(ctx) {
  ctx.beginPath();
  ctx.arc(75,75,50,0,Math.PI*2,true); // Outer circle
  ctx.moveTo(110,75);
  ctx.arc(75,75,35,0,Math.PI,false);   // Mouth (clockwise)
  ctx.moveTo(65,65);
  ctx.arc(60,65,5,0,Math.PI*2,true);  // Left eye
  ctx.moveTo(95,65);
  ctx.arc(90,65,5,0,Math.PI*2,true);  // Right eye
  ctx.stroke();
}

function arcs(ctx) {
  for(var i=0;i<4;i++){
    for(var j=0;j<3;j++){
      ctx.beginPath();
      var x              = 25+j*50;               // x coordinate
      var y              = 25+i*50;               // y coordinate
      var radius         = 20;                    // Arc radius
      var startAngle     = 0;                     // Starting point on circle
      var endAngle       = Math.PI+(Math.PI*j)/2; // End point on circle
      var anticlockwise  = i%2==0 ? false : true; // clockwise or anticlockwise

      ctx.arc(x,y,radius,startAngle,endAngle, anticlockwise);

      if (i>1){
        ctx.fill();
      } else {
        ctx.stroke();
      }
    }
  }
}

function qcurve(ctx) {
  // Quadratric curves example
  ctx.beginPath();
  ctx.moveTo(75,25);
  ctx.quadraticCurveTo(25,25,25,62.5);
  ctx.quadraticCurveTo(25,100,50,100);
  ctx.quadraticCurveTo(50,120,30,125);
  ctx.quadraticCurveTo(60,120,65,100);
  ctx.quadraticCurveTo(125,100,125,62.5);
  ctx.quadraticCurveTo(125,25,75,25);
  ctx.stroke();
}

function bcurve(ctx) {
  // Bezier curves example
  ctx.beginPath();
  ctx.moveTo(75,40);
  ctx.bezierCurveTo(75,37,70,25,50,25);
  ctx.bezierCurveTo(20,25,20,62.5,20,62.5);
  ctx.bezierCurveTo(20,80,40,102,75,120);
  ctx.bezierCurveTo(110,102,130,80,130,62.5);
  ctx.bezierCurveTo(130,62.5,130,25,100,25);
  ctx.bezierCurveTo(85,25,75,37,75,40);
  ctx.fill();
}

function roundedRect(ctx,x,y,width,height,radius){
  ctx.beginPath();
  ctx.moveTo(x,y+radius);
  ctx.lineTo(x,y+height-radius);
  ctx.quadraticCurveTo(x,y+height,x+radius,y+height);
  ctx.lineTo(x+width-radius,y+height);
  ctx.quadraticCurveTo(x+width,y+height,x+width,y+height-radius);
  ctx.lineTo(x+width,y+radius);
  ctx.quadraticCurveTo(x+width,y,x+width-radius,y);
  ctx.lineTo(x+radius,y);
  ctx.quadraticCurveTo(x,y,x,y+radius);
  ctx.stroke();
}

function complex(ctx) {
  roundedRect(ctx,12,12,150,150,15);
  roundedRect(ctx,19,19,150,150,9);
  roundedRect(ctx,53,53,49,33,10);
  roundedRect(ctx,53,119,49,16,6);
  roundedRect(ctx,135,53,49,33,10);
  roundedRect(ctx,135,119,25,49,10);
  ctx.beginPath();
  ctx.arc(37,37,13,Math.PI/7,-Math.PI/7,true);
  ctx.lineTo(31,37);
  ctx.fill();
  for(var i=0;i<8;i++){
    ctx.fillRect(51+i*16,35,4,4);
  }
  for(i=0;i<6;i++){
    ctx.fillRect(115,51+i*16,4,4);
  }
  for(i=0;i<8;i++){
    ctx.fillRect(51+i*16,99,4,4);
  }
  ctx.beginPath();
  ctx.moveTo(83,116);
  ctx.lineTo(83,102);
  ctx.bezierCurveTo(83,94,89,88,97,88);
  ctx.bezierCurveTo(105,88,111,94,111,102);
  ctx.lineTo(111,116);
  ctx.lineTo(106.333,111.333);
  ctx.lineTo(101.666,116);
  ctx.lineTo(97,111.333);
  ctx.lineTo(92.333,116);
  ctx.lineTo(87.666,111.333);
  ctx.lineTo(83,116);
  ctx.fill();
  ctx.fillStyle = "white";
  ctx.beginPath();
  ctx.moveTo(91,96);
  ctx.bezierCurveTo(88,96,87,99,87,101);
  ctx.bezierCurveTo(87,103,88,106,91,106);
  ctx.bezierCurveTo(94,106,95,103,95,101);
  ctx.bezierCurveTo(95,99,94,96,91,96);
  ctx.moveTo(103,96);
  ctx.bezierCurveTo(100,96,99,99,99,101);
  ctx.bezierCurveTo(99,103,100,106,103,106);
  ctx.bezierCurveTo(106,106,107,103,107,101);
  ctx.bezierCurveTo(107,99,106,96,103,96);
  ctx.fill();
  ctx.fillStyle = "black";
  ctx.beginPath();
  ctx.arc(101,102,2,0,Math.PI*2,true);
  ctx.fill();
  ctx.beginPath();
  ctx.arc(89,102,2,0,Math.PI*2,true);
  ctx.fill();
}

function colorgrid(ctx) {
  for (var i=0;i<6;i++){
    for (var j=0;j<6;j++){
      ctx.fillStyle = 'rgb(' + Math.floor(255-42.5*i) + ',' + 
                       Math.floor(255-42.5*j) + ',0)';
      ctx.fillRect(j*25,i*25,25,25);
    }
  }
}

function globalalpha(ctx) {
  ctx.fillStyle = '#FD0';
  ctx.fillRect(0,0,75,75);
  ctx.fillStyle = '#6C0';
  ctx.fillRect(75,0,75,75);
  ctx.fillStyle = '#09F';
  ctx.fillRect(0,75,75,75);
  ctx.fillStyle = '#F30';
  ctx.fillRect(75,75,150,150);
  ctx.fillStyle = '#FFF';

  // set transparency value
  ctx.globalAlpha = 0.2;

  // Draw semi transparent circles
  for (var i=0;i<7;i++){
      ctx.beginPath();
      ctx.arc(75,75,10+10*i,0,Math.PI*2,true);
      ctx.fill();
  }
}

function rgba(ctx) {
  // Draw background
  ctx.fillStyle = 'rgb(255,221,0)';
  ctx.fillRect(0,0,150,37.5);
  ctx.fillStyle = 'rgb(102,204,0)';
  ctx.fillRect(0,37.5,150,37.5);
  ctx.fillStyle = 'rgb(0,153,255)';
  ctx.fillRect(0,75,150,37.5);
  ctx.fillStyle = 'rgb(255,51,0)';
  ctx.fillRect(0,112.5,150,37.5);

  // Draw semi transparent rectangles
  for (var i=0;i<10;i++){
    ctx.fillStyle = 'rgba(255,255,255,'+(i+1)/10+')';
    for (var j=0;j<4;j++){
      ctx.fillRect(5+i*14,5+j*37.5,14,27.5)
    }
  }
}

function linewidth(ctx) {
  for (var i = 0; i < 10; i++){
    ctx.lineWidth = 1+i;
    ctx.beginPath();
    ctx.moveTo(5+i*14,5);
    ctx.lineTo(5+i*14,140);
    ctx.stroke();
  }
}

function linecap(ctx) {
  var lineCap = ['butt','round','square'];

  // Draw guides
  ctx.strokeStyle = '#09f';
  ctx.beginPath();
  ctx.moveTo(10,10);
  ctx.lineTo(140,10);
  ctx.moveTo(10,140);
  ctx.lineTo(140,140);
  ctx.stroke();

  // Draw lines
  ctx.strokeStyle = 'black';
  for (var i=0;i<lineCap.length;i++){
    ctx.lineWidth = 15;
    ctx.lineCap = lineCap[i];
    ctx.beginPath();
    ctx.moveTo(25+i*50,10);
    ctx.lineTo(25+i*50,140);
    ctx.stroke();
  }
}

function linejoin(ctx) {
  var lineJoin = ['round','bevel','miter'];
  ctx.lineWidth = 10;
  for (var i=0;i<lineJoin.length;i++){
    ctx.lineJoin = lineJoin[i];
    ctx.beginPath();
    ctx.moveTo(-5,5+i*40);
    ctx.lineTo(35,45+i*40);
    ctx.lineTo(75,5+i*40);
    ctx.lineTo(115,45+i*40);
    ctx.lineTo(155,5+i*40);
    ctx.stroke();
  }
}

function linear_gradient(ctx) {
  // Create gradients
  var lingrad = ctx.createLinearGradient(0,0,0,150);
  lingrad.addColorStop(0, '#00ABEB');
  lingrad.addColorStop(0.5, '#fff');
  lingrad.addColorStop(0.5, '#26C000');
  lingrad.addColorStop(1, '#fff');

  var lingrad2 = ctx.createLinearGradient(0,50,0,95);
  lingrad2.addColorStop(0.5, '#000');
  lingrad2.addColorStop(1, 'rgba(0,0,0,0)');

  // assign gradients to fill and stroke styles
  ctx.fillStyle = lingrad;
  ctx.strokeStyle = lingrad2;

  // draw shapes
  ctx.fillRect(10,10,130,130);
  ctx.strokeRect(50,50,50,50);
}

function radial_gradient(ctx) {
  // Create gradients
  var radgrad = ctx.createRadialGradient(45,45,10,52,50,30);
  radgrad.addColorStop(0, '#A7D30C');
  radgrad.addColorStop(0.9, '#019F62');
  radgrad.addColorStop(1, 'rgba(1,159,98,0)');

  var radgrad2 = ctx.createRadialGradient(105,105,20,112,120,50);
  radgrad2.addColorStop(0, '#FF5F98');
  radgrad2.addColorStop(0.75, '#FF0188');
  radgrad2.addColorStop(1, 'rgba(255,1,136,0)');

  var radgrad3 = ctx.createRadialGradient(95,15,15,102,20,40);
  radgrad3.addColorStop(0, '#00C9FF');
  radgrad3.addColorStop(0.8, '#00B5E2');
  radgrad3.addColorStop(1, 'rgba(0,201,255,0)');

  var radgrad4 = ctx.createRadialGradient(0,150,50,0,140,90);
  radgrad4.addColorStop(0, '#F4F201');
  radgrad4.addColorStop(0.8, '#E4C700');
  radgrad4.addColorStop(1, 'rgba(228,199,0,0)');

  // draw shapes
  ctx.fillStyle = radgrad4;
  ctx.fillRect(0,0,150,150);
  ctx.fillStyle = radgrad3;
  ctx.fillRect(0,0,150,150);
  ctx.fillStyle = radgrad2;
  ctx.fillRect(0,0,150,150);
  ctx.fillStyle = radgrad;
  ctx.fillRect(0,0,150,150);
}

function pattern(ctx) {
  // create new image object to use as pattern
  var img = new Image();
  img.src = 'images/wallpaper.png';
  img.onload = function(){
    // create pattern
    var ptrn = ctx.createPattern(img,'repeat');
    ctx.fillStyle = ptrn;
    ctx.fillRect(0,0,150,150);
  }
}

function shadow(ctx) {
  ctx.shadowOffsetX = 2;
  ctx.shadowOffsetY = 2;
  ctx.shadowBlur = 2;
  ctx.shadowColor = "rgba(0, 0, 0, 0.5)";

  ctx.font = "20px Times New Roman";
  ctx.fillStyle = "Black";
  ctx.fillText("Sample String", 5, 30);
}

function state(ctx) {
  ctx.fillRect(0,0,150,150);   // Draw a rectangle with default settings
  ctx.save();                  // Save the default state

  ctx.fillStyle = '#09F'       // Make changes to the settings
  ctx.fillRect(15,15,120,120); // Draw a rectangle with new settings

  ctx.save();                  // Save the current state
  ctx.fillStyle = '#FFF'       // Make changes to the settings
  ctx.globalAlpha = 0.5;    
  ctx.fillRect(30,30,90,90);   // Draw a rectangle with new settings

  ctx.restore();               // Restore previous state
  ctx.fillRect(45,45,60,60);   // Draw a rectangle with restored settings

  ctx.restore();               // Restore original state
  ctx.fillRect(60,60,30,30);   // Draw a rectangle with restored settings
}

function drawSpirograph(ctx,R,r,O){
  var x1 = R-O;
  var y1 = 0;
  var i  = 1;
  ctx.beginPath();
  ctx.moveTo(x1,y1);
  do {
    if (i>20000) break;
    var x2 = (R+r)*Math.cos(i*Math.PI/72) - (r+O)*Math.cos(((R+r)/r)*(i*Math.PI/72))
    var y2 = (R+r)*Math.sin(i*Math.PI/72) - (r+O)*Math.sin(((R+r)/r)*(i*Math.PI/72))
    ctx.lineTo(x2,y2);
    x1 = x2;
    y1 = y2;
    i++;
  } while (x2 != R-O && y2 != 0 );
  ctx.stroke();
}

function translate(ctx) {
  ctx.fillRect(0,0,300,300);
  for (var i=0;i<3;i++) {
    for (var j=0;j<3;j++) {
      ctx.save();
      ctx.strokeStyle = "#9CFF00";
      ctx.translate(50+j*100,50+i*100);
      drawSpirograph(ctx,20*(j+2)/(j+1),-8*(i+3)/(i+1),10);
      ctx.restore();
    }
  }
}

function rotate(ctx) {
  ctx.translate(75,75);

  for (var i=1;i<6;i++){ // Loop through rings (from inside to out)
    ctx.save();
    ctx.fillStyle = 'rgb('+(51*i)+','+(255-51*i)+',255)';

    for (var j=0;j<i*6;j++){ // draw individual dots
      ctx.rotate(Math.PI*2/(i*6));
      ctx.beginPath();
      ctx.arc(0,i*12.5,5,0,Math.PI*2,true);
      ctx.fill();
    }

    ctx.restore();
  }
}

function scale(ctx) {
  ctx.strokeStyle = "#fc0";
  ctx.lineWidth = 1.5;
  ctx.fillRect(0,0,300,300);

  // Uniform scaling
  ctx.save()
  ctx.translate(50,50);
  drawSpirograph(ctx,22,6,5);  // no scaling

  ctx.translate(100,0);
  ctx.scale(0.75,0.75);
  drawSpirograph(ctx,22,6,5);

  ctx.translate(133.333,0);
  ctx.scale(0.75,0.75);
  drawSpirograph(ctx,22,6,5);
  ctx.restore();

  // Non-uniform scaling (y direction)
  ctx.strokeStyle = "#0cf";
  ctx.save()
  ctx.translate(50,150);
  ctx.scale(1,0.75);
  drawSpirograph(ctx,22,6,5);

  ctx.translate(100,0);
  ctx.scale(1,0.75);
  drawSpirograph(ctx,22,6,5);

  ctx.translate(100,0);
  ctx.scale(1,0.75);
  drawSpirograph(ctx,22,6,5);
  ctx.restore();

  // Non-uniform scaling (x direction)
  ctx.strokeStyle = "#cf0";
  ctx.save()
  ctx.translate(50,250);
  ctx.scale(0.75,1);
  drawSpirograph(ctx,22,6,5);

  ctx.translate(133.333,0);
  ctx.scale(0.75,1);
  drawSpirograph(ctx,22,6,5);

  ctx.translate(177.777,0);
  ctx.scale(0.75,1);
  drawSpirograph(ctx,22,6,5);
  ctx.restore();
}

function transform(ctx) {
  var sin = Math.sin(Math.PI/6);
  var cos = Math.cos(Math.PI/6);
  ctx.translate(100, 100);
  var c = 0;
  for (var i=0; i <= 12; i++) {
    c = Math.floor(255 / 12 * i);
    ctx.fillStyle = "rgb(" + c + "," + c + "," + c + ")";
    ctx.fillRect(0, 0, 100, 10);
    ctx.transform(cos, sin, -sin, cos, 0, 0);
  }

  ctx.setTransform(-1, 0, 0, 1, 200, 200);
  ctx.fillStyle = "rgba(255, 128, 255, 0.5)";
  ctx.fillRect(0, 50, 100, 100);
}

function drawStar(ctx,r){
  ctx.save();
  ctx.beginPath()
  ctx.moveTo(r,0);
  for (var i=0;i<9;i++){
    ctx.rotate(Math.PI/5);
    if(i%2 == 0) {
      ctx.lineTo((r/0.525731)*0.200811,0);
    } else {
      ctx.lineTo(r,0);
    }
  }
  ctx.closePath();
  ctx.fill();
  ctx.restore();
}

function clip(ctx) {
  ctx.fillRect(0,0,150,150);
  ctx.translate(75,75);

  // Create a circular clipping path
  ctx.beginPath();
  ctx.arc(0,0,60,0,Math.PI*2,true);
  ctx.clip();

  // draw background
  var lingrad = ctx.createLinearGradient(0,-75,0,75);
  lingrad.addColorStop(0, '#232256');
  lingrad.addColorStop(1, '#143778');

  ctx.fillStyle = lingrad;
  ctx.fillRect(-75,-75,150,150);

  // draw stars
  for (var j=1;j<50;j++){
    ctx.save();
    ctx.fillStyle = '#fff';
    ctx.translate(75-Math.floor(Math.random()*150),
                  75-Math.floor(Math.random()*150));
    drawStar(ctx,Math.floor(Math.random()*4)+2);
    ctx.restore();
  }
}

function composite(ctx,type) {
    // label
    ctx.font = "12px Helvetica";
    ctx.fillStyle = "Black";
    ctx.fillText(type, 5, 140);
    
    // draw rectangle
    ctx.fillStyle = "#09f";
    ctx.fillRect(15,15,70,70);

    // set composite property
    ctx.globalCompositeOperation = type;

    // draw circle
    ctx.fillStyle = "#f30";
    ctx.beginPath();
    ctx.arc(75,75,35,0,Math.PI*2,true);
    ctx.fill();
}

function text(ctx) {
  ctx.fillStyle = "black";
  ctx.textAlign = "left";
  ctx.textBaseline = "top";
  var font = "bold 12px sans-serif";
  ctx.font = font;
  ctx.fillText(font, 2, 2);
}

function composite_types() {
  // compositing        
  var compositeTypes = [
    'source-over','source-in','source-out','source-atop',
    'destination-over','destination-in','destination-out','destination-atop',
    'lighter','darker','copy','xor'
  ];
  for (i=0;i<compositeTypes.length;i++){
   composite(ctx(), compositeTypes[i]);
  }
}

function draw_clock(ctx){
  var ctx = document.getElementById('clock').getContext('2d'); 
  var now = new Date();
  ctx.save();
  ctx.clearRect(0,0,150,150);
  ctx.translate(75,75);
  ctx.scale(0.4,0.4);
  ctx.rotate(-Math.PI/2);
  ctx.strokeStyle = "black";
  ctx.fillStyle = "white";
  ctx.lineWidth = 8;
  ctx.lineCap = "round";

  // Hour marks
  ctx.save();
  for (var i=0;i<12;i++){
    ctx.beginPath();
    ctx.rotate(Math.PI/6);
    ctx.moveTo(100,0);
    ctx.lineTo(120,0);
    ctx.stroke();
  }
  ctx.restore();

  // Minute marks
  ctx.save();
  ctx.lineWidth = 5;
  for (i=0;i<60;i++){
    if (i%5!=0) {
      ctx.beginPath();
      ctx.moveTo(117,0);
      ctx.lineTo(120,0);
      ctx.stroke();
    }
    ctx.rotate(Math.PI/30);
  }
  ctx.restore();

  var sec = now.getSeconds();
  var min = now.getMinutes();
  var hr  = now.getHours();
  hr = hr>=12 ? hr-12 : hr;

  ctx.fillStyle = "black";

  // write Hours
  ctx.save();
  ctx.rotate( hr*(Math.PI/6) + (Math.PI/360)*min + (Math.PI/21600)*sec )
  ctx.lineWidth = 14;
  ctx.beginPath();
  ctx.moveTo(-20,0);
  ctx.lineTo(80,0);
  ctx.stroke();
  ctx.restore();

  // write Minutes
  ctx.save();
  ctx.rotate( (Math.PI/30)*min + (Math.PI/1800)*sec )
  ctx.lineWidth = 10;
  ctx.beginPath();
  ctx.moveTo(-28,0);
  ctx.lineTo(112,0);
  ctx.stroke();
  ctx.restore();

  // Write seconds
  ctx.save();
  ctx.rotate(sec * Math.PI/30);
  ctx.strokeStyle = "#D40000";
  ctx.fillStyle = "#D40000";
  ctx.lineWidth = 6;
  ctx.beginPath();
  ctx.moveTo(-30,0);
  ctx.lineTo(83,0);
  ctx.stroke();
  ctx.beginPath();
  ctx.arc(0,0,10,0,Math.PI*2,true);
  ctx.fill();
  ctx.beginPath();
  ctx.arc(95,0,10,0,Math.PI*2,true);
  ctx.stroke();
  ctx.fillStyle = "#555";
  ctx.arc(0,0,3,0,Math.PI*2,true);
  ctx.fill();
  ctx.restore();

  ctx.beginPath();
  ctx.lineWidth = 14;
  ctx.strokeStyle = '#325FA2';
  ctx.arc(0,0,142,0,Math.PI*2,true);
  ctx.stroke();

  ctx.restore();
}

function animate_clock() {
  //animation
  c = document.createElement('canvas');
  c.width = 150;
  c.height = 150;
  c.id = 'clock';
  document.body.appendChild(c);
  draw_clock();
  setInterval(draw_clock,1000);
}


function animate_solar_system() {
  c = document.createElement('canvas');
  c.width = 150;
  c.height = 150;
  c.id = 'solar';
  document.body.appendChild(c);
  draw_solar_system();
  setInterval(draw_solar_system,50);
}

function draw_solar_system() {

  var time = new Date();
  var sun_x = 75;
  var sun_y = 75;
  var earth_diameter = 5;
  var moon_diameter = 3;
  var earth_orbit_diameter = 40;
  var moon_orbit_distance = 15;
  var sun_diameter = 10;
  
  var ctx = document.getElementById('solar').getContext('2d');

  ctx.globalCompositeOperation = 'destination-over';
  ctx.clearRect(0,0,150,150); // clear canvas

  // Earth
  ctx.save();
  ctx.translate(sun_x,sun_y);
  
  ctx.rotate( ((2*Math.PI)/60)*time.getSeconds() + ((2*Math.PI)/60000)*time.getMilliseconds() );
  ctx.translate(earth_orbit_diameter,0);
  ctx.fillStyle = "#00a";
  dot(ctx,earth_diameter)

  // Moon
  ctx.save();
  ctx.rotate( ((2*Math.PI)/6)*time.getSeconds() + ((2*Math.PI)/6000)*time.getMilliseconds() );
  ctx.translate(0,moon_orbit_distance);
  ctx.fillStyle = "#ff5522";
  dot(ctx,moon_diameter)
  ctx.restore(); // Moon
  ctx.restore(); // Earth

  // Earth orbit
  ctx.fillStyle = 'rgba(0,0,0,0.4)';
  ctx.strokeStyle = 'rgba(0,153,255,0.4)';
  ctx.beginPath();
  ctx.arc(sun_x,sun_y,earth_orbit_diameter,0,Math.PI*2,false); // Earth orbit
  ctx.stroke();
  
  // Sun
  ctx.save();
  ctx.translate(75,75);
  ctx.fillStyle = "yellow";
  dot(ctx,sun_diameter);
  ctx.restore();
}

// shortcut for drawing filled circles
function dot(ctx,diameter) {
  ctx.beginPath();
  ctx.arc(0,0,diameter,0,Math.PI*2,true);
  ctx.fill();
}

function initialize_clickbox() {
  c = document.createElement('canvas');
  c.width = 150;
  c.height = 150;
  c.id = 'clickbox';
  c.addEventListener("click", click_on_clickbox, false);
  document.body.appendChild(c);
  cx = c.getContext('2d');
  cx.fillStyle = "black";
  cx.textAlign = "center";
  cx.textBaseline = "middle";
  cx.fillText("click me", 75, 75);
}

function click_on_clickbox(e) {
  var clickbox = document.getElementById('clickbox');
  ctx = clickbox.getContext('2d');
  ctx.clearRect(0,0,150,150);
  ctx.fillStyle = "black";
  ctx.textAlign = "left";
  ctx.textBaseline = "bottom";
  ctx.fillText("clientX, clientY: " + e.clientX + " " + e.clientY, 10, 20);
  ctx.fillText("pageX, pageY: " + e.pageX + " " + e.pageY, 10, 40);
  ctx.fillText("bodyL, bodyT: " + document.body.scrollLeft + " " + document.body.scrollTop, 10, 60);
  ctx.fillText("elementL, elementT: " + document.documentElement.scrollLeft + " " + document.documentElement.scrollTop, 10, 80);
  var pos = getCursorPosition(e, clickbox);
  ctx.fillText("x, y: " + pos[0] + " " + pos[1], 10, 100);
}

function getCursorPosition(event, canvas) {
    var x;
    var y;
    // get the document-relative position
    if (event.pageX != undefined && event.pageY != undefined) {
      x = event.pageX;
      y = event.pageY;
    } else {
      x = event.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
      y = event.clientY + document.body.scrollTop + document.documentElement.scrollTop;
    }
    // get the canvas-relative position
    x -= canvas.offsetLeft;
    y -= canvas.offsetTop;
    return [x, y]
}

function image_data(ctx) {
  // Create an ImageData object.
  var image_data = ctx.createImageData(150,150);
  var pix = image_data.data;

  // Loop over each pixel and set a transparent red.
  for (var i = 0; n = pix.length, i < n; i += 4) {
    pix[i] = 255;       // red channel
    pix[i+1] = 128;     // green channel
    pix[i+2] = 64;      // blue channel
    pix[i+3] = Math.random() * 255;   // alpha channel
  }

  // Draw the ImageData object at the given (x,y) coordinates.
  ctx.putImageData(image_data,0,0);
}

function ctx() {
  canvas = document.createElement('canvas');
  canvas.width = 150;
  canvas.height = 150;
  document.body.appendChild(canvas);
  var ctx = canvas.getContext('2d');
  return ctx;
}

function draw(){
   // var ctx = document.getElementById('canvas').getContext('2d');
  tri(ctx());
  rect(ctx());
  rect_path(ctx());
  smiley(ctx());
  arcs(ctx());
  qcurve(ctx());
  bcurve(ctx());
  complex(ctx());
  colorgrid(ctx());
  globalalpha(ctx());
  rgba(ctx());
  linewidth(ctx());
  linecap(ctx());
  linejoin(ctx());
  linear_gradient(ctx());
  radial_gradient(ctx());
  pattern(ctx());
  shadow(ctx());
  state(ctx());
  translate(ctx());
  rotate(ctx());
  scale(ctx());
  transform(ctx());
  clip(ctx());
  text(ctx());
  initialize_clickbox();
  image_data(ctx());
  // these create their own drawing contexts
  composite_types();
  animate_clock();
  animate_solar_system();
  
  
}