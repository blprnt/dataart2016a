import java.util.Date;
import java.text.SimpleDateFormat;

float[] bounds = {-79.4119,34.7766,-78.4122,35.3387};
//<when>2015-08-19T18:54:25</when>
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");

ArrayList<PTimeVector> allPoints = new ArrayList();

Date startDate;
Date endDate;
Date currentDate;
float timeMag = 3000;

void setup() {
  size(1280,720,P3D);
  smooth(4);
  loadFlightPath("FlightAware_N151ZG_KFAY_KFAY_20150819.kml");
  startDate = allPoints.get(0).date;
  endDate = allPoints.get(allPoints.size() - 1).date;
  currentDate = startDate;
}

void draw() {
  //Time code
  float secsPerFrame = 1.0 / frameRate;
  float realTime = secsPerFrame * timeMag;
  currentDate = new Date((long) (currentDate.getTime() + (realTime * 1000)));
  if (currentDate.getTime() > endDate.getTime()) currentDate = startDate;
  println(currentDate);
  
  background(0);
  for (PTimeVector p:allPoints) {
    float x = map(p.x, bounds[0], bounds[2], 0, width);
    float y = map(p.y, bounds[1], bounds[3], height, 0);
    float z = map(p.z, 0, 1000, 0, 100);
    
    noStroke();
    if (p.date.getTime() < currentDate.getTime()) ellipse(x,y,3,3);
  }
}

void loadFlightPath(String url) {
  XML pathXML = loadXML(url);
  XML trackXML = pathXML.getChildren("Document/Placemark/gx:Track")[0];
  
  XML[] whens = trackXML.getChildren("when");
  XML[] coords = trackXML.getChildren("gx:coord");
  
  for(int i = 0; i < coords.length; i++) {
    XML coord = coords[i];
    //<gx:coord>-78.80389 35.00583 457</gx:coord>
    String[] nums = split(coord.getContent(), " ");
    float lat = float(nums[1]);
    float lon = float(nums[0]);
    float alt = float(nums[2]);
    
    XML when = whens[i];
    //<when>2015-08-19T18:54:25</when>
    Date d = new Date();
    try {
      d = sdf.parse(when.getContent());
    } catch(Exception e) {
      println("BAD DATE? " + when);
    }
    
    PTimeVector loc = new PTimeVector(lon,lat,alt,d);
    allPoints.add(loc);
  }
}