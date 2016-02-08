Table table;

void setup() {
  size(900,720);
  loadData();
      smooth(4);
   
}

void draw () {

}

void loadData() {
  background(20,10,37);

  String url = "bicycles2.csv";
  table= loadTable(url, "header");
  
 println(table.getRowCount() + " total rows in table"); 
 
 for (TableRow row : table.rows()) {
    
    int id = row.getInt("CPSC Case #");
    int date = row.getInt("trmt_date");
    String agestring = row.getString("age");
    String bodypartstring = row.getString("bodyposition");
    
    float bodypart = float(bodypartstring);
    float age = float(agestring);
     //textSize(price/100);
     float x = map(date,0,365, 5, width - 50);
     float y= map(bodypart+random(-.3,.3),0,22,10,height);
     
    println(date + " (" + age + " YO) has an ID of " + id);
    strokeWeight(7);
    colorMode(HSB, 100);
    stroke(age/2.1+40,50,100,50);
    
    line(x*2,y+10,x*2,y-10);
  }
}