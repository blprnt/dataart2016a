var satellites = []
var visibleSats = []
var img;
function preload() {
  img = loadImage("sprite.png");
  imageMode(CENTER)
}
function setup(){
    createCanvas(800,800)
    navigator.geolocation.getCurrentPosition(function(location){    
        parseTLE(satellites, function(){
            drawSky()
            for(var sat in satellites){
                var satellite = new explore.tle(satellites[sat].line1,satellites[sat].line2)
                satellite.update()
                var lookAngles = satellite.getLookAnglesFrom(location.coords.longitude,location.coords.latitude,1)
                if(lookAngles.elevation>0){
                    visibleSats.push(lookAngles)
                } 
            }
            console.log(visibleSats)
            push()
                translate(0,height)
                for(var sat in visibleSats){
                    push()
                        var satPosition = map(visibleSats[sat].range_sat,0,50000,0,height)
                        if(Math.random()>0){ 
                            rotate(-visibleSats[sat].elevation*(Math.PI/180))
                        }else{
                            rotate(-Math.PI+visibleSats[sat].elevation*(Math.PI/180))
                        }

                        for(var i=0;i<satPosition;i++){
                            stroke(255,0,0,255-map(i,0,satPosition,0,255))
                            point(i,0)
                        }
                        noStroke()
                        fill(255)
                        image(img,satPosition,0)
                        ellipse(satPosition,0,4,4)
                    pop()
                }
            pop()
        })
    })
}
function draw(){
}

function drawSky(){
    for(var h=0;h<height;h++){
        var gradPart = map(h*h*h,0,height*height*height,0,100)
        var skyColor = color(10,.2*gradPart,gradPart)
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


