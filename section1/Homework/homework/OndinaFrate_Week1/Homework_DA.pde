Table table;

Table religion;

//int num;
//String name;

//int num1;
//String name1;

//int num2;
//String name2;

float angle;

float angleReligion;

float r;

int radius = 250;

float xend = 0 + radius * cos(radians(342.8));
float yend = 0 + radius * sin(radians(342.8));

float[] religionX;

void setup() {
  size(1200, 800);
  loadData();
  angle = 320/float(table.getRowCount());
  angleReligion = (360-(angle*75))/float(religion.getRowCount());
  r = 255/table.getRowCount();
  religionX = new float[religion.getRowCount()];
  for (int i=0; i < religion.getRowCount(); i++) {
    religionX[i] = random(radius);
  }
}

void draw() {
  background(0);
  pushStyle();
  textSize(14);
  fill(255);
  text("REFUGEES IN THE US", 50, 50);       
  text("01/2015 - 01/2016", 70, 70); 
  popStyle();
  //Drawing 'USA'
  fill(0);
  noStroke();
  strokeWeight(1);
  ellipse(width/2, height/2, radius*2, radius*2);




  for (int i=0; i<table.getRowCount(); i++) {
    pushMatrix();
     textSize(12);
    //println("Country " + table.getString(i, "Country") + " - People " +  table.getInt(i, "People"));
    translate(width/2, height/2);
    rotate(radians(angle*i));
    fill(map(table.getInt(i, "People"), 0, 17483, 255, 157), 0, 0, 200);
    //fill(map(table.getInt(i, "People"), 0, 17483, 255, 157));
    rect(radius, 0, map(table.getInt(i, "People"), 0, 17483, 5, 300), 10);
    fill(255);
    text(table.getString(i, "Country"), radius, 0);
    popMatrix();
    //pushMatrix();
    //translate(width/2, height/2);
    //float x = 0 + radius *cos(radians(angle*i));
    //float y = 0 + radius * sin(radians(angle*i));
    //stroke(157);
    //strokeWeight(0.5);
    ////line(x, y, 0, 0);
    //noFill();
    //curve(0, 0, x, y, xend, yend, 0, 0);
    //popMatrix();
    //line(0, i*5, table.getInt(i, "People"), i*5);
    //ellipse(width/2, height/2, map(table.getInt(i, "People"), 0, 17483, 5, 1100), map(table.getInt(i, "People"), 0, 17483, 5, 1100));
  }

  for (int i=0; i < religion.getRowCount(); i++) {
   pushMatrix();
   pushStyle();
   //println("Religion" + religion.getString(i, "Religion") + " - Numbers " +  religion.getInt(i, "Numbers"));
   translate(width/2, height/2);
   rotate(radians((angle*75)+(angleReligion*i)));
   fill(255);
   textSize(map(religion.getInt(i, "Numbers"), 0, 14128, 14, 30));
   text(religion.getString(i, "Religion"), religionX[i], 0);
   popStyle();
   popMatrix();
  }
}



//  fill(0);
//  text(name + " " +num, 10, 20);
//  
//  //float x2 = map(mouseX, 0, 17483, 50, 150);
//  float x1 = map(num, 0, 17483, 10, 150);
//  println(x1);
//  fill(255, 0, 0);
//  ellipse(width/2, height/2, x1, x1);
//  fill(255);
//  text(name + ": " +num, width/2, height/2);

//  
//  float x2 = map(num1, 0, 17483, 50, 150);
//  fill(255, 0, 0);
//  ellipse(50, 50, x2, x2);
//  fill(255);
//  text(name1 + ": " +num1, 50, 50);

//  //fill(0, 255, 0);
//  //ellipse(80, 80, num2, num2);
//  //fill(255);
//  //text(name2 + ": " +num2, 80, 80);



void loadData() {
  table = loadTable("arrivals.csv", "header");
  religion = loadTable("religions.csv", "header");

  //println(table.getRowCount() + "total rows in table");

  //println(table.getInt(4, "Numbers") );
  //println(table.getString(3, "Numbers") );
  //println(table.getFloat(4, "Numbers") );


  //  name = table.getString(2, "Religion");
  //  num = table.getInt(2, "Numbers");

  //  name1 = table.getString(2, "Religion");
  //  num1 = table.getInt(2, "Numbers");

  //  name2 = table.getString(5, "Religion");
  //  num2 = table.getInt(5, "Numbers");


  //  for (TableRow row : table.rows()) {
  //    //println(row.getString("Country"));
  //  }
}