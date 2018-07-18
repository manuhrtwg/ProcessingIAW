class textButton {
  int xpos;
  int ypos;
  int br;
  int hoe;

  float scale;
  String txt;
  int textSize;

  textButton(int x, int y, int b, int h, float s, String text, int textS) {
    xpos = x;
    ypos = y;
    br=b;
    hoe=h;
    scale = s;
    txt = text;
    textSize = textS;
  }


  void drawButton() {

    if (hover()) {
      fill(50);
      rect (xpos, ypos, br, hoe, hoe*0.2);
      fill(255);
      textSize(textSize+1);
      text (txt, xpos+br*0.08, ypos+hoe*0.69);
    } else {
      fill(40);
      rect (xpos, ypos, br, hoe, hoe*0.2);
      fill(255);
      textSize(textSize);
      text (txt, xpos+br*0.1, ypos+hoe*0.68);
    }
  }


  boolean mouseKlicked() {
    if (hover() && mousePressed) {
      return true;
    } else {
      return false;
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
