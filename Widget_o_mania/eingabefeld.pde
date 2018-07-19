class eingabefeld 
{
  
  int xpos = (width/2)+15;
  int ypos;
  int br = 150;
  int hoe = 48;
  int control;
  String txt ="neues Radio";
  boolean active;

  eingabefeld(int y,int c) {

    ypos = y;
    control = c;
  }

  void eingabe() {

    if (active && keyCode == BACKSPACE) {
      txt = txt.substring(0, max(0, txt.length()-1));
    } else if (active && txt.length() < 35 && keyCode != ENTER && keyCode != SHIFT) {

      txt = txt + key;
    }
  }

void drawFeld() {
fill(255);
text(txt, xpos+30,ypos+ hoe*0.75);
rect(xpos+30+textWidth(txt), ypos+0.1*hoe, 2, hoe*0.8);
}

  void click() {
    if (hover()) {
      active = true;
      txt = "";
    }
    if (!hover()) {
      active = false;

      txt = "Neues Radio";
    }
  } 
  
  void EditEnter(){
if (keyPressed && key == ENTER) {
controlRadioEdit = 20;
radioNamenListe[control] = txt;

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
