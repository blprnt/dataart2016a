
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
//console.log(li.Category.length)
var baseColors = []
// A reference to our box2d world
var world;

// A list we'll use to track fixed objects
var boundaries = [];
// A list for all of our rectangles
var boxes = [];
var col;

function setup() {

	
  createCanvas(640,360);

  // Initialize box2d physics and create the world
  world = createWorld();

  // Add a bunch of fixed boundaries
  var bColor = color(10,0,40);
 var pColor = color(155,155,50)
  boundaries.push(new Boundary(0,height-200,width/2-50,10, pColor));
  boundaries.push(new Boundary(width,height-200,width/2-50,10, pColor));
  boundaries.push(new Boundary(width/2,height+150,width,height, bColor))
  boundaries.push(new Boundary(50,height-15,100,height,bColor))
  boundaries.push(new Boundary(width-50,height-15,100,height,bColor))
 
  col = color(0,0,255)
  //var b = new Box(width/2,30,col,5);
  //boxes.push(b);
	for(var c in li.Category){
		var tmpColor = color(random(255),random(255),random(255));
		baseColors.push(tmpColor)
		for(var s in li.Category[c].SubCategory){
			var colorOb = baseColors[c]
			var numObs = sqrt(parseInt(li.Category[c].SubCategory[s].count))
			var b = new Box(width/2+random(-20,20),height-200,colorOb,numObs/3)
			boxes.push(b)
			//console.log(numObs)
			/*for(var i=0;i< numObs;i++){
	//		console.log(i)
				var b = new Box(width/2,30,colorOb,5);
  			boxes.push(b);
			}*/
		}
	}
}

function draw() {
  background(255);

  // We must always step through time!
  var timeStep = 1.0/30;
  // 2nd and 3rd arguments are velocity and position iterations
  world.Step(timeStep,10,10);

  // Boxes fall from the top every so often
  /*if (random(1) < 0.2) {
    var b = new Box(width/2,30,col,5);
    boxes.push(b);
  }
*/
  // Display all the boundaries
  for (var i = 0; i < boundaries.length; i++) {
    boundaries[i].display();
  }

  // Display all the boxes
  for (var i = boxes.length-1; i >= 0; i--) {
    boxes[i].display();
    if (boxes[i].done()) {
      boxes.splice(i,1);
    }
  }
}




