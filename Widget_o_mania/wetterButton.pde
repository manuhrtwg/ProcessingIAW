class wetterButton {

  int wetterC;
  int xpos;
  int ypos;
  int hoe;
  int br;
  float wettertemp;
  int month=month();
  int day;
  
  String wetterBeschr;
  PShape iconWetter;
  String iconWetterID;
  String iconWetterURL;
  wetterButton(int x, int c) {
    
    wetterC = c;
    //wettertemp = wettervorhersageTemp.getFloat(c);
    xpos = x;
    ypos = 340;
    br= 170;
    hoe=150;
    day = day() + 1+c;
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
    //}
    
    println(wetter_temp);
  }

  void drawButton() {
    
    Calendar cal = Calendar.getInstance();
    DateFormat formatter = new SimpleDateFormat("EEE");
    
    
    
    cal.add(Calendar.DATE,wetterC +1);
    String day = formatter.format (cal.getTime());
    
    pushStyle();

    //Float wettertemp = wetter.wettervorhersageTemp.getJSONObject(wetterC).getJSONObject("main").getFloat("temp");
 
 
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
