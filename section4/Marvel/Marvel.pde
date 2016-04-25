//Uncanny X-Men - 2258

String publicKey = "2afc8c815dc48b6d65388950eb13a343";
String privateKey = "14bb7b24c808de7fb47710539e0faf9c6fa40ba4";

import java.util.Date;
import java.security.*;

String baseURL = "http://gateway.marvel.com:80/v1/public/";

void setup() {
  //println(getMarvelData("characters?name=cyclops"));
  
  //http://gateway.marvel.com:80/v1/public/series/2258/comics?noVariants=false&limit=100&apikey=2afc8c815dc48b6d65388950eb13a343
  getComicsFromSeries("2258");
}

void draw() {
}

void getComicsFromSeries(String id) {
  JSONObject comics = getMarvelData("series/2258/comics?noVariants=false&limit=100&orderBy=issueNumber");
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