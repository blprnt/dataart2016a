
Table move;
int row = 0;
  

//PImage img;
//  img = loadImage("//Users/danaabrassart/Documents/DataArt/DataVizProject/DataViz_2/birds3.jpg");
//  background(img);
void setup() {
  size (1280, 720, P3D);
  smooth();
  background(255);
  //smooth(4);
  //frameRate(20);
  
  loadData();
}

void loadData() {
  String url = "/Users/danaabrassart/Documents/DataArt/Space_Project/movement_points1.csv";
  move = loadTable(url, "header");
  //println(hand_mouth.getRowCount());
  //println(hand_mouth.getColumnCount());
}

void draw(){
  
  background(255);
 
float cameraY = height/2.0;
  float fov = mouseX/float(width) * PI;
  float cameraZ = cameraY / tan(fov / 2.0);
  float aspect = float(width)/float(height);
 
  perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);
  
  translate(width/2+30, height/2, 0);
  //rotateX(mouseY * 0.05);
  //rotateY(mouseX * 0.05);
  
 //translate(width/2, height/2);
  //stroke(255, 50);
  //translate(-200, 50, 0);
  rotateX(mouseY * 0.05);
  rotateY(mouseX * 0.05);
  //fill(mouseX * 2, 0, 160);
  //sphereDetail(mouseX / 4);
  //sphere(40);
  
 
  
  //rotate(-PI);
  scale(6);
  //scale(400);//make everything bigger b/c all numbers are very small
  stroke(0);
  strokeWeight(.05);
  noFill();

 
 //shoulder
 //approx 68 times...13008
 
 //pushMatrix();
 //scale(10);
 //strokeWeight(.05);
 // perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);
  
 // translate(width/2+30, height/2, 0);

 //translate(0,0, -50);
 for(int row = 100; row < 12700; row += 63) {
  pushMatrix();
 stroke(255, 0, 0, 100);
 
 box(move.getFloat(row,0)*100, move.getFloat(row,1)*100, move.getFloat(row,2)*100);
  popMatrix();
  
 pushMatrix();
 stroke(100, 0, 255, 75);
 
 box(move.getFloat(row,3)*100, move.getFloat(row,4)*100, move.getFloat(row,5)*100);
 popMatrix();
  
 pushMatrix();
 stroke(0, 50);

 box(move.getFloat(row,6)*100, move.getFloat(row,7)*100, move.getFloat(row,8)*100);
 popMatrix();
 }
 
 if(mousePressed) {
//popMatrix();
background(255);
rotate(-PI/2);
    for(int row = 100; row < 13000; row += 1) {
 pushMatrix();
 stroke(255, 0, 0);
 strokeWeight(0.7);
 point(move.getFloat(row,0)*50, move.getFloat(row,1)*50, move.getFloat(row,2)*50);
 popMatrix();
 
 pushMatrix();
 stroke(100, 0, 255);
 strokeWeight(0.7);
 point(move.getFloat(row,3)*50 , move.getFloat(row,4)*50, move.getFloat(row,5)*50);
 popMatrix();
  
 pushMatrix();
 stroke(0);
 strokeWeight(0.7);
 point(move.getFloat(row,6)*50 , move.getFloat(row,7)*50, move.getFloat(row,8)*50);
 popMatrix();
 }
 }
  

 }

 
  
  //for(int row = 0; row < 13008; row += 1) {
  // line(move.getFloat(row, 0), move.getFloat(row, 1), move.getFloat(row, 2), move.getFloat(row, 3), move.getFloat(row, 4), move.getFloat(row, 5));
  // line(move.getFloat(row, 3), move.getFloat(row, 4), move.getFloat(row, 5), move.getFloat(row, 6), move.getFloat(row, 7), move.getFloat(row, 8));
  //}
//for(int row = 75; row < 13008; row += 1) {
//point(move.getFloat(row,0), move.getFloat(row,3), move.getFloat(row,6)); //x
//point(move.getFloat(row,1), move.getFloat(row,4), move.getFloat(row,7));  //y
//point(move.getFloat(row,2), move.getFloat(row,5), move.getFloat(row,8));  //z
//}

    //if (row < 13008) {
  //row++; //increment your row
//}