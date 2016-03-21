/*
myAudio = new Audio('satSounds.mp3'); 
myAudio.volume = .35
myAudio.addEventListener('ended', function() {
    this.currentTime = 0;
    this.play();
}, false);
myAudio.play();
*/
var satellites = []
var visibileSatsLookAngles = []
var img;
var latLong={};
function preload() {
  img = loadImage("sprite.png");
  imageMode(CENTER)
  document.getElementById("loading").style.visibility="visible"
}
function setup(){
    createCanvas(windowWidth,windowHeight)
    frameRate(.2)
    document.getElementById("defaultCanvas0").style.position = "absolute"
    document.getElementById("defaultCanvas0").style.bottom = "64px"
    navigator.geolocation.getCurrentPosition(function(location){    
        latLong.longitude = location.coords.longitude
        latLong.latitude = location.coords.latitude
        parseTLE(satellites, function(){
            drawSats()
            document.getElementById("loading").style.visibility="hidden"
        })
    })
}
function draw(){
  drawSats()
}
function drawSats(){
            drawSky()
            for(var sat in satellites){
                var satellite = new explore.tle(satellites[sat].line1,satellites[sat].line2)
                satellite.update()
                var lookAngles = satellite.getLookAnglesFrom(latLong.longitude,latLong.latitude,1)
                lookAngles.name = satellites[sat].id.replace(/[0-9]/g, '')
                if(lookAngles.elevation>0){
                    visibileSatsLookAngles.push(lookAngles)
                } 
            }
            push()
                for(var sat=0; sat<visibileSatsLookAngles.length;sat++){
                   var alt = map(visibileSatsLookAngles[sat].elevation,0,90,height,0)
                   if(visibileSatsLookAngles[sat].elevation>90){console.log(visibileSatsLookAngles[sat].elevation)}
                   var az = map(visibileSatsLookAngles[sat].azimuth,0,360,0,width)
                   var satScale = map(visibileSatsLookAngles[sat].range_sat,0,50000,5,2)
                   noStroke()
                   push()
                   image(img,az,alt,satScale*2.5,satScale*2.5)
                   ellipse(az,alt,satScale,satScale)
                   pop()
                   if(visibileSatsLookAngles[sat].name!='Unknown'){
                       strokeWeight(.75)
                       stroke(0,160,0,100)
                       for(var otherSat = sat+1; otherSat<visibileSatsLookAngles.length;otherSat++){
                            if(visibileSatsLookAngles[otherSat].name==visibileSatsLookAngles[sat].name){
                                line(az,alt,map(visibileSatsLookAngles[otherSat].azimuth,0,360,0,width),map(visibileSatsLookAngles[otherSat].elevation,0,90,height,0))
                            }
                       }
                   }
                }
            pop()
        textAlign(LEFT)
        fill(255,164)
        //var date = new Date();
        textSize(20)
        fill(255)
        noStroke()
        textSize(24)
        text("N",width-24,100)
        text("N",10,100)
        text("E",(width/4)-8,100)
        text("S",(width/2)-8,100)
        text("W",(width*.75)-8,100)
        visibileSatsLookAngles = []
}
function drawSky(){
    for(var h=0;h<height;h++){
        var gradPart = map(h*h*h,0,height*height*height,0,100)
        var skyColor = color(0,.2*gradPart,gradPart)
        stroke(skyColor)
        line(0,h,width,h)
    }
}

function parseTLE(satellites, callback){
    var xmlhttp = new XMLHttpRequest();
    var url = "inttles.txt"
    xmlhttp.open("GET", url, true);
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var tleresponse = xmlhttp.responseText;
            tleresponse = tleresponse.split('\n');
            tleresponse.splice(tleresponse.length-1)
            for(var s = 0; s<tleresponse.length;s+=3){
                    satellites.push({
                        id: tleresponse[s].replace(/\s/g, ''),
                        line1 : tleresponse[s+1],
                        line2 : tleresponse[s+2]
                    })
                }
        }
        callback();
    }
    xmlhttp.send(null);
}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
  drawSats()
}
