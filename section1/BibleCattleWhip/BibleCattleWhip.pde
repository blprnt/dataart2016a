void setup() {
  size(1280, 720);
  background(0);
  smooth(4);
  loadData();
}

void draw() {
}

void loadData() {

  String url = "/Users/jerthorp/code/dataart2016a/data/BibleCattleWhip/products/whip.xml";
  XML ebayXML = loadXML(url);
  XML[] items = ebayXML.getChildren("item");
  println(items.length);

  for (XML item:items) {
    String title = item.getChild("title").getContent();
    String priceString = item.getChild("price").getContent();
    float price = float(priceString);
    //println(price);
    float x = map(log(price), 0, log(1000), 50, width - 50);
    //text(title, 10, y);
    //stroke(255,50);
    //line(x,0,x,height);
    pushMatrix();
    translate(x,0);
    rotate(PI/2);
    text(title,0,0);
    popMatrix();
  }
}

