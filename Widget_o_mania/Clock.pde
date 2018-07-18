class clock {
  
  
  
  int posx;
  int posy;
  float scale;
  color col;

clock (int x, int y, float s, color c) {
  
posx = x;
posy = y;
scale = s;
col = c;

}

void digitalClock() {
  
  float abstand = 20*scale;
  fill(col);
  textSize(30*scale);
  
  int sec = second();
  if(sec < 10) {
  
  }
  
  int min = minute();
  if(min < 10) {
  text("0"+min,posx+abstand*2.2,posy);
  } 
  
  else {
  text(min,posx+abstand*2.2,posy);
  }
  
  int hour = hour();
  if(hour < 10) {
    text("0"+hour,posx,posy);
  } 
  
  else {
   text(hour,posx,posy);
  }
  
  
 
 
 text(":", posx+abstand*1.8,posy);
 text("Uhr",posx+abstand*4.5,posy);
}

void digitalClockSeconds() {
  
  float abstand = 20*scale;
  fill(col);
  textFont(robotoRegular70);
  textSize(70);
  
  int sec = second();
  if(sec < 10) {
  text("0"+sec,posx+abstand*4.4,posy);
  } else {
  text(sec,posx+abstand*4.4,posy);
  }
  
  int min = minute();
  if(min < 10) {
  text("0"+min,posx+abstand*2.2,posy);
  } else {
  text(min,posx+abstand*2.2,posy);
  }
  
  int hour = hour();
  if(hour < 10) {
    text("0"+hour,posx,posy);
  } else {
   text(hour,posx,posy);
  }
  
  int month = month();
  int day = day();
  int year = year();
 
 
 text(":", posx+abstand*1.8,posy);
 text(":", posx+abstand*4,posy);
 text("Uhr",posx+abstand*6.4,posy);
 
 
 textFont(robotoLight, 30);

 text(day+"."+month+"."+year, posx+ abstand*2.5, posy+ abstand*1.5);
}



void analogClock() {
  
  float circleMx = posx + (scale*100)/2; 
  float radius = 100;
  
  float secRad;
  float minRad;
  float hourRad;
  
  secRad = radius * 1;
  minRad = radius * 1;
  hourRad = radius * 0.6;
  
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
 fill(40);
 ellipse(posx+(scale*100)/2,posy,scale*100,scale*100); 
 

 stroke(0, 200, 200);
 strokeWeight(2);
 line(circleMx,posy,circleMx + cos(s) * secRad,posy + sin(s) * secRad);
 
 stroke(255);
 strokeWeight(3);
 line(circleMx,posy,circleMx + cos(m) * minRad,posy + sin(m) * minRad);
 
 strokeWeight(5);
 line(circleMx,posy,circleMx + cos(h) * hourRad,posy + sin(h) * hourRad);
 
 
 ellipse(circleMx, posy, scale*4,scale*4);
 
stroke(0, 200, 200);
strokeWeight(1);
 beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = circleMx + cos(angle) * secRad;
    float y = posy + sin(angle) * secRad;
    vertex(x, y);
  }
  endShape();
  
  
  strokeWeight(5);
  
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=90) {
    float angle = radians(a);
    float x = circleMx + cos(angle) * secRad;
    float y = posy + sin(angle) * secRad;
    vertex(x, y);
  }
  endShape();
 
}

}
