//Uncanny X-Men - 2258

String publicKey = "2afc8c815dc48b6d65388950eb13a343";
String privateKey = "14bb7b24c808de7fb47710539e0faf9c6fa40ba4";

import java.util.Date;
import java.security.*;

String baseURL = "http://gateway.marvel.com:80/v1/public/";

ArrayList<Comic> allComics = new ArrayList();
ArrayList<ComicCharacter> allCharacters = new ArrayList();
HashMap<String, ComicCharacter> characterMap = new HashMap();

void setup() {
  size(900,900);
  background(0);
  getComicsFromSeries("2258");
  renderGrid();
}

void draw() {
}

void renderGrid() {
  for (int i = 0; i < allCharacters.size(); i++) {
    ComicCharacter character = allCharacters.get(i);
    float y = i * 14;
    text(character.name, 10, y);
  }
}

void getComicsFromSeries(String id) {
  //Get a list of the first 100 comics from the series
  JSONObject comics = getMarvelData("series/" + id + "/comics?noVariants=false&limit=100&orderBy=issueNumber");
  //Save the result just in case
  saveJSONObject(comics, id + ".json");
  JSONObject data = comics.getJSONObject("data");
  JSONArray results = data.getJSONArray("results");
  for (int i = 1; i < results.size(); i++) {
    //Get each comic
    JSONObject comic = results.getJSONObject(i);
    //Make the Comic
    Comic c = new Comic();
    allComics.add(c);
    c.issue = comic.getInt("issueNumber");
    JSONArray characters = comic.getJSONObject("characters").getJSONArray("items");
    for (int j = 0; j < characters.size(); j++) {

      String name = characters.getJSONObject(j).getString("name");
      if (!characterMap.containsKey(name)) {
        //We don't have this character
        //For each comic get the character
        ComicCharacter character = new ComicCharacter();
        character.name = name;
        //Link the objects together
        character.comics.add(c);
        c.characters.add(character);
        //add it to the list(s)
        allCharacters.add(character);
        characterMap.put(name, character);
      } else {
        //We do have this character
        characterMap.get(name).comics.add(c);
        c.characters.add(characterMap.get(name));
      }
    }
  }
}

JSONObject getMarvelData(String query) {
  //Get the pieces we need for the hash authentication
  Date d = new Date();
  String ts = d.getTime() + "";
  String hash = MD5(ts + privateKey + publicKey);

  //Make a null JSON object
  JSONObject j = null;

  try {
    //Construct the URL and load from it
    String url = baseURL + query + "&apikey=" + publicKey + "&ts=" + ts + "&hash=" + hash;
    j = loadJSONObject(url);
  } 
  catch (Exception e) {
    println(e);
  }

  //Return the JSON
  return(j);
}

public String MD5(String md5) {
  try {
    java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
    byte[] array = md.digest(md5.getBytes());
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < array.length; ++i) {
      sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1, 3));
    }
    return sb.toString();
  } 
  catch (java.security.NoSuchAlgorithmException e) {
  }
  return null;
}