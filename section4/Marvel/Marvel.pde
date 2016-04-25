String publicKey = "YOUR_KEY_GOES_HERE";
String privateKey = "YOUR_KEY_GOES_HERE";

import java.util.Date;
import java.security.*;

String baseURL = "http://gateway.marvel.com:80/v1/public/";

void setup() {
  Date d = new Date();
  String ts = d.getTime() + "";
  String hash = MD5(ts + privateKey + publicKey);


  try {
    String url = baseURL + "characters?name=cyclops&apikey=2afc8c815dc48b6d65388950eb13a343&ts=" + ts + "&hash=" + hash;
    JSONObject j = loadJSONObject(url);
  } 
  catch (Exception e) {
    println(e);
  }
}

void draw() {
}

public String MD5(String md5) {
   try {
        java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
        byte[] array = md.digest(md5.getBytes());
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < array.length; ++i) {
          sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1,3));
       }
        return sb.toString();
    } catch (java.security.NoSuchAlgorithmException e) {
    }
    return null;
}