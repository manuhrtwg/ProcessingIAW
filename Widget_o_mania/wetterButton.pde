class wetterButton {

  int wetterC;
  int xpos;
  int ypos;
  int hoe;
  int br;
  float wettertemp;
  wetterButton(int x, int c) {
    
    wetterC = c;
    //wettertemp = wettervorhersageTemp.getFloat(c);
    xpos = x;
    ypos = 360;
    br= 170;
    hoe=120;
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
    
    
    
    //for (int i = 0; i < wetterVorhersage.size(); i++) {
      wettertemp = wettervorhersageTemp.getJSONObject(wetterC).getJSONObject("main").getFloat("temp");
       println(wettervorhersageTemp.getJSONObject(wetterC).getJSONObject("main").getFloat("temp"));
    
    //}
    
    //println(wettervorhersageTemp);
  }

  void drawButton() {
    pushStyle();

    //Float wettertemp = wetter.wettervorhersageTemp.getJSONObject(wetterC).getJSONObject("main").getFloat("temp");
 
 
    if (hover() || controlWetter == wetterC) {
      fill(30);
      rect(xpos, ypos, br, hoe);
    } else {
      fill(40);
      rect(xpos, ypos, br, hoe);
    }
    
    int textX = xpos+br/2;
    fill(255);
    textSize(20);
    textAlign(CENTER);
    text(int(wettertemp)+"°C ",xpos+br/2,ypos+ hoe-10);
    
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
