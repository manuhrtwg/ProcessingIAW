class radioButton {


  int ypos;
  int radioC;
  int xpos = (width/2)+5;
  int hoe = 48;
  int br = (width/2)-25;

JSONArray radioListe = loadJSONArray("radioliste.json");
   

  radioButton(int y, int r) {

    ypos = y;
    radioC = r;
     
  }



  void drawButton() {
    
    radioName = radioListe.getJSONObject(radioC).getString("name");
    radioImg = radioListe.getJSONObject(radioC).getString("img");
    radioGenre = radioListe.getJSONObject(radioC).getString("genre");

    if (hover()) {
      fill(20);
      rect((width/2)+5, ypos, (width/2)-25, hoe);
      fill(255);
      textFont(robotoBold);
      textSize(20);
      text(radioName, xpos+40, ypos+3*(hoe/4));

      fill(150);
      textFont(robotoThin);
      textSize(20);
      text(radioGenre, xpos+260, ypos+ 3*(hoe/4));
    } else {

      fill(40);
      rect((width/2)+5, ypos, (width/2)-25, hoe);
      textFont(robotoRegular);
      fill(255);
      textSize(20);
      text(radioName, xpos+40, ypos+3*(hoe/4));

      fill(150);
      textFont(robotoThin);
      textSize(20);
      text(radioGenre, xpos+260, ypos+ 3*(hoe/4));
    }


    if (mouseDown() || radioControl == radioC) {

      fill(10);
      rect((width/2)+5, ypos, (width/2)-25, hoe);

      fill(255);
      textFont(robotoBold);
      textSize(20);
      text(radioName, xpos+40, ypos+3*(hoe/4));

      fill(150);
      textFont(robotoThin);
      textSize(20);
      text(radioGenre, xpos+260, ypos+ 3*(hoe/4));
    }
  }

  void click() {
    if (hover()) {
      radioControl = radioC;
       
      urlStream = radioListe.getJSONObject(radioControl).getString("url");
      radioPlayer.pause();
      radioPlayer = minim.loadFile(urlStream);
    }
  }
  void tab() {
    if (keyPressed && keyCode == DOWN || keyPressed && keyCode == RIGHT) {

      if (radioControl <5) {
        radioControl++;
        
        urlStream = radioListe.getJSONObject(radioControl).getString("url");
        radioPlayer.pause();
        radioPlayer = minim.loadFile(urlStream);
      } else {
      }
    } else if (keyPressed && keyCode == UP || keyPressed && keyCode == LEFT) {
      if(radioControl >0) {
      radioControl--;
         
        urlStream = radioListe.getJSONObject(radioControl).getString("url");
        radioPlayer.pause();
        radioPlayer = minim.loadFile(urlStream);
      }
    }
  
}



boolean mouseDown() {
  if (mousePressed && (mouseButton == LEFT) && hover()) {
    return true;
  } else {
    return false;
  }
}


boolean hover() {

  if (mouseX > xpos && mouseX < xpos+br && mouseY > ypos && mouseY < ypos+hoe) {
    return true;
  } else { 
    return false;
  }
}


}
