//Ainsley O'Connell
//ITP Data Art, Project #2
//Adapted from Sine Wave by Daniel Shiffman
//https://processing.org/examples/sinewave.html

String dataPath = "/Users/ainsley/Documents/dataArt/project2/output3.json";
JSONObject json;
JSONArray items;
//ArrayList allCharacters = new ArrayList();

int xspacing = 30;   // How far apart should each horizontal location be spaced
int waveWidth;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 40.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

HashMap<String, Actor> actorMap = new HashMap();
ArrayList<Actor> allActors = new ArrayList();

void setup() {
  json = loadJSONObject(dataPath);
  items = json.getJSONArray("items");

  size(1300, 700);
  waveWidth = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[waveWidth/xspacing];

  parseData();
}

void draw() {
  background(#18234b);
  calcWave();
  renderWave();
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  randomSeed(0);
  theta += random(0.005, 0.03);//0.01;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(255);
  // Draw the waves
  for (int i = 1; i < 8; i++) {
    Actor a = allActors.get(i);
    for (int j = 0; j < yvalues.length; j++) {
      String trait = a.traits.get(j % a.traits.size());
      text(trait, j*xspacing, i*78 + yvalues[j]);
    }
  }
}

//void renderLine() {
//  noStroke();
//  fill(#569cea);
//  for (int i = 0; i < yvalues.length; i++) {
//    ellipse(i*xspacing, i*68, 5, 5);
//  }
//}

void parseData() {
  for (int i = 0; i < items.size(); i++) {
    JSONObject j = items.getJSONObject(i);
    String nameString = j.getString("Name");
    String typeString = j.getString("Type");
    String traitString = j.getString("Trait");
    
    if(actorMap.containsKey(nameString)) {
      Actor a = actorMap.get(nameString);
      a.traits.add(traitString);
    } else {
      Actor a = new Actor();
      a.name = nameString;
      a.type = typeString;
      a.traits.add(traitString);
      actorMap.put(nameString, a);
      allActors.add(a);
    }
    
  }
}