JSONObject json;
JSONArray items;

void setup() {
  json = loadJSONObject("data/data.json");
  items = json.getJSONArray("items");
  JSONObject firstStar = items.getJSONObject(0);
  println(firstStar);
  //int mass = response.getInt("mass");
  //println(mass);
  background(255);
  size(1280,620);
  parseData();
} 

void draw() {
}

void parseData() {
  for (int i = 0; i < items.size(); i+=1) {
    JSONObject blackhole = items.getJSONObject(i);
    String nameString = blackhole.getString("name");
    println(nameString);
    //JSONArray nameList = blackhole.getJSONArray("name");
    int distanceInt = blackhole.getInt("distance");
    int massInt = blackhole.getInt("mass");
    int massLog = massInt/1000;
    try {
     //int distance = int(distanceString);
     float x = map(distanceInt, 0, 150, 0, width);
     float m = map(massLog, 0, 1000000, 0, 550);
     fill(0);
     noStroke();
     ellipse(x, 1, 10, m);
     //fill(255);
     //rect(0,0,width,74);
    }
    catch(Exception e) {
    }
  }
}