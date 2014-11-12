/*
SOURCES
mod of strobe method from www.openprocessing.org/sketch/45098
Location 1) park & 64th
http://www.centralchurchnyc.org/?q=ourhistory
http://www.nycago.org/Organs/NYC/img/CentralPresMadAv1928Ext.jpg
*/
//LIBRARIES
import ddf.minim.*;

//OBJECTS
Minim minim;
AudioPlayer main, loc1;
Button buttonLoc1;
Button buttonLoc2;
Button buttonLoc3;
Button buttonLoc4;
Button buttonLoc5;
Button buttonLoc6;

//GLOBAL VARIABLES
PImage img;
PImage photo;
float p = PI;
float pulsing = 0;
float pulseCenter = 125;
float pulseC = 50;
color c = 255;

void setup() {
  size(1117, 681);
  smooth();
  //load map image
  img = loadImage("map.png");
  background(img);
  //load audio files
  minim = new Minim(this);
  main = minim.loadFile("spring.mp3");
  loc1 = minim.loadFile("chainsaw.mp3");
  //play background music
  main.play();
  
  //park & 64th
  buttonLoc1 = new Button(622, 655, 25, 25);
  buttonLoc2 = new Button(300, 300, 25, 25);
  buttonLoc3 = new Button(800, 500, 25, 25);
  
  photo = loadImage("church.jpg");
}

void draw() {
  buttonLoc1.display();
  buttonLoc1.pulse();
  buttonLoc2.display();
  buttonLoc2.pulse();
  buttonLoc3.display();
  buttonLoc3.pulse();
  
  if (mousePressed) {
    loc1.play();
    while(loc1.play()) {
      buttonLoc1.showImage();
    }
  }
}

class Button {
  float buttonX;
  float buttonY;
  float buttonWidth;
  float buttonHeight;
  //variable for resizing location photos
  int photoHeight = 200;
  
  Button(float tempButtonX, float tempButtonY, float tempButtonWidth, float tempButtonHeight) {
    buttonX = tempButtonX;
    buttonY = tempButtonY;
    buttonWidth = tempButtonWidth;
    buttonHeight = tempButtonHeight;
  }


void display() {
  smooth();
  noStroke();
  //fill(c);
  ellipse(buttonX, buttonY, buttonWidth, buttonHeight);
}

void pulse() {
  pulsing = pulseCenter + pulseC*sin(p);
  p = p + .01;
  c = color(0, pulsing, 0);
  fill(c);
}

//void playNoise() {
  //if}

void showImage() {
  /*while(playNoise()) {
    showImage
  }*/
  photo.resize(0, photoHeight);
  image(photo, width-255, height-photoHeight);
}

}

void stop() {
  main.close();
  loc1.close();
  minim.stop();
  super.stop();
}
