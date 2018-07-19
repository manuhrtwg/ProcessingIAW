class wetterButton {

  int wetterC;
  int xpos;
  int ypos;
  int hoe;
  int br;
  float wettertemp;
  
  
  String wetterBeschr;
  PShape iconWetter;
  String iconWetterID;
  String iconWetterURL;
  
  int Ymax ;
   int Ymin ;
   int Xmin ;
   int Xmax ;
   float tempMap;
   float tempRandom1;
   float tempRandom2;
   
  wetterButton(int x, int c) {
    
    wetterC = c;
    xpos = x;
    ypos = 340;
    br= 170;
    hoe=150;

    Ymax = 162;
    Ymin = 283;
    Xmin = 400;
    Xmax = 880;
  }
  
  void wetterVorhersage() {
 JSONObject wetterVorhersage = loadJSONObject("http://api.openweathermap.org/data/2.5/forecast?lat="
      + lat +"&lon=" + lon + "&appid=" + apikey +"&units=metric&lang=de"); 

    wettervorhersageTemp = new JSONArray(); 
    int x = 0;
      for (int i = 0; i < wetterVorhersage.getJSONArray("list").size(); i++) {
    wetter_temp = wetterVorhersage.getJSONArray("list").getJSONObject(i);
    if ( wetter_temp.getString("dt_txt").contains("12:00:00") ) {
      wettervorhersageTemp.setJSONObject(x, wetter_temp);
      x++;
    }
  }
    
      wettertemp = wettervorhersageTemp.getJSONObject(wetterC).getJSONObject("main").getFloat("temp");
      
      wetterBeschr = wettervorhersageTemp.getJSONObject(wetterC).getJSONArray("weather").getJSONObject(0).getString("description");
      
      iconWetterID = wettervorhersageTemp.getJSONObject(wetterC).getJSONArray("weather").getJSONObject(0).getString("icon");
       println(wettervorhersageTemp.getJSONObject(wetterC).getJSONObject("main").getFloat("temp"));
    iconWetterURL = iconWetterID +".svg"; 
    
    iconWetter = loadShape(iconWetterURL); 
    
   
   this.tempMap = map(wettertemp,-20,40,283,162);
  
  
   
    this.tempRandom1 = random(tempMap+5, tempMap+25);
    this.tempRandom2 = random(tempMap+2,tempMap+25);
    
 
 
 
    println(wettertemp);
    println(tempMap);
   
  }

  void drawButton() {
    
    Calendar cal = Calendar.getInstance();
    DateFormat formatter = new SimpleDateFormat("EEE");
    
    
    
    cal.add(Calendar.DATE,wetterC +1);
    String day = formatter.format (cal.getTime());
    
    pushStyle();

 
 
    if (hover() || controlWetter == wetterC) {
      fill(30);
      rect(xpos, ypos, br, hoe);
      textAlign(CENTER);
      textFont(robotoBold);
      textSize(25);
      fill(255);
      text(day,xpos+br/2,ypos+30);
    } else {
      fill(40);
      rect(xpos, ypos, br, hoe);
      textAlign(CENTER);
      textFont(robotoRegular);
      textSize(22);
      fill(255);
      text(day,xpos+br/2,ypos+30);
    }
    
    shape(iconWetter, xpos+br/2-25,ypos+50,50,50);
    
    int textX = xpos+br/2;
    fill(255);
    textAlign(CENTER);
    textSize(15);
    text(wetterBeschr, textX, ypos + hoe-30);
    
    textSize(20);
    
    text(int(wettertemp)+"°C ",textX,ypos+ hoe-5);
    
    
    popStyle();
    
    
  }

 void tempTabelle() {
  
   
 
 //println(tempMap);  
   //println(wettertemp);
 if (controlWetter == wetterC) {
   
   
   pushStyle();
   noFill();
   stroke(255);
   strokeWeight(2);
   beginShape();
   vertex(Xmin,tempRandom1);
   bezierVertex(Xmin+100,tempRandom1, 600,tempMap, 671,tempMap );
   bezierVertex(700,tempMap, 800,tempRandom2, 880,tempRandom2);
   endShape();
   popStyle();
 
 
 }
 }
  
  void click() {
  if (hover()) {
  controlWetter = wetterC;
  
  }
  }
  
   boolean hover() {

    if (mouseX > xpos && mouseX < xpos+br && mouseY >ypos && mouseY < ypos+hoe) {
      return true;
    } else { 
      return false;
    }
  }
}
