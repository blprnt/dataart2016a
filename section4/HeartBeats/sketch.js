
var w = $( window ).width();
var h = $( window ).height();

var mainCanvas;
var carrier;
var modulator;

var apiEndPoint = 'http://intotheokavango.org/api/features/';

var beats;

function preload() {
  
}

function setup() {
  mainCanvas = createCanvas(w,h);
  noFill();
  background(0); // alpha

  //*-------------- SOUND

  //Sound maker
  carrier = new p5.Oscillator(); // connects to master output by default
  carrier.freq(10);
  carrier.amp(4);
  carrier.start();

  //Modulator for the sound
  modulator = new p5.Oscillator('sine');
  modulator.disconnect();  // disconnect the modulator from master output
  modulator.freq(89);
  modulator.amp(4);
  modulator.start();

  // Modulate the carrier's amplitude with the modulator
  // Optionally, we can scale the signal.
  carrier.amp(modulator.scale(-1,1,1,-1));

  requestHR("Steve", 23);

}


function draw() {
  if (beats) {
    var beat = beats[frameCount % beats.length];
    println(beat);
  }
}


function requestHR(member, day) {

  console.log("REQUEST HEART RATE");

  var url = apiEndPoint + "?FeatureType=ambit_hr&Member=" + member + "&Expedition=okavango_15&expeditionDay=" + day;
  console.log(url);
  var test = $.ajax({
    dataType: "json",
    url: url,
    context: this,
    success: this.receiveHR
  });

}

function receiveHR(data) {

  console.log("RECEIVE HEART RATE");
  beats = data.results.features[0].properties.Beats;
  println(beats);
}

