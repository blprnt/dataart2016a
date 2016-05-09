/* GLOBAL VARIABLES */
var a
var well1
var well2
var well3
var well4
var well5
var well6
var well7
var done1 = false;
var done2 = false;
var done3 = false;
var done4 = false;
var done5 = false;
var done6 = false;
var done7 = false;
var data
var x
var ax = x;
var y
// var ay = 0;
var ay
var m
var am
var conductivity
var well
var wells = [];
var animate = 0;


function preload() {
  data = loadJSON("salinity.json");
  img = loadImage("miami-dade.png");
}

function setup() {
  createCanvas(800, 900);
  // noLoop();
  noStroke();
  background(120, 180, 200);
  //console.log(data[0][0]);
  //console.log(data[0].[0]);
  //*console.log(data[0]._254335080170501[0]);
  wells.push(data[0]._254335080170501);
  wells.push(data[2]._254855080163701);
  wells.push(data[1]._255011080124501);
  wells.push(data[3]._254841080164401);
  wells.push(data[4]._255350080105801);
  wells.push(data[5]._254828080161501);
  wells.push(data[6]._254107080165201);

  
  
}


function draw() {
  background(120, 180, 200);
  image(img, -190, -90, img.width/1.6, img.height/2);
  for (var i = 0; i < wells.length; i++) {
    var currentWell = wells[i];
    var conductivity = measureConductivity(currentWell);
    mapLocation(currentWell, conductivity);
  }
  animate += 0.01;
  if (animate > 1) {
    animate = 1;
  }
}


/* ADDED FUNCTIONS */
function mapLocation(w, conductivity) {
  var wellLocation = w[0];

  x = map(wellLocation.latitude, 254000, 255500, 0, width);
  y = map(wellLocation.longitude, 801000, 801800, 0, height) * animate;
  m = map(conductivity, 25, 295, .1, 1);
  fill('rgba(255, 255, 255, '+m+')');
  rect(x, y, 10, 30, 5);
}

function measureConductivity(w) {
  var reading;
//get the latitude and longitude of the well
//get each raw conductivity reading (p00095) for the well
  for (var i = 0; i < w.length; i++) {
//change the conductivity reading from centimeters to meters
//20 cs/m = freshwater and 67 cs/m = saltwater
    reading = reading + (w[i].p00095/100)
  }
//get the average conductivity of all readings
  return reading/w.length;
}


// function drawWell1() {
//   well = well1;
//   measureConductivity();
//   mapLocation();
//   done1 = true;
//   //translateConductivity();
// }

// function drawWell2() {
//   well = well2;
//   measureConductivity();
//   mapLocation();
//   done2 = true;
// }

// function drawWell3() {
//   well = well3;
//   measureConductivity();
//   mapLocation();
//   done3 = true;
// }

// function drawWell4() {
//   well = well4;
//   measureConductivity();
//   mapLocation();
//   done4 = true;
// }

// function drawWell5() {
//   well = well5;
//   measureConductivity();
//   mapLocation();
//   done5 = true;
// }

// function drawWell6() {
//   well = well6;
//   measureConductivity();
//   mapLocation();
//   done6 = true;
// }

// function drawWell7() {
//   well = well7;
//   measureConductivity();
//   mapLocation();
//   done7 = true;
//   if(done7 === true) {
//     save('salinity.jpg');
//   }
// }

/*** Testing Animation ***/
/*
function mousePressed() {
  loop();
}

function mouseReleased() {
  noLoop();
}

function translateConductivity() {
  for (i = 0; i < well.length; i++) {
    measurement = well[i].p00095/100;
    //console.log(measurement);
    mapAnimation();
    // animateMeasurement();
  }
}

function mapAnimation() {
  x = map(wellLocation.latitude, 254000, 255500, 0, width);
  y = map(wellLocation.longitude, 801000, 801800, 0, height);
  am = map(conductivity, 0, 295, .1, 1);
  animateMeasurement();
}

function animateMeasurement() {
  //console.log(y);
    console.log(ay);
  ay = 0;
  if (ay < y) {
        fill('rgba(255, 255, 255, '+am+')');
    rect(x, ay, 10, 30, 5);
    ay = ay + 1;
  }
}
*/

/* Garbage Code */
  // for (i = 0; i < data.length; i++) {
  //   a = data[i];
  //   // console.log(data);
  //   console.log(a);
  //   // console.log(a.a[0]);
  //     //console.log(a._254335080170501[0]);
  //   for (j = 0; j < a; j++) {
  //   // x = map(data[i].latitude, 254334, 254345, 0, 600);
  //   // y = map(data[i].longitude, 801240, 801250, 0, 400);
  //   // // console.log(x);
  //   // // console.log(y);
  //   // ellipse(x, y, 20, 20);
  //   // fill(255);
  //   //console.log(a._254335080170501[j]);

  //   }
  //   // console.log(a[0]);
  //   //console.log(a[j]);
  //   //console.log(a._254335080170501[0]);
  // }

  //   //console.log(data.length);













