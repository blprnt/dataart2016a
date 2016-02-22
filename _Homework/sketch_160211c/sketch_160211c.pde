Table table;

void setup() {
  size (970, 300);
  background(0, 30);
  smooth(3);
  loadData("death_b.csv");
  //  println(table.getRowCount() + " total rows in table"); 
  //  println(table.getColumnCount() + " total columns in table");
}

void draw() {
}


void loadData(String url) {
  Table t = loadTable(url, "header");

  //for (TableRow row : t.rows ()) {
  //int yy=row.getInt(0);
  // println(yy);
  for (int i = 0; i< t.getRowCount (); i++) {
    TableRow row = t.getRow(i);

    String ethnicity = row.getString("Ethnicity");
    String sex = row.getString("Sex");
    String cause = row.getString("Cause");
    int year =  row.getInt("year");

    //String CountString = row.getString(4);
    int percent = row.getInt("Percent");

    int count=row.getInt("Count");
    println(sex + cause + ethnicity+"//"+percent + "//"+count+"//"+year);

    float pp=map(count, 0, 550, 3, 340);

    if (i<27) {
      smooth(3);
      fill(random(200, 255), random(90, 120), random(130, 180), random(35,80));
      noStroke();
      // blendMode(MULTIPLY);
      ellipse(i*35+30, random(70, 110), pp, pp);    

      pushMatrix();
      smooth(3);
      fill(200);
      translate(i*35+30, 150);
      rotate(PI/4);
      rect(0, 0, 5, 5);
      // textSize(10);
      //text(cause,0,0);
      popMatrix();
    } else if (26<i && i<53) {
      fill(random(40, 80), random(30, 130), random(180, 255), random(50,100));
      noStroke();
      ellipse((i-27)*35+30, random(190, 250), pp, pp);
    }



    //    if (mouseX<100 && mouseY>200){
    //  
    //       pushMatrix();
    //      smooth(3);
    //      fill(0);
    ////      translate(i*35+20,10);
    ////      rotate(PI/3);
    //      textSize(30);
    //      text(cause,500,150);
    //        popMatrix(); }
    //  
    //  
    //
    //  }
  }
}





//float s=float(Sex);

//    float cc=map(count, 0, 5500, 0, 1200);
//
//    if (Sex.length()<5) {
//      fill(200, 200, 50, 10);
//      noStroke();
//      ellipse(cc, cc, cc, cc);
//      fill(255, 10, 30);
//      text(Cause, cc, cc);
//      //println(count);
//    } else {
//
//      fill(0, 200, 50, 10);
//      noStroke();
//      rect(width-cc, cc, yy, yy);
//      fill(0, 200, 30);
//      text(Cause, width-cc, cc);
//      //println(count);
//    }

