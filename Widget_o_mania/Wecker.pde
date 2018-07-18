class wecker {
  int xpos;
  int ypos;
  int scale;
  int br;
  int hoe;

  int hour= hour();
  int min = minute();
  int timer = 0;
  boolean mouseDown;
  boolean active1;
  boolean active2;
  int startTime = 0;
  String hourTxt;
  String minTxt;

  wecker(int x, int y, int s) {
    xpos = x;
    ypos = y;
    scale = s;
    br = 60*scale;
    hoe = 50*scale;
    hourTxt = "";
    minTxt = "";
  }


  void drawWeckerfeld() {
    fill(40);
    noStroke();
    if (active1) {
      fill(30);
    }

    rect(xpos, ypos, 60*scale, 50*scale, scale*10);
    fill(40);

      if (active2) {
      fill(30);
    }
    rect(xpos+(80*scale), ypos, 60*scale, 50*scale, scale*10);


    fill(255);








    if (mousePressed && hour < 25 && controlW == 4 ) { 
      if (!mouseDown) {
        hour++;
        mouseDown = true;
        startTime = 0;
      } 
      if (mousePressed && hour == 24 && controlW == 4) {
        hour=0;
      }
      startTime++;
      if (frameCount%8 == 0 && startTime > 30) {
        hour++;
      }
    }

    if (mousePressed && hour > -2 && controlW == 5 ) { 
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
        min = 0;
      }
      startTime++;
      if (frameCount%4 == 0 && startTime > 30) {
        min++;
      }
    }

    if (mousePressed && min > -2 && controlW == 7 ) { 
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


    if (!active1) {
      if (hour < 10) {
        textSize(40);
        text("0"+hour, xpos+(scale*8), ypos+(scale*40));
      } else {
        textSize(40);
        text(hour, xpos+(scale*8), ypos+(scale*40));
      }
    } else {
      textSize(40);
      text(hourTxt, xpos+(scale*8), ypos+(scale*40));
      rect(xpos+textWidth(hourTxt)+8, ypos+0.1*hoe, 2, hoe*0.8);
    }
text(":", xpos+(scale*67), ypos+(scale*38));
    if (!active2) {
      
      if (min < 10) {
        textSize(40);
        text("0"+min, xpos+(scale*88), ypos+(scale*40));
      } else {
        textSize(40);
        text(min, xpos+(scale*88), ypos+(scale*40));
        
      }
    } else {
      textSize(40);
        text(minTxt, xpos+(scale*88), ypos+(scale*40));
        rect(xpos+(scale*88)+textWidth(minTxt), ypos+0.1*hoe, 2, hoe*0.8);
    }
  }


  void textEingabe() {

    if (active1 && keyCode == BACKSPACE) {
      hourTxt = hourTxt.substring(0, max(0, hourTxt.length()-1));
    } else if (active1 && keyCode != ENTER && hourTxt.length() <2) {
      switch(key) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        hourTxt = hourTxt + key;
        break;
      case CODED:
        break;
      }
    }
    
     if (active2 && keyCode == BACKSPACE) {
      minTxt = minTxt.substring(0, max(0, minTxt.length()-1));
    } else if (active2 && keyCode != ENTER && minTxt.length() <2) {
      switch(key) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        minTxt = minTxt + key;
        break;
      case CODED:
        break;
      }
    }

    if (active1 && int(hourTxt) < 24) {
      if (keyCode == ENTER) {
        hour = int(hourTxt);
        active1=false;
        active2=true;
        minTxt = "";
      }
    } else if (keyCode == ENTER && active1) {
      hourTxt = "23";
      hour = 23;
      active1=false;
      active2=true;
      minTxt = "";
      
    }
  
  
  if (active2 && int(minTxt) < 60 && minTxt != "") {
      if (keyCode == ENTER) {
        min = int(minTxt);
       
      }
    } else if (keyCode == ENTER && active2 && minTxt != "") {
      minTxt = "59";
      min = 59;
  
    }
  }


  boolean alarmActive() {
    if (WeckerActive && min == minute() && hour == hour() ) {
      return true;
    } else {
      return false;
    }
  }

  void GoOn() {
    if (alarmActive() && second() == 59) {
      if (min ==59) {
        min = 1;
        hour++;
      } else {
        min++;
      }
    }
  }

  void WeckerSchlummer() {
    if (alarmActive()) {
      if (min > 54 && min < 60) {
        min = 5-(60-min);
        hour = hour+1;
      } else {
        min = min + 5;
      }
    }
  }

  void click() {
    if (hover1()) {
      active1 = true;
      hourTxt = "";
    } else if (active1 && !hover1()) {
      active1 = false;
      if (int(hourTxt) < 24 ) {
      hour = int(hourTxt);
      } else {
      hourTxt = "23";
      hour = 23;
      }
    }

    if (hover2()) {
      active2 = true;
      minTxt = "";
    } else if (active2 && !hover2()) {
      active2 = false;
      if (int(minTxt) < 60) {
      min = int(minTxt);
      } else {
      minTxt = "59";
      min = 59;
      }
    }
  }

  boolean hover1() {

    if (mouseX > xpos && mouseX < xpos+br && mouseY >ypos && mouseY < ypos+hoe) {
      return true;
    } else { 
      return false;
    }
  }

  boolean hover2() {

    if (mouseX > xpos+(80*scale) && mouseX < xpos+(80*scale)+br && mouseY >ypos && mouseY < ypos+hoe) {
      return true;
    } else { 
      return false;
    }
  }
}
