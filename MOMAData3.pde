String dataPath = "/Users/anyemelody/Desktop/moma/MOMAData3/miniArtWork.json";
ArrayList<ArtWork> allArtWorks;
Note note;

void setup() {
  //fullScreen();
  size(640, 360);
  background(0);
  allArtWorks = new ArrayList<ArtWork>();
  note = new Note();
  loadData();
}

void draw() {
  background(0);
  fill(255, 80);
  textSize(100);
  textAlign(LEFT, CENTER);
  text("MOMA", 0, 50);

  for (ArtWork aw : allArtWorks) {
    if (keyPressed == true) {
      //aw.datePlay();
      aw.connectNote();
      fill(255);
    } else {
      fill(255, 80);
    }
    textSize(30);
    textAlign(CENTER, CENTER);
    text(aw.title, width/2, height/2);
  }
}

void loadData() {
  /////load the dataSheet
  JSONArray data = loadJSONArray(dataPath);
  for (int i=0; i< data.size(); i++) {
    ///make the artwork object,transfer from the dataSheet to ArtWork 
    JSONObject w = data.getJSONObject(i);
    ArtWork aw = new ArtWork().fromJSON(w);
    ////filter by the year
    allArtWorks.add(aw);
  }
}