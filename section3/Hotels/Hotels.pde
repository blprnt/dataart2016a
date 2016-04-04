//0  1         2     3     4        5         6           7           8       9        10  11             12       13                             
//id~hotelName~stars~price~cityName~stateName~countryCode~countryName~address~location~url~tripadvisorUrl~latitude~longitude~latlong~propertyType~chainId~rooms~facilities~checkIn~checkOut~rating


void setup() {
  size(1280, 720, P3D);
  smooth(4);
  background(0);
  loadHotels("/Users/jerthorp/Desktop/hotelsbase.csv");
}

void draw() {
}

void loadHotels(String url) {
  String[] rows = loadStrings(url);
  for (int i = 0; i < rows.length; i++) {
    String row = rows[i];
    String[] cols = row.split("~");
    noStroke();

    if (cols.length > 12) {
      float lat = float(cols[12]);
      float lon = float(cols[13]);
      float price = float(cols[3]);

      //float x = map(lon, -180, 180, 0, width);
      float x = map(price, 0, 1000, 0, width);
      float y = map(lat, 90, -90, 0, height);
      
      fill(255,100);
      rect(x, y, 1, 1);
    }
  }
}