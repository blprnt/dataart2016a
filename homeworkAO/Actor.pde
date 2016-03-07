class Actor {
 String name; 
 String type;
 ArrayList<String> traits = new ArrayList();
  
 Actor() {
 }
  
 Actor fromJSON(JSONObject j) {
   name = j.getString("Name");
   type = j.getString("Type");
   //trait = j.getString("Type");
   return(this);
 }
}