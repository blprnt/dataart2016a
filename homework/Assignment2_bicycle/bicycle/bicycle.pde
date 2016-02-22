Table table;
PImage bg;
void setup() {
  size(1200, 720);
  bg = loadImage("bike_bkground.png");
  smooth(4);
  noStroke();
  background(254);
  image(bg, 0, 0);
  loadData();
}

void draw () {
}

void loadData() {
  String url = "bicycles2.csv";
  table= loadTable(url, "header");

  println(table.getRowCount() + " total rows in table"); 

  for (TableRow row : table.rows ()) {
    int id = row.getInt("CPSC Case #");
    String[] dateString = split(row.getString("trmt_date"), '/');
    int date = Integer.parseInt(dateString[0]);  //dataString[0],[1],[2] are respectively mm,dd,yyyy
    //println(date);
    String agestring = row.getString("age");
    String bodypartstring = row.getString("bodyposition");

    float bodypart = float(bodypartstring);
    float age = float(agestring);
    float x = map(Integer.parseInt(dateString[0]), 1, 12, 5, width - 50) + random(-5, 5);
    x+=map(Integer.parseInt(dateString[1]), 1, 31, 0, width/12);
    float y= map(bodypart+random(-1.5, 1.5), 0, 22, 80, height);
    colorMode(HSB, 60);
    fill(100, 50, 40, 8-map(x, 0, width, -5, 8));

    if (bg.get((int)x, (int)(y+10)) != #ffffff)    //if background is not white
      ellipse(x, y+10, age/2, age/2);
  }
}
