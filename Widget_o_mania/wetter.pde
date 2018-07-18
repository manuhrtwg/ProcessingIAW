class wetter {
  String stadt;
  Float temp;
  int humidity;
  Float pressure;
  String beschreibung;
  
  PShape humidityIcon = loadShape("feucht-11.svg");



  String apikey= "1100de2b457cd201f814651dded49806";

  // Koordinaten für Stuttgart
  float lat = 48.78;
  float lon = 9.18;

  void wetterVorhersage() {
 
  }
  
  
  void drawTabelle() {
    pushStyle();
    stroke(255);
    strokeWeight(2);
  line(400,300,880,300);
  line(400,300,400,150);
  
  for (int i = -20; i < 50; i = i+10) {
    stroke(100);
    line(400,242,880,242);
    stroke(255);
    strokeWeight(1);
    line(395,242-i*2,400,242-i*2);
    
    textSize(10);
    fill(255);
    text(i,378, 245-i*2);
    noStroke();
    
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
    
    println(wetterHeute);
  }

  void drawWetterHeute() {
    fill(255);
    textFont(robotoRegular);
    text(int(temp)+"°", 80, 190);
    textSize(20);
    text(stadt, 80, 215);
    shape(humidityIcon, 80, 228, 20,20);
    textFont(robotoLight);
    textSize(20);
    text(humidity+"%", 110, 245);
    
    
  }


  void drawThermometer() {
    
    float tempLowY = 283;
    float tempHighY = 162;
    
    float mapTemp = map(temp,-20,40,tempLowY,tempHighY);
    float rectY = 300-mapTemp;

    fill(100);
    rect(248, 150, 4, 150);
    fill(0, 200, 200);
    rect(248, mapTemp, 4, rectY);

    fill(0, 200, 200);
    ellipse(250, 300, 20, 20);
    for (int i = -20; i < 50; i = i+10) {
    stroke(0,200,200);
    strokeWeight(1);
    line(252,242-i*2,254,242-i*2);
    textSize(10);
    text(i,260, 245-i*2);
    noStroke();
    
    }
  }
  
  
  

}
