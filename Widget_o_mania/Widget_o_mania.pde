import ddf.minim.*;

String apikey= "1100de2b457cd201f814651dded49806";


  float lat = 48.78;
  float lon = 9.18;

suchfeld suchfeld;

wetter wetter;

button time;
button weather;
button radio;

button digital;

radioButton radioB0;
radioButton radioB1;
radioButton radioB2;
radioButton radioB3;
radioButton radioB4;
radioButton radioB5;
radioButton radioB6;

wetterButton wetterB0, wetterB1, wetterB2, wetterB3, wetterB4;


buttonOnOff weckerButton;
buttonOnOff playButton1;
buttonOnOff playButton2;

buttonOnOff muteButton;


textButton Schlummertaste;

schieberegler lautstaerke1;



clock digitalClock1;
clock digitalClockBig;
clock analogClock;

wecker wecker1;

float h = hour();

PShape weatherIcon;
PShape timeIcon;
PShape radioIcon;
PShape digitalIcon;
PShape upIcon;
PShape downIcon;
PShape WeckerIcon;
PShape LeiseIcon;
PShape LautIcon;
PShape MuteIcon;

PFont robotoLight;
PFont robotoBold;
PFont robotoThin;
PFont robotoRegular;
PFont robotoRegular70;

String[] radioNamenListe;
String[] radioImgListe;
String urlStream;
String radioName;
String radioImg;
String radioGenre;



icon analogUhr;
icon digitalUhr;

icon weckerUpH;
icon weckerDownH;
icon weckerUpMin;
icon weckerDownMin;




Minim minim;
AudioPlayer weckerAlarm;
AudioPlayer radioPlayer;



void setup() {
  size(900, 600);
  pixelDensity(displayDensity());
  smooth(2);
  minim = new Minim(this);

  JSONArray radioListe = loadJSONArray("radioliste.json");  

  radioNamenListe = new String[radioListe.size()];
  radioImgListe = new String[radioListe.size()];
  for (int i = 0; i < radioListe.size(); i++) {
    JSONObject sender = radioListe.getJSONObject(i);
    radioNamenListe[i] = sender.getString("name");
    radioImgListe[i] = sender.getString("img");
  }
  
  JSONObject wetterVorhersage = loadJSONObject("http://api.openweathermap.org/data/2.5/forecast?lat="
      + lat +"&lon=" + lon + "&appid=" + apikey +"&units=metric&lang=de"); 

    JSONArray wettervorhersageTemp = new JSONArray(); 
    for (int i = 0; i < wetterVorhersage.size(); i++) {
      //println(wetterVorhersage.getJSONObject(i).getJSONObject("main").getFloat("temp"));
    
    }
    
    
    
    //int j = 0;
    //for (int i = 0; i < wetterVorhersage.getJSONArray("list").size(); i++) {
    //  JSONObject wetter_temp = wetterVorhersage.getJSONArray("list").getJSONObject(i);
    //  if ( wetter_temp.getString("dt_txt").contains("12:00:00") ) {
    //    wettervorhersage.setJSONObject(j, wetter_temp);
    //    j++;
    //  }
      
     
    //}
    
  //println(wetterVorhersage);

  urlStream = radioListe.getJSONObject(radioControl).getString("url");
  radioName = radioListe.getJSONObject(radioControl).getString("name");
  radioImg = radioListe.getJSONObject(radioControl).getString("img");

  weckerAlarm = minim.loadFile("hupe.mp3");


  suchfeld = new suchfeld("Suchen");

  wetter = new wetter();
  robotoLight = loadFont("Roboto-Light-48.vlw");
  robotoBold = loadFont("Roboto-Bold-48.vlw");
  robotoThin = loadFont("Roboto-Thin-48.vlw");
  robotoRegular = loadFont("Roboto-Regular-48.vlw");
  robotoRegular70 = loadFont("Roboto-Regular-70.vlw");

  weatherIcon = loadShape("icons-02.svg");
  timeIcon = loadShape("icons-01.svg");
  radioIcon = loadShape("icons-03.svg");
  digitalIcon = loadShape("digital-04.svg");
  WeckerIcon = loadShape("wecker-07.svg");
  LautIcon = loadShape("sound-09.svg");
  LeiseIcon = loadShape("sound-08.svg");
  MuteIcon = loadShape("mute-10.svg");

  upIcon = loadShape("pfeil-05.svg");
  downIcon = loadShape("pfeil-06.svg");

  wecker1 = new wecker(500, 180, 1);

  time = new button(0, 520, 80, width/3, color(20, 150, 150), 1, timeIcon);
  weather = new button(width/3+5, 520, 80, width/3, color(20, 150, 150), 2, weatherIcon);
  radio = new button(width/3 + width/3 +10, 520, 80, width/3, color(20, 150, 150), 3, radioIcon);

  weckerButton = new buttonOnOff(700, 188, 1);
  playButton1 = new buttonOnOff(195, 220, 2);
  playButton2 = new buttonOnOff(700, 17, 1);

  muteButton = new buttonOnOff(650, 12, 1);

  Schlummertaste = new textButton(560, 330, 200, 40, 1, "5 min Schlummern", 20 );

  radioB0 = new radioButton(140, 0);
  radioB1 = new radioButton(190, 1);
  radioB2 = new radioButton(240, 2);
  radioB3 = new radioButton(290, 3);
  radioB4 = new radioButton(340, 4);
  radioB5 = new radioButton(390, 5);

  wetterB0 = new wetterButton(20, 0);
  wetterB1 = new wetterButton(192, 1);
  wetterB2 = new wetterButton(364, 2);
  wetterB3 = new wetterButton(536, 3);
  wetterB4 = new wetterButton(708, 4);


  lautstaerke1 = new schieberegler(80, 440, 20, 260, 1);


  radioPlayer = minim.loadFile(urlStream);


  analogUhr = new icon(320, 130, 40, 40, timeIcon, 1);
  digitalUhr = new icon(380, 130, 40, 40, digitalIcon, 2);

  weckerUpH = new icon (515, 140, 30, 30, upIcon, 4);
  weckerDownH = new icon (515, 240, 30, 30, downIcon, 5);
  weckerUpMin = new icon (600, 140, 30, 30, upIcon, 6);
  weckerDownMin = new icon (600, 240, 30, 30, downIcon, 7);



  digitalClock1 = new clock(750, 35, 0.7, 255);
  digitalClockBig = new clock(40, 300, 2.2, 255);
  analogClock = new clock(110, 320, 2.4, 100);

  wetter.wetterVorhersage();
  wetter.wetterHeute();
};

int screenZ = 1;
int controlC = 1;
int controlW = 8;
int controlWetter = 5;
int controlM = 1;
int ue1 = 40;
boolean WeckerActive = false;
int radioControl = int (random(0, 5));
boolean play = false;



void mouseReleased() {
  time.screenChange();
  weather.screenChange();
  radio.screenChange();
  suchfeld.click();

  if (screenZ == 1) {
    analogUhr.controlChange();
    digitalUhr.controlChange();
  }

  playButton1.Playclick();
  playButton2.Playclick();

  muteButton.click();

  wecker1.mouseDown = false;



  wecker1.click();

  if (screenZ == 3) {
    radioB0.click();
    radioB1.click();
    radioB2.click();
    radioB3.click();
    radioB4.click();
    radioB5.click();
  }

  if (screenZ == 2) {
    wetterB0.click();
    wetterB1.click();
    wetterB2.click();
    wetterB3.click();
    wetterB4.click();
  }
}

void mouseClicked() {

  if (screenZ ==1) {
    weckerButton.click();
  }
}

void keyPressed() {

  suchfeld.eingabe();
  wecker1.textEingabe();
}

void draw() {

  float Volume = radioPlayer.getGain();

  float Gain = map(lautstaerke1.sxpos, lautstaerke1.xpos, lautstaerke1.xpos+lautstaerke1.linebr, -80, 0);
  // println(Volume);


  radioPlayer.setGain(Gain);



  background(40);
  fill(0);
  rect(0, 0, width, 50);



  muteButton.drawMute();

  noStroke();
  fill(0);
  //println(frameRate);



  if (muteButton.active) {
    radioPlayer.mute();
  } else if (play && !muteButton.active) {
    radioPlayer.play();
    radioPlayer.unmute();
    playButton1.active = true;
    playButton2.active = true;
  } else {
    radioPlayer.pause();
    playButton1.active = false;
    playButton2.active = false;
  }
  playButton2.PlayButton();
  textFont(robotoLight, 48);



  if (wecker1.alarmActive() ) {
    fill(200, 0, 0);
    rect(40, 0, 100, 50);

    if (!muteButton.active) {
      weckerAlarm.play();
    } else {
      weckerAlarm.pause();
    }

    if (weckerAlarm.position() == weckerAlarm.length())
    {
      weckerAlarm.rewind();
      weckerAlarm.play();
    }
  } else { 
    weckerAlarm.pause();
  }


  shape(WeckerIcon, 42, 9, 35, 35);

  if (WeckerActive) {

    fill(255);
    textFont(robotoBold);
    textSize(20);
    if (wecker1.hour < 10 && wecker1.min > 10) {
      text("0"+wecker1.hour+":"+ wecker1.min, 80, 35);
    } 

    if (wecker1.min < 10 && wecker1.hour > 10) {
      text(wecker1.hour+":"+ "0"+wecker1.min, 80, 35);
    } 


    if (wecker1.min <= 10 && wecker1.hour <= 10) {
      text("0"+wecker1.hour+":"+"0"+ wecker1.min, 80, 35);
    }

    if (wecker1.min>10 && wecker1.hour>10) {
      text(wecker1.hour+":"+ wecker1.min, 80, 35);
    }

    textFont(robotoRegular);
  } else {
    fill(150);

    textFont(robotoRegular);
    textSize(20);
    text("kein Wecker aktiv", 82, 33);
    textFont(robotoRegular);
  }

  fill(255);
  textSize(20);
  text(int(wetter.temp)+"°C", 600, 33);



  textFont(robotoRegular);
  digitalClock1.digitalClock();

  time.drawBox();
  time.screenActive();
  time.ButtonIcon();

  weather.drawBox();
  weather.screenActive();
  weather.ButtonIcon();

  radio.drawBox();
  radio.screenActive();
  radio.ButtonIcon();

  if (screenZ == 1) {
    fill(70);
    rect(20, 120, (width/2)-25, 350);
    rect((width/2)+5, 120, (width/2)-25, 350);

    fill (0, 200, 200);


    textSize(ue1);
    text("Zeit", 40, 100);
    text("Wecker", (width/2)+10, 100);


    digitalUhr.drawBox();
    digitalUhr.drawIcon();

    analogUhr.drawBox();
    analogUhr.drawIcon();

    if (controlC == 1) {
      analogClock.analogClock();
    } 
    if (controlC == 2) {
      digitalClockBig.digitalClockSeconds();
    } 

    textFont(robotoLight);
    wecker1.drawWeckerfeld();
    weckerUpH.drawIcon();
    weckerUpH.WeckerStellen();

    weckerDownH.drawIcon();
    weckerDownH.WeckerStellen();


    weckerUpMin.drawIcon();
    weckerUpMin.WeckerStellen();

    weckerDownMin.drawIcon();
    weckerDownMin.WeckerStellen();



    weckerButton.drawButton();

    if (wecker1.alarmActive()) {
      Schlummertaste.drawButton();
      if (Schlummertaste.mouseKlicked()) {
        wecker1.WeckerSchlummer();
      }
    }
  }

  if (screenZ == 2) {

    fill(100);
    rect(20, 360, 840, 120);
    fill (0, 200, 200);
    textSize(ue1);
    text("Wetter", 40, 100);

    wetter.drawTabelle();
    wetter.drawWetterHeute();
    wetter.drawThermometer();

    wetterB0.drawButton();
    wetterB1.drawButton();
    wetterB2.drawButton();
    wetterB3.drawButton();
    wetterB4.drawButton();
  }

  if (screenZ == 3) {
    fill (0, 200, 200);
    textSize(ue1);
    text("Radio", 40, 100);

    fill(70);

    rect((width/2)+5, 140, (width/2)-25, 280);

    suchfeld.drawFeld();
    suchfeld.sucheGo();

    radioB0.drawButton();
    radioB1.drawButton();
    radioB2.drawButton();
    radioB3.drawButton();
    radioB4.drawButton();
    radioB5.drawButton();

    radioB1.tab();

    JSONArray radioListe = loadJSONArray("radioliste.json");
    radioName = radioListe.getJSONObject(radioControl).getString("name");
    radioGenre = radioListe.getJSONObject(radioControl).getString("genre");

    if (play) {
      pushStyle();
      fill(40);
      strokeWeight(2);
      stroke(0, 200, 200);
      ellipse(209, 240, 150, 150);
      noStroke();
      textAlign(CENTER);
      fill (255);
      textFont(robotoBold);
      textSize(25);

      text(radioName, 210, 360);
      textFont(robotoThin);
      textSize(20);
      text(radioGenre, 210, 390);
      popStyle();
    } else {
      pushStyle();
      fill(40);
      strokeWeight(2);
      stroke(250);
      ellipse(209, 240, 150, 150);
      noStroke();
      fill (255);
      textAlign(CENTER);
      textFont(robotoBold);
      textSize(25);

      text(radioName, 210, 360);
      textFont(robotoThin);
      textSize(20);
      text(radioGenre, 210, 390);
      popStyle();
    }

    playButton1.PlayButton();

    shape(LeiseIcon, 45, 425, 30, 30);
    shape(LautIcon, 355, 425, 30, 30);
    lautstaerke1.drawRegler();
    lautstaerke1.schieben();
  }

  // wecker1.Alarm();


  wecker1.GoOn();
  if (!mousePressed) {
    controlW = 8;
  }
  textSize(12);
  text(mouseX +" "+mouseY, mouseX, mouseY);
  // println(radioControl);
}
