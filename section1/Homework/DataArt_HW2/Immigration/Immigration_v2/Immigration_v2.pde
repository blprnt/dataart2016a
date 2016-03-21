Table table;


void setup() {
  size(1200, 900);
  noStroke();
  loadData("arrivals.csv");
  colorMode(HSB, 360, 100, 100);
}

void draw() {

  background(0);
  pushStyle();
  textSize(20);
  fill(255);
  text("Refugees Arriving to the US", 850, 50);       
  text("JAN 2015 - JAN 2016", 850, 75);
  popStyle();

  //fill(0);
  //noStroke();
  //strokeWeight(1);


  float tempX = 1014;
  float tempY = 4.10;
  float x, y;

  for (int r=0; r<table.getRowCount(); r++) {

    float size = map((table.getInt(r, "People")), 0, 17483, 3, 100);
    //int Color = int(map(table.getInt(r, "People"), 0, 17483, 35, 360));
    // println("This color", Color);

    // sin(freq) * amp
    x = width/2 + cos(r*0.01 - tempX*r) * (1 + r*tempY);
    y = height/2 + sin(r*0.01 - tempX*r) * (1 + r*tempY);
    noFill();
    stroke(1+(r*4.75), 100, 100);
    strokeWeight(3);
    //fill(Color,100,100);
    ellipse(x, y, size, size);
    pushStyle();
    fill(1+(r*4.75), 100, 100);
    textSize(10);
    text(table.getString(r, "Country"), 30, 50 + (r*10));
    popStyle();
  }

  //pushStyle();
  //textSize(14);
  //fill(255);
  //text(tempX, 500, 20);
  //text(tempY, 500, 40);
  //popStyle();


  for (int i=0; i<table.getRowCount(); i++) {
    println( table.getInt(i, "People"));
  }
}

void loadData(String url) {
  table = loadTable ("arrivals.csv", "header");
  println(table.getRowCount()+ "total rows in table");
  println(table.getColumnCount()+ "total columns in table");
}