class NetworkWord {
 
  String word;
  int count;
  IntDict linkMap = new IntDict();
  
  PVector pos = new PVector();
  float rot = 0;
  
  void update() {
    
  }

  void render() {
    pushMatrix();
      translate(pos.x,pos.y);
      rotateZ(rot);
      fill(0);
      ellipse(0,0,sqrt(count) * 0.2,sqrt(count) * 0.2);
      text("." + word + ".", 5, 5);
    popMatrix();
  }  
  
  void renderLinks() {
    //Go through the words stored in the IntDict
   for(String w:linkMap.keys()) {
    NetworkWord nw = wordMap.get(w);
    if (displayWords.contains(nw)) {
      
      strokeWeight(sqrt(linkMap.get(w)) * 0.5);
      println(linkMap.get(w));
      float c = map(linkMap.get(w), 0, 100, 0, 255);
      colorMode(HSB);
      stroke(c,255,255,150);
      
      PVector center = new PVector(0,0);
      PVector a1 = new PVector(pos.x, pos.y);
      PVector a2 = new PVector(nw.pos.x, nw.pos.y);
      PVector cp1 = a1.lerp(center, 0.5);
      PVector cp2 = a2.lerp(center, 0.5);
      //line(pos.x,pos.y, nw.pos.x, nw.pos.y);
      noFill();
      bezier(pos.x, pos.y, cp1.x, cp1.y, cp2.x, cp2.y, nw.pos.x, nw.pos.y);
    }
   } 
  }
}