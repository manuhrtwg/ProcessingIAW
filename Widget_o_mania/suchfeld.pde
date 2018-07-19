class suchfeld {
  int xpos;
  int ypos;
  int br;
  int hoe;
  String txt;
  String txtLow;

  String radio00;
  String radio11;
  String radio22;
  String radio33;
  String radio44;
  String radio55;
  

  boolean active;

  suchfeld(String text) {

    txt = text;
    xpos = (width/2)+5;
    ypos = 90;
    br = (width/2)-25;
    hoe = 40;
    
    
    
  }

  void drawFeld() {
    fill (30);
    rect(xpos, ypos, br, hoe,hoe/2); 
    
textFont(robotoRegular);
textSize(29);

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
      controlRadioEdit = 20;
      
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
    
     this.radio00 = trim(radioNamenListe[0]);
     this.radio11 = trim(radioNamenListe[1]);
     this.radio22 = trim(radioNamenListe[2]);
     this.radio33 = trim(radioNamenListe[3]);
     this.radio44 = trim(radioNamenListe[4]);
     this.radio55 = trim(radioNamenListe[5]);
     
     
    String radio0 = radio00.toLowerCase();
    String radio1 = radio11.toLowerCase();
    String radio2 = radio22.toLowerCase();
    String radio3 = radio33.toLowerCase();
    String radio4 = radio44.toLowerCase();
    String radio5 = radio55.toLowerCase();
    
    //println(radio0);
    

    txtLow = trim(txt.toLowerCase());
    
    if (active && keyPressed && key == ENTER) {
      //println(txtLow);
      if (txtLow.contains(radio0)) {
        radioControl = 0;
        active=false;
        txt = "Suchen";
      } else if (txtLow.equals(radio1) == true) {
        radioControl = 1;
        active=false;
        txt = "Suchen";
      } else if (txtLow.equals(radio2) == true) {
        radioControl = 2;
        active=false;
        txt = "Suchen";
      } else if (txtLow.equals(radio3) == true) {
        radioControl = 3;
        active=false;
        txt = "Suchen";
      } else if (txtLow.equals(radio4) == true) {
        radioControl = 4;
        active=false;
        txt = "Suchen";
      } else if (txtLow.equals(radio5) == true) {
        radioControl = 5;
        active=false;
        txt = "Suchen";
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
