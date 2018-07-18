class suchfeld {
  int xpos;
  int ypos;
  int br;
  int hoe;
  String txt;
  String txtLow;


  String radio0;
  String radio1;
  String radio2;
  String radio3;
  String radio4;
  String radio5;

  boolean active;

  suchfeld(String text) {

    txt = text;
    xpos = (width/2)+5;
    ypos = 90;
    br = (width/2)-25;
    hoe = 40;
    radio0 = "radio free fm";
    radio1 = "swr 3";
    radio2 = "bigfm";
    radio3 = "dasding";
    radio4 = "jazz radio berlin";
    radio5 = "radio bob";
  }

  void drawFeld() {
    fill (30);
    rect(xpos, ypos, br, hoe,hoe/2); 

    if (active) {

      fill(20);
      textSize(20);
      rect(xpos, ypos, br, hoe,hoe/2);
      fill(200);
      rect(xpos+40+textWidth(txt), ypos+0.1*hoe, 2, hoe*0.8);
    }
    fill(100);
    textSize(20);
    text(txt, xpos+40, ypos+3*(hoe/4));
  }

  void click() {
    if (hover()) {
      active = true;
      txt = "";
    }
    if (!hover()) {
      active = false;
      
        txt = "Suchen";
      
    }
  } 

  void eingabe() {

    if (active && keyCode == BACKSPACE) {
      txt = txt.substring(0, max(0, txt.length()-1));
    } else if (active && txt.length() < 35 && keyCode != ENTER && keyCode != SHIFT) {

      txt = txt + key;
    }
  }


  void sucheGo() {

    txtLow = txt.toLowerCase();
    if (active && keyPressed && key == ENTER) {
      println(txtLow);
      if (txtLow.equals(radio0) == true) {
        radioControl = 0;
      } else if (txtLow.equals(radio1) == true) {
        radioControl = 1;
      } else if (txtLow.equals(radio2) == true) {
        radioControl = 2;
      } else if (txtLow.equals(radio3) == true) {
        radioControl = 3;
      } else if (txtLow.equals(radio4) == true) {
        radioControl = 4;
      } else if (txtLow.equals(radio5) == true) {
        radioControl = 5;
      } 

      if (txtLow.equals(radio0) != true && txtLow.equals(radio1) != true && txtLow.equals(radio2) != true && txtLow.equals(radio3) != true 
        && txtLow.equals(radio4) != true && txtLow.equals(radio5) != true) {
        txt = "kein Treffer";
      } else {
      
      JSONArray radioListe = loadJSONArray("radioliste.json");  
      urlStream = radioListe.getJSONObject(radioControl).getString("url");
      radioPlayer.pause();
      radioPlayer = minim.loadFile(urlStream);
      }
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
