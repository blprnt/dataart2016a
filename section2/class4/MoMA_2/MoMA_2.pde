String dataPath = "/Users/jerthorp/Downloads/collection-master/Artworks.json";

ArrayList<Artwork> allArtworks = new ArrayList();
ArrayList<Artwork> displayArtworks = new ArrayList();

ArrayList<Artist> allArtists = new ArrayList();
HashMap<String, Artist> artistMap = new HashMap();

float wallWidth = 0;

float viewX = 0;
float tviewX = 0;

void setup() {
  size(1280, 720, P3D);
  loadData();
  filterByYear(1999);
  java.util.Collections.sort(displayArtworks);
  hangOnWall();
}

void draw() {
  background(0);
  
  tviewX = map(mouseX, 0, width, 0, wallWidth);
  viewX = lerp(viewX, tviewX, 0.1);
  
  translate(-viewX, 0);
  for (int i = 0; i < displayArtworks.size(); i++) {
    Artwork aw = displayArtworks.get(i);
    aw.render();
  }
}

void hangOnWall() {
  float xStack = 0;
  float space = 10;
  for (int i = 0; i < displayArtworks.size(); i++) {
     Artwork aw = displayArtworks.get(i);
     aw.pos.set(xStack, 200);
     xStack += aw.dimensions.x + space;
   }
   wallWidth = xStack;
}

void filterByYear(int y) {
  displayArtworks = new ArrayList();
  for (Artwork aw:allArtworks) {
   if (aw.year == y && aw.dimensions.x > 0) displayArtworks.add(aw); 
  }
}


void loadData() {
  JSONArray data = loadJSONArray(dataPath); 
  for (int i = 0; i < data.size(); i++) {

    //Make the artwork object
    JSONObject j = data.getJSONObject(i);
    Artwork aw = new Artwork().fromJSON(j);
    //Give the artworks a random position relative to their artist
    //aw.pos.set(random(-50, 50), random(-50, 50));
    allArtworks.add(aw);

    //Make the artist object if necessary
    if (artistMap.containsKey(aw.artist)) {
      //We already have an artist object
      Artist a = artistMap.get(aw.artist);
      a.works.add(aw);
    } else {
      //We a new artist object
      Artist a = new Artist();
      a.name = aw.artist;
      a.works.add(aw);
      allArtists.add(a);
      artistMap.put(a.name, a);
    }
  }
}