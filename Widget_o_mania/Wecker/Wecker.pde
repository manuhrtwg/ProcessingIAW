class wecker {
  int xpos;
  int ypos;
  int scale;

  int hour= hour();
  int min = minute();
  int timer = 0;
  boolean mouseDown;
  int startTime = 0;

  wecker(int x, int y, int s) {
    xpos = x;
    ypos = y;
    scale = s;
  }


  void drawWeckerfeld() {
    fill(40);
    noStroke();

    rect(xpos, ypos, 60*scale, 50*scale, scale*10);
    rect(xpos+(80*scale), ypos, 60*scale, 50*scale, scale*10);


    fill(255);








    if (mousePressed && hour < 25 && controlW == 4 ) { 
      if (!mouseDown) {
        hour++;
        mouseDown = true;
        startTime = 0;
      } 
      if (mousePressed && hour == 24 && controlW == 4) {
        hour=1;
      }
      startTime++;
      if (frameCount%8 == 0 && startTime > 30) {
        hour++;
      }
    }

    if (mousePressed && hour > -1 && controlW == 5 ) { 
      if (!mouseDown) {
        hour--;
        mouseDown = true;
        startTime = 0;
      }
      startTime++;
      if (hour == -1) {
        hour=23;
      }
      if (frameCount%8 == 0 && startTime > 30) {
        hour--;
      }
    }


    if (mousePressed && min < 61 && controlW == 6 ) { 
      if (!mouseDown) {
        min++;
        mouseDown = true;
        startTime = 0;
      }
      if (min == 60) {
        min = 1;
      }
      startTime++;
      if (frameCount%4 == 0 && startTime > 30) {
        min++;
      }
    }

    if (mousePressed && min > -1 && controlW == 7 ) { 
      if (!mouseDown) {
        min--;
        mouseDown = true;
        startTime = 0;
      }
      if (min == -1) {
        min = 59;
      }
      startTime++;
      if (frameCount%4 == 0 && startTime > 30) {
        min--;
      }
    }





    if (hour < 10) {
      textSize(40);
      text("0"+hour, xpos+(scale*8), ypos+(scale*40));
    } else {
      textSize(40);
      text(hour, xpos+(scale*8), ypos+(scale*40));
    }

    text(":", xpos+(scale*67), ypos+(scale*38));
    if (min < 10) {
      textSize(40);
      text("0"+min, xpos+(scale*88), ypos+(scale*40));
    } else {
      textSize(40);
      text(min, xpos+(scale*88), ypos+(scale*40));
    }
  }

  void Alarm() {
    if (WeckerActive && hour == hour() && min == minute() ) {
      if (frameCount%10 == 0) {
      } else {
        fill(200, 0, 0);
        ellipse(40, 25, 20, 20);
      }
    }
  }
  
  
  void WeckerSchlummer() {
  if (WeckerActive) {
  min = min + 5;
  }
  
  }
}