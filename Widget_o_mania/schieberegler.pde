class schieberegler {
int xpos;
int ypos;
int sbr;
int linebr;
int scale;
int hoe = 20;
float sxpos;

int xmaxL = xpos;
int xmaxR = xpos + linebr;
float strokeColor;



schieberegler(int x, int y, int b, int lb, int s) {
xpos = x;
ypos = y;
sbr = b;
linebr = lb;
scale = s;
sxpos = xpos+(linebr*0.6);

}


void drawRegler() {
strokeColor = map(sxpos, xpos,xpos+linebr,80,240);
stroke(strokeColor);
strokeWeight(2);
fill(255);
line(xpos,ypos,xpos+linebr,ypos);
noStroke();
ellipse(sxpos,ypos,sbr,sbr);
}

void schieben() {
if (hover() && mousePressed) {
sxpos = mouseX;
}
}

boolean hover() {

    if (mouseX > xpos && mouseX < xpos+linebr && mouseY > ypos-sbr*2 && mouseY < ypos+sbr*2) {
      return true;
    } else { 
      return false;
    }
  }
}
