void setup() {
  size(1280, 720);
  smooth();
  background(0);
  loadData();
}

void draw() {
}

void loadData() {
  String url ="/Users/jerthorp/Desktop/TED.json";
  JSONObject ted = loadJSONObject(url);
  JSONArray lines = ted.getJSONArray("lines");
  //println(lines.getJSONObject(2).getString("text"));
  for(int i = 0; i < lines.size(); i++) {
    JSONObject line = lines.getJSONObject(i);
    String text = line.getString("text");
    if (text.indexOf("Applause") != -1) {
      println(text);
    }
  }
  
}