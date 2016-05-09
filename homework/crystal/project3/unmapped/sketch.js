function preload() {
  data = loadJSON("data.json");
}

function setup() {
  createCanvas(1200, 800);
  noLoop();
  noStroke();
  background(0);
  lng();
}

function draw() {
  
}

function lng() {
  for (var i = 0; i < data.length; i+=20) {
    // console.log(data[i].LAT_DMS);
    var stuff = JSON.stringify(data[i].LON_DMS);
    // console.log(stuff);
    var licensee = data[i].LICENSEE;
    var county = data[i].LOCCOUNTY;
    var state = data[i].LOCSTATE;
    parseDMS(stuff, licensee, county, state);
  }
}

function parseDMS(locationStrings, licensee, county, state) {
  var parts = locationStrings.split(/[^\d\w]+/);
  // convertDMStoDD(parts[0], parts[1], parts[2]);
  // var lati = convertDMStoDD(parts[0], parts[1], parts[2]);
  // console.log(parts[1]);
  // console.log(lati);
  // return [lati];
  var converted = Number(parts[1])+Number(parts[2]/60)+Number(parts[3]/(60*60));
  // console.log(converted);
  towers(converted, licensee, county, state);
}

// function convertDMStoDD(degreez, minutes, seconds){
//   // var dd = Number(degreez) + Number(minutes)/60 + Number(seconds)/(60*60);
//   // return dd;
//   Number(degreez) + Number(minutes)/60 + Number(seconds)/(60*60);
//   // console.log(dd);
// }

function towers(locationDecimal, carrier, county, state) {
  //carriers
  var x = width - (map(locationDecimal, 65, 150, 0, width));
  var y = 400;
  if (carrier.includes("Verizon")) {
    fill(255, 0, 0);
  }
  else if (carrier.includes("AT&T") || carrier.includes("Cingular")) {
    fill(0, 0, 255);
  }
  else if (carrier.includes("Alltel")) {
    fill(255, 255, 100);
  }
  else {
    fill(255);
  }
  ellipse(x, y, 1, 300);
  //counties
  // var x = width - (map(locationDecimal, 75, 125, 0, width));
  // var y = 300;
  // var high = 50;
  // if (county.includes("Henrico")) {
  //   high = 500;
  // }
  // else {
  //   high = 100;
  // }
  // fill(0, 255, 0);
  // ellipse(x, y, 1, high);
}




