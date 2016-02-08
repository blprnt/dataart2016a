/*
Data source: http://catalog.data.gov/dataset/work-schedules-and-sleep-patterns-of-railroad-employees-train-and-engine-service
Work schedule and sleep patterns of railroad employees: The code represents activities of the railroad employees around the clock.
*/

void setup()
{
  size(1480, 900);
  background(200);
  loadData();
  //saveFrame("dataViz01.png");
}

void draw()
{
}

void loadData()
{
  //String url = "/Users/dhruvdamle/Documents/ITP/DataArt/dataart2016a/homework/Assignment1/RailroadEmployees/data/Log.xml";
  String url = "Log.xml";
  XML employeeXML = loadXML(url);
  XML[] records = employeeXML.getChildren("Record");
  // <Row
  //       A="ID Number"
  //       B="Date"
  //       C="Activity"
  //       D="Start time"
  //       E="End time"
  //       F="Sleep location"
  //     />

  int i=0;
  //for each entry in XML
  for (XML record : records) 
  {
    //get start time from XML
    int startTime = 0;
    String startTimeString = (record.getChild("Row").getString("D"));  //get start time
    int[] startTimeDigits = int(split(startTimeString, ':'));  //split it into hh and mm
    if (startTimeDigits.length > 1)  //if valid start time value
      startTime = startTimeDigits[0]*100 + startTimeDigits[1];  //convert into 0000 - 2400 format

    //get end time from XML
    int endTime = 0;
    String endTimeString = (record.getChild("Row").getString("E"));
    int[] endTimeDigits = int(split(endTimeString, ':'));
    if (endTimeDigits.length > 1)
      endTime = endTimeDigits[0]*100 + endTimeDigits[1];  //convert into 0000 - 2400 format

    //leng = number of hours in between start and end time
    int leng = endTime - startTime;
    leng = (leng<0) ? (2400 - startTime + endTime) : leng;  //entries that start before, and end after midnight

    //if (i%5==0)   // (i%n == 0), draw every 5th entry. Scaling down the data.
    //{

      String activity = record.getChild("Row").getString("C");  //Activity
      //S=sleep, P=personal time, C=commute, W=work, L=limbo, I=Interim Release
      switch(activity.charAt(0))      //convert String to char (just one character in string anyways)
      {

      case 'P':    //personal time
        stroke(80, 80, 255, 20);  //blue
        break;
      case 'C':    //commute
        stroke(255, 80, 80, 50);  //red
        break;
      case 'W':    //work
        stroke(100, 255, 100, 20); //green
        break;
      case 'L':    //limbo
      case 'I':    //interim release
      case 'S':    //sleep
      default:
        stroke(0, 20);  //grey
        break;
      }

      pushMatrix();
      translate(width/2, height/2);
      rotate(map(startTime, 0, 2400, 0, 2*PI));    //rotate w.r.t. start time, 24 hours clock. midnight/ 0 hours is effectively rotate(0).
      rotate(1.5*PI);  //midnight (0 or 2400 hours) is top, morning (600) is right, noon (1200) is bottom, and evening (1800) is left)
      line(60, 0, 60+ pow(leng, 0.75), 0);    //draw line
      popMatrix();
    //}
    i++;
  }
}
