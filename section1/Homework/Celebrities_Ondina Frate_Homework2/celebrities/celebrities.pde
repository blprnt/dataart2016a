void setup () {
  background(0);
  size (1200, 600);  
  loadData("pantheon.tsv");
}

void draw() {
}


void loadData(String url) {
  // 1. with the table class
  // 0          1       2        3           4            5            6             7        8    9       10            11        12         13         14       15      16                17   18                19                   20                  21        22    
  //en_curid  name  numlangs  birthcity  birthstate  countryName  countryCode  countryCode3  LAT  LON  continentName  birthyear  gender  occupation  industry  domain  TotalPageViews  L_star  StdDevPageViews  PageViewsEnglish  PageViewsNonEnglish  AverageViews  HPI
  Table t =loadTable(url, "header , tsv");
  float lowestViews = 999999999;
  float highestViews = 0;
  for ( TableRow row : t.rows()) {
    float views = row.getFloat(22);
    if(lowestViews > views){
      lowestViews = views;
    }
    if(highestViews < views){
      highestViews = views;
    }
  }
  //println(lowestViews);
  //println(highestViews);
  for ( TableRow row : t.rows()) {
    if(row.getFloat(8) <= 0 || row.getFloat(8) >= 0){
    float lat = row.getFloat(8);
    float mappedLat = map(lat, 90, -90, 0, height);
    float lon = row.getFloat(9);
    float mappedLon = map(lon, -180, 180, 0, width);
    
    float fill = map(row.getFloat(22), lowestViews, highestViews, 50, 255);
    fill(fill, 0, 0);
    rect(mappedLon, mappedLat, 2, 2);
    }
  }
}