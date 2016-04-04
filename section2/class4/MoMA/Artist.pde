class Artist {
 
  String name;
  String bio;
  ArrayList<Artwork> works = new ArrayList();
  
  PVector pos = new PVector();
  
  void update() {
    
  }
  
  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(255);
    text(name, 0, 0);
    for(Artwork aw:works) {
      aw.render();
      line(0,0,aw.pos.x, aw.pos.y);
    }
    popMatrix();
  }
  
}