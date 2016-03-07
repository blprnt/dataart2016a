class ArtWork {
  String title;
  String artist;
  int date;
  String url;
  int alpha =0 ;
  ArtWork() {
  }
  ///ArtWork is the function type, fromJSON is the function name
  ArtWork fromJSON(JSONObject w) {
    title =w.getString("Title");
    artist = w.getString("Artist");
    try {
      String yearString = w.getString("Date");
      date = int(yearString);
    } 
    catch(Exception e) {
      println("String exception");
      println(w);
    }

    return(this);
    ///since the function type is the ArtWork, return the ArtWork it self
  }

  void connectNote() {
    String[] word = title.toLowerCase().split(",");
    int count = 0;
    for (int i=0; i<word.length; i++) {
      String[] letter = word[i].split("");
      for (int j = 0; j<letter.length; j++) {
        count++;
        note.play(letter[j], count, date);
      }
    }
  }

  void datePlay() {
    note.backPlay(date);
  }
}