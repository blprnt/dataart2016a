
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
  carrier.freq(220);
  carrier.amp(1);
  carrier.start();

  //Modulator function() {};or the sound
  modulator = new p5.Oscillator('sine');
  modulator.disconnect();  // disconnect the modulator from master output
  modulator.freq(5);
  modulator.amp(1);
  modulator.start();

  // Modulate the carrier's amplitude with the modulator
  // Optionally, we can scale the signal.
  carrier.amp(modulator.scale(-1,1,1,-1));

  requestHR("Adjany", 30);

}


function draw() {
  background(0);
  stroke(255,10);
  if (beats) {
    for (var i = 0; i < beats.length; i++) {
      var x = map(i, 0, beats.length, 0, width);
      var interval = beats[i]; //millis per beat
      var h = (1.0 / interval) * 1000 * 60; //BPM
      line(x, height, x, height - h);

     
    }

    

  }

     //Get the current BPM
      var cBPM = (1.0 / beats[0]) * 1000 * 60;

      var modFreq = cBPM / 60;
      println(modFreq);
      modulator.freq(modFreq);

      var modAmp = 0.5;//map(mouseX, 0, width, 0, 1);
      modulator.amp(modAmp, 0.03);

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
}

