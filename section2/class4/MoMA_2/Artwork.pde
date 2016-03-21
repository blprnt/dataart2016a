/*

{  
  "Title": "Nara Convention Hall, Nara, Japan, Sketches of main hall",  
  "Artist": "Arata Isozaki",  
  "ArtistBio": "(Japanese, born 1931)",  
  "Date": "1992",  
  "Medium": "Ink on tracing paper",  
  "Dimensions": "12 x 33 1/8\" (30.5 x 84.1 cm)",  
  "CreditLine": "Gift of the architect",  
  "MoMANumber": "149.1993",  
  "Classification": "A&D Architectural Drawing",  
  "Department": "Architecture & Design",  
  "DateAcquired": "1993-05-04",  
  "CuratorApproved": "Y",  
  "ObjectID": 233,  
  "URL": "http://www.moma.org/collection/works/233"  
}

*/

class Artwork implements Comparable {

  String artist;
  String title;
  String dimensionsString;
  int year;
  PVector dimensions = new PVector();

  PVector pos = new PVector();

  Artwork() {
  }

  Artwork fromJSON(JSONObject j) {
    artist = j.getString("Artist");
    title = j.getString("Title");
    
    try {
      String yearString = j.getString("Date");
      year = int(yearString);
    } catch (Exception e) {
      year = -1;
    }
    
    try {
      dimensionsString = j.getString("Dimensions");
      //19 1/8 x 66 1/2\" (48.6 x 168.9 cm)
      String metric = dimensionsString.split("\\(")[1].split("cm\\)")[0];
      String[] dims = metric.split(" x ");
      //println(dims.length);
      if(dims.length == 2) {
        //2D artwork
        dimensions.x = float(dims[0]);
        dimensions.y = float(dims[1]);
      } else if (dims.length == 3) {
        //3D artwork
        dimensions.x = float(dims[0]);
        dimensions.y = float(dims[1]);
        dimensions.z = float(dims[2]);
      }
      
    } 
    catch(Exception e) {
      println(dimensionsString);
      println(e);
    }
    return(this);
  }

  void update() {
  }

  void render() {
    pushMatrix();
    fill(255,50);
    stroke(255,150);
    translate(pos.x, pos.y);
    rect(0, 0, dimensions.x, dimensions.y);
    popMatrix();
  }
  
  int compareTo(Object b) {
    //area
    float a1 = dimensions.x * dimensions.y;
    float a2 = ((Artwork) b).dimensions.x * ((Artwork) b).dimensions.y;
    return(int(a1) - int(a2));
  }
  
  
}