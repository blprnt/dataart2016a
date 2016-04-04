String dataPath = "/Users/jerthorp/Downloads/collection-master/Artworks.json";

ArrayList<Artwork> allArtworks = new ArrayList();
ArrayList<Artwork> displayArtworks = new ArrayList();

ArrayList<Artist> allArtists = new ArrayList();
HashMap<String, Artist> artistMap = new HashMap();

void setup() {
  size(1280, 720, P3D);
  loadData();

  Artwork myArtwork = new Artwork();

  /*
  for(Artwork aw:allArtworks) {
   if (aw.title.toLowerCase().indexOf(" red ") != -1) {
   fill(255,0,0);
   text(aw.title, random(width), random(height));
   }
   }
   */
}

void draw() {
  background(0);
  //for(Artwork aw:allArtworks) aw.render();
  /*
  randomSeed(0);
   for (int i = 0; i < 30; i++) {
   int r = floor(random(allArtists.size()));
   Artist dude = allArtists.get(r);
   dude.pos.set(random(width), random(height));
   dude.render();
   }
   */

  for (int i = 0; i < allArtworks.size(); i++) {
    Artwork aw = allArtworks.get(i);

    if (aw.year > 0) {
      float x = map(aw.year, 1900, 2016, 0, width);
      pushMatrix();
      translate(x, 10);
      aw.render();
      popMatrix();
    }
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