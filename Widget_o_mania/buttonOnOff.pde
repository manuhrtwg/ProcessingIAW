class buttonOnOff 
{

int xpos;
int ypos;
float scale;
float br;
float hoe;
boolean active;


buttonOnOff(int x, int y, int s) {
xpos = x;
ypos = y;
scale = s;

}


void drawButton() {
 br = scale*80;
hoe = scale*40; 
  
fill(40);
if (active) {
  WeckerActive = true;
  fill(0,200,200);
  rect(xpos,ypos,br,hoe,hoe);
  fill(255);
  ellipse((xpos+br)-hoe/2,ypos+(hoe/2),hoe,hoe);
} else {
  WeckerActive = false;
fill(40);
  rect(xpos,ypos,br,hoe,hoe);
 fill(255); 
 ellipse(xpos+(hoe/2),ypos+(hoe/2),hoe,hoe);
 
}
}

void PlayButton() {
  br = scale*20;
hoe = scale*20; 
  
  if (!play && !hover()) {
    
    fill (255);
  triangle(xpos+ scale*2,ypos, xpos+ (scale*17),ypos+ (scale*10),xpos+scale*2, ypos+(scale*10)*2);
  } else if (hover() && !play) {
    fill(200);
  beginShape(TRIANGLES);
  vertex(xpos+scale*2,ypos);
  vertex(xpos+ (scale*17),ypos+ (scale*10) );
  vertex(xpos+scale*2, ypos+ (scale*10)*2);
  endShape();
  } else if (play && !hover()) {
    fill (255);
  rect(xpos, ypos, scale*5, scale * 20 );
  rect(xpos+scale*12, ypos, scale*5, scale*20);
  } else if (play && hover()) {
    fill(200);
  rect(xpos, ypos, scale*5, scale * 20 );
  rect(xpos+scale*12, ypos, scale*5, scale*20);
  }
  
  if (active) {
   play = true; 
  } else {
  play = false;
  }
}

void drawMute() {
  
  br = scale*30;
hoe = scale*30; 

if (active) {
  MuteIcon.disableStyle();
  fill(255);
  stroke(255);
  strokeWeight(30);
shape(MuteIcon, xpos,ypos,br,hoe);
} else if (hover()) {
MuteIcon.disableStyle();
  fill(180);
  stroke(180);
  strokeWeight(30);
shape(MuteIcon, xpos,ypos,br,hoe);
} else {
  MuteIcon.disableStyle();
  fill(100);
  stroke(100);
  strokeWeight(30);
  shape(MuteIcon, xpos,ypos,br,hoe);

}
}



boolean hover() {

    if (mouseX > xpos && mouseX < xpos+br && mouseY >ypos && mouseY < ypos+hoe) {
      return true;
    } else { 
      return false;
    }
  }
  
 void click() {
if(hover()) {
active = !active;
}
} 

void Playclick() {
if(hover()) {
play = !play;
}
}
  

}
