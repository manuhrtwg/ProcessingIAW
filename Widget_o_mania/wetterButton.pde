class wetterButton {

  int wetterC;
  int xpos;
  int ypos;
  int hoe;
  int br;
  
  wetterButton(int x, int c) {
    wetterC = c;
    xpos = x;
    ypos = 360;
    br= 170;
    hoe=120;
  }

  void drawButton() {
    pushStyle();
    
    
 
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
    //text(tempMin+"°C - "+tempMax+"°C",textX,ypos+ hoe-10);
    
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
