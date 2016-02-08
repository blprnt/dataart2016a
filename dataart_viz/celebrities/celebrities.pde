void setup () {
  background(0);
  size (1000, 600);  
  loadData("pantheon.tsv");
}

void draw() {
}


void loadData(String url) {
  // 1. with the table class
  // 0          1       2        3           4            5            6             7        8    9       10            11        12         13         14       15      16                17   18                19                   20                  21        22    
  //en_curid  name  numlangs  birthcity  birthstate  countryName  countryCode  countryCode3  LAT  LON  continentName  birthyear  gender  occupation  industry  domain  TotalPageViews  L_star  StdDevPageViews  PageViewsEnglish  PageViewsNonEnglish  AverageViews  HPI
  Table t =loadTable(url, "header , tsv");
  for ( TableRow row : t.rows()) {
    String name = row.getString(1);
    String continent = row.getString(10);

    //String latRaw = row.getString(8);
    //float lat = float(latRaw);
    //String lonRaw = row.getString(9);
    //float lon = float(lonRaw);
    String birthyear = row.getString(11);
    int birth = int(birthyear);
    float bth = map (birth, -3000, 2020, 50, width-50);
    String averageViews = row.getString(21);
    
    float base = 300; 

    continent = continent.replaceAll(" ", "");
    //println(continent);
    //println(continent.length());
    float views = float(averageViews);
    float view = map (views, 0, 2500000, height-300, height-550);
    pushMatrix();
    translate(0, 0);
    rotate(PI/2.0);
    fill(255, 50);
    //textSize(8);
    //int year = -3000;
    //for (int i = 0; i< 51; i++) {
    // float y = map(year, -3000, 2020, 50, width-50);
    // text(year, 520, -y);
    // year = year + 100;
    //}
    textSize(8);
    text(name, base, -bth);
    popMatrix();
   



    if (continent.equals("Asia")) {
      //fill(255, 20, 58, 200);
      //ellipse(bth, view, 10, 10);
      stroke(255, 20, 58, 200);
      line(bth, base, bth, view);
    }
    if (continent.equals("NorthAmerica")) {
      //fill(0, 220, 58, 200);
      //ellipse(bth, view, 10, 10);
      //println(view);
      stroke(0, 220, 58, 200);
      line(bth, base, bth, view);
    }
    if (continent.equals("Europe")) {
      //fill(50, 10, 255, 200);
      //ellipse(bth, view, 10, 10);
      stroke(50, 10, 255, 200);
      line(bth, base, bth, view);
    }
    if (continent.equals("Africa")) {
      //fill(120, 80, 50, 200);
      //ellipse(bth, view, 10, 10);
      stroke(120, 80, 50, 200);
      line(bth, base, bth, view);
    }
    if (continent.equals("SouthAmerica")) {
      //fill(100, 255, 80, 200);
      //ellipse(bth, view, 10, 10);
      stroke(100, 255, 80, 200);
      line(bth, 500, bth, view);
    }
  }
}