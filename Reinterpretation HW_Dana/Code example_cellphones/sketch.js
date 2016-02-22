


function setup() {
  createCanvas(1200, 800);
}

function preload() {
  cellphone = loadImage("cellphoneE.png");
  metrocard = loadImage("metrocard.png");
}
function draw() {
  background(0)
  
  var startX =  500;
  var startY = 0 ;
  
  // remainder after dividing associated value by 20
  var card_fraction = 0
  
 var new_width = width - startX;
 var rect_width = new_width * (1 - card_fraction);
 
 var number_of_rows = 32;
 var rect_x = width - rect_width;
 var rect_y = 25*number_of_rows - 29;
 
  image(cellphone, 30, 180)
  
  
  for (var x = 0; x < 20; x++) {
    for (var y = 0; y < number_of_rows; y++){
  
    posx = startX + 35*x;
    posy = startY + 25*y
    
    image(metrocard, posx, posy, 33, 23);
    fill(0);
    
    
    rect(rect_x, rect_y, width - rect_x, 30);
  }
  
}

}