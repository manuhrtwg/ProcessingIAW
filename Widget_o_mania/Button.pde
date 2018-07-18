
class button
{ 
  int xpos;
  int ypos;
  int hoe; // höhe
  int br; // breite
  color col; // colour
  int intialCol;
  int screen; // screen
  PShape icon;
  
  
  


  button (int x, int y, int h, int b, color c, int s, PShape i ) {
    xpos = x;
    ypos = y;
    hoe = h;
    br = b;
    col = c;
    intialCol = c;
    screen = s;
    icon = i;
  }

  void drawBox() {
    if (hover()) {
      fill (0, 100, 100);
      rect (xpos,ypos-10,br,hoe+10);
    } else {

      fill(col);
    }
    
    noStroke();
    rect(xpos, ypos, br, hoe);
  }
  
  boolean mouseDown() {
  if (mousePressed && (mouseButton == LEFT) && hover()){
   return true; 
  } else {return false;}
  
  }
  
  void screenChange() {
      if (hover()) {
      
      fill (0, 200, 200);
      rect (xpos,ypos-10,br,hoe+10);
      
      screenZ = screen;
      
      }
  }
      
  void screenActive() {
      if ((screenZ == screen) || mousePressed && hover()) {
        fill (0, 200, 200);
      rect (xpos,ypos-10,br,hoe+10);
      }
  
  
     
    
  }
  
  void ButtonIcon() {
  if (screenZ == screen || hover()) {
    shape(icon, xpos+(br/2)-(hoe*0.4),ypos+(hoe/16),hoe*0.8,hoe*0.8);
  } else {
    shape(icon, xpos+(br/2)-(hoe*0.4),ypos+(hoe/4),hoe*0.6,hoe*0.6);  
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