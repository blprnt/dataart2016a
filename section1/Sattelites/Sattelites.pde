void setup() {
  size(1280, 720);
  loadData("satellites.tsv");
}

void draw() {
}

void loadData(String url) {
  //0                   1                 2                           3                          4               5      6        7                 8               9              10                           11            12          13            14                      15                16                17                                                                                       
  //"Name of Satellite, Alternate Names"  Country/Org of UN Registry  Country of Operator/Owner  Operator/Owner  Users  Purpose  Detailed Purpose  Class of Orbit  Type of Orbit  Longitude of GEO (degrees)  Perigee (km)  Apogee (km)  Eccentricity  Inclination (degrees)  Period (minutes)  Launch Mass (kg.)  Dry Mass (kg.)  Power (watts)  Date of Launch  Expected Lifetime  Contractor  Country of Contractor  Launch Site  Launch Vehicle  COSPAR Number  NORAD NumberComments    Source Used for Orbital Data  Source  Source  Source  Source  Source  Source
  //1. With the table class
  Table t = loadTable(url, "header, tsv");
  for (TableRow row : t.rows()) {
    String name = row.getString(0);

    String kgString = row.getString(16);
    kgString = kgString.replaceAll("\"", "");

    String launchString = row.getString(18);
    println(launchString);

    try {
      int year = int(launchString.split("/")[2]);
      float x = map(year, 1970, 2016, 0, width);

      if (kgString.length() > 0) {
        float kg = float(kgString);
        float size = map(sqrt(kg), 0, sqrt(2000), 0, 60);
        ellipse(x, random(height), size, size);
      } else {
        rect(x, random(height), 10, 10);
      }
    } 
    catch (Exception e) {
    }
  }

  //2. Without the table class
  String[] rows = loadStrings(url);
  for (String row : rows) {
  }
}