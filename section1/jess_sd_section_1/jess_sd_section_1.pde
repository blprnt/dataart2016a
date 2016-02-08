void setup() {

  size(1280, 900);
  background(7, 44, 74);
  drawGradient1(640, 450);
  //drawGradient2(640, 450);
  loadData("satellites.tsv");//load the satellites.tsv file
}

void draw() {
}

void drawGradient1(float x, float y) {
  pushMatrix();
  pushStyle();
  colorMode(HSB, 360, 100, 100);
  noStroke();
  ellipseMode(RADIUS);
  int radius = 350;
  float b = 29.02; 
  for ( int r = radius; r > 0; --r) {
    fill(206.87, 90.54, b);
    ellipse(x, y, r, r);
    b = (b + .3) % 360; //increments the hue
  }
  popMatrix();
  popStyle();
}

void drawGradient2(float x, float y) {
  pushMatrix();
  pushStyle();
  colorMode(HSB, 360, 100, 100);
  noStroke();
  ellipseMode(RADIUS);
  int radius = 80;
  float s = 100; 
  for ( int r = radius; r > 0; --r) {
    fill(206.87, s, 100);
    ellipse(x, y, r, r);
    s = (s - .3) % 360; //increments the hue
  }
  popMatrix();
  popStyle();
}

void loadData(String url) { //load the data from this url, it will be a string
  //0                   1                 2                           3                          4               5      6        7                 8               9              10                           11            12          13            14                      15                16                17                                                                                       
  //"Name of Satellite, Alternate Names"  Country/Org of UN Registry  Country of Operator/Owner  Operator/Owner  Users  Purpose  Detailed Purpose  Class of Orbit  Type of Orbit  Longitude of GEO (degrees)  Perigee (km)  Apogee (km)  Eccentricity  Inclination (degrees)  Period (minutes)  Launch Mass (kg.)  Dry Mass (kg.)  Power (watts)  Date of Launch  Expected Lifetime  Contractor  Country of Contractor  Launch Site  Launch Vehicle  COSPAR Number  NORAD NumberComments    Source Used for Orbital Data  Source  Source  Source  Source  Source  Source
  Table t = loadTable(url, "header, tsv"); //load the table to the variable 't', while letting P3 know to to look for a 
  for (TableRow row : t.rows()) {

    String apogeeString = row.getString(11);//read the information in column 12 from all rows
    //println(apogeeString);

    String perigeeString = row.getString(10);
    //println(perigeeString);

    String launchMassString = row.getString(15);
    //println(launchMassString);




    try {

      String apogeeStringClean1 = apogeeString.replaceAll(",", "");
      //println(apogeeStringClean1);
      String apogeeStringClean2 = apogeeStringClean1.replaceAll("\"", "");
      //println(apogeeStringClean2);


      String perigeeStringClean1 = perigeeString.replaceAll(",", "");
      //println(apogeeStringClean1);
      String perigeeStringClean2 = perigeeStringClean1.replaceAll("\"", "");
      //println(apogeeStringClean2);


      String launchMassStringClean1 = launchMassString.replaceAll(",", "");
      //println(launchMassStringClean1);
      String launchMassStringClean2 = launchMassStringClean1.replaceAll("\"", "");
      println(launchMassStringClean2);
      //String launchMassStringClean3 = launchMassStringClean2.replaceAll("+", "");
      //println(launchMassStringClean3);


      if (apogeeStringClean2.length() > 0 && perigeeStringClean2.length() > 0) {
        int apogeeInt = Integer.parseInt(apogeeStringClean2, 10);

        int perigeeInt = Integer.parseInt(perigeeStringClean2, 10);

        int launchMassInt = Integer.parseInt(launchMassStringClean2, 10);

        //print(apogeeInt);
        //print(",");
        //println(perigeeInt);

        float avgHeight = ((apogeeInt + perigeeInt)/2) + 6371;
        //println(avgHeight);

        pushStyle();
        noStroke();

        smooth();
        fill(255, 255, 255, 80);
        float diamEarth = 7917.5;
        float diamMap = map(sqrt(diamEarth), 0, sqrt(5000), 0, 10);
        ellipse(640, 450, diamMap, diamMap);
        popStyle();

        pushMatrix();
        translate(640, 450);
        fill(255, 255, 255, 50);
        noStroke();
        float radius = map(sqrt(avgHeight), 0, sqrt(1000), 0, 30);
        float diam = map(sqrt(launchMassInt), 0, sqrt(5000), 0, 10);
        float numPoints = apogeeStringClean2.length();
        //float numPoints = sqrt(apogeeStringClean2.length());
        float angle=TWO_PI/(float)random(numPoints);

        for (int i=0; i<numPoints; i++)
        {

          ellipse(radius*sin(angle*i), radius*cos(angle*i), diam, diam);
        }
        popMatrix();
      } else {
        println("ERROR");
      }
    }
    catch (Exception e) { //WTF does this do?
    }
  }
}