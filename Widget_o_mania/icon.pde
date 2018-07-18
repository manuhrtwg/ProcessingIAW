class icon {
 int xpos;
 int ypos;
 int br;
 int hoe;
 PShape name;
 int control;
 
 
 icon (int x, int y, int b, int h, PShape n, int c) {
 xpos = x;
 ypos = y;
 br = b;
 hoe = h;
 name = n;
 control = c;
 }
 
void drawBox() {
   if(hover() || (controlC == control)) {
     fill(60);
    rect(xpos-(br*0.2),ypos,br+(2*br)*0.2,hoe,hoe*0.2); 
   } else {fill(50);
    rect(xpos-(br*0.2),ypos,br+(2*br)*0.2,hoe,hoe*0.2);
   }
    if (mousePressed && (mouseButton == LEFT) && hover()) 
 {
  fill(80);
    rect(xpos-(br*0.2),ypos,br+(2*br)*0.2,hoe,hoe*0.2); 
 }
  
  }
 
 
 
 void drawIcon() {
  if(hover() || (controlC == control) || controlW == control ) {
 
  shape(name, xpos-(br*0.1), ypos-(hoe*0.1), br*1.2, hoe*1.2);
  } else {
  shape(name, xpos, ypos, br, hoe);
  }
  
  
 }
 
 void controlChange() {
   if(hover()) {
  controlC = control;
   }
  }
 
 void WeckerStellen() {
 if(hover() && mousePressed && (mouseButton == LEFT) ) {
  controlW = control;
 } 
 
 }
 
 void Mute() {
 if(hover() && mousePressed && (mouseButton == LEFT) ) {
 controlM = control;
 }
 }
 
 
 
 
 
 boolean hover() 
 {
 if (mouseX > xpos && mouseX < xpos+br && mouseY >ypos && mouseY < ypos+hoe) {
      return true;
    } else { 
      return false;
    }
 }
 
 }
 
  
