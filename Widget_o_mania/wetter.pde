class wetter {
  String stadt;
  Float temp;
  int humidity;
  Float pressure;
  String beschreibung;
  String wetterIconID;
  String wetterIconURL;
  PShape wetterIcon;
  
  Float tempMap;
  Float tempRandom1;
  Float tempRandom2;
  

  PShape humidityIcon = loadShape("feucht-11.svg");



  String apikey= "1100de2b457cd201f814651dded49806";

  // Koordinaten für Stuttgart
  float lat = 48.78;
  float lon = 9.18;









  void drawTabelle() {
    pushStyle();
    stroke(255);
    strokeWeight(2);
    line(400, 290, 880, 290);
    line(400, 290, 400, 150);

    for (int i = -20; i < 50; i = i+10) {
      stroke(100);
      line(400, 242, 880, 242);
      stroke(255);
      strokeWeight(1);
      line(395, 242-i*2, 400, 242-i*2);

      textSize(10);
      fill(255);
      text(i, 378, 245-i*2);
      noStroke();
    }

    for (int i = 0; i < 24; i++) {
      stroke(255);

      line(410+i*20, 290, 410+i*20, 295);
      text(i, 408+i*20, 308);
    }

    popStyle();
  }

  void drawWetterVorhersage() {

    //for (int i=0; i<5; i++) {
    //Float temp = wettervorhersage.getJSONObject(i).getJSONObject("main").getFloat("temp");
    //}
  }



  void wetterHeute() {

    JSONObject wetterHeute;
    wetterHeute = loadJSONObject("http://api.openweathermap.org/data/2.5/weather?lat=" + lat +"&lon=" + lon + "&appid=" + apikey +"&units=metric&lang=de"); 


    stadt = wetterHeute.getString("name");
    temp = wetterHeute.getJSONObject("main").getFloat("temp");
    humidity = wetterHeute.getJSONObject("main").getInt("humidity");
    pressure = wetterHeute.getJSONObject("main").getFloat("pressure");
    beschreibung = wetterHeute.getJSONArray("weather").getJSONObject(0).getString("description");
    wetterIconID = wetterHeute.getJSONArray("weather").getJSONObject(0).getString("icon");
    //println(wetterHeute);

    wetterIconURL = wetterIconID + ".svg";
    wetterIcon = loadShape(wetterIconURL);
    
   this.tempMap = map(temp,-20,40,283,162);
   this.tempRandom1 = random(tempMap+4, tempMap+25);
   this.tempRandom2 = random(tempMap+4,tempMap+25);
   
   
  }
  void drawGraph() {
    
   int Xmin =400;
   
  pushStyle();
   noFill();
   stroke(0,200,200);
   strokeWeight(2);
   beginShape();
   vertex(Xmin,tempRandom1);
   bezierVertex(Xmin+100,tempRandom1, 600,tempMap, 671,tempMap );
   bezierVertex(700,tempMap, 800,tempRandom2, 880,tempRandom2);
   endShape();
   popStyle();
  }

  void drawWetterHeute() {
    pushStyle();
    fill(255);
    textAlign(CENTER);
    textFont(robotoRegular);
    textSize(25);
    text(int(temp)+"°", 120, 200);
    textSize(20);
    text(stadt, 120, 170);
    //shape(humidityIcon, 140, 190, 20,20);
    textFont(robotoLight);
    textSize(20);
    //text(humidity+"%", 110, 190);
    textSize(15);

    text(beschreibung, 120, 305);
    shape(wetterIcon, 83, 210, 70, 70);
    popStyle();
  }


  void drawThermometer() {

    float tempLowY = 283;
    float tempHighY = 162;

    float mapTemp = map(temp, -20, 40, tempLowY, tempHighY);
    float rectY = 300-mapTemp;

    fill(100);
    rect(248, 150, 4, 150);
    fill(0, 200, 200);
    rect(248, mapTemp, 4, rectY);

    fill(0, 200, 200);
    ellipse(250, 300, 20, 20);
    for (int i = -20; i < 50; i = i+10) {
      stroke(0, 200, 200);
      strokeWeight(1);
      line(252, 242-i*2, 254, 242-i*2);
      textSize(10);
      text(i, 260, 245-i*2);
      noStroke();
    }
  }
}
