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
AudioPlayer main, loc1, loc2, loc3, loc4, loc5, loc6;
Button buttonLoc1;
Button buttonLoc2;
Button buttonLoc3;
Button buttonLoc4;
Button buttonLoc5;
Button buttonLoc6;
Avenue ave11;
Avenue ave10;
Avenue avePark;
Avenue ave4;



//GLOBAL VARIABLES
PImage img;
PImage photo;
float p = PI;
float pulsing = 0;
float pulseCenter = 125;
float pulseC = 50;
float diameter = 25;
int loc1X = 622;
int loc1Y = 655;
int loc2X = 622;
int loc2Y = 200;
int loc3X = 275;
int loc3Y = 400;
int loc4X = 215;
int loc4Y = 110;
int loc5X = 695;
int loc5Y = 500;
int loc6X = 695;
int loc6Y = 400;
color c = 255;
int avenueHeight = height;
int avenueWidth = 10;
int avenueY = 0;
int ave11X = 200;
int ave10X = 400;
int aveParkX = 622;
int ave4X = 695;


void setup() {
  size(1117, 681);
  smooth();
  //load map image
  img = loadImage("map.png");
  background(img);
  //load audio files
  minim = new Minim(this);
  //main = minim.loadFile("OOIOOreturnToNew!!!.mp3");
  loc1 = minim.loadFile("NoiseClothes.mp3");
  loc2 = minim.loadFile("NoiseMetro.mp3");
  loc3 = minim.loadFile("NoiseSewer.mp3");
  loc4 = minim.loadFile("NoisePanama.mp3");
  loc5 = minim.loadFile("NoiseHarborM.mp3");
  loc6 = minim.loadFile("NoiseTruck.mp3");
  //play background music
  //main.play();
  //main.loop();
  
  //avenues
  ave11 = new Avenue(ave11X, avenueY, avenueWidth, avenueHeight);
  ave10 = new Avenue(ave10X, avenueY, avenueWidth, avenueHeight);
  avePark = new Avenue(aveParkX, avenueY, avenueWidth, avenueHeight);
  ave4 = new Avenue(ave4X, avenueY, avenueWidth, avenueHeight);
  
  //hotspots
  buttonLoc1 = new Button(loc1X, loc1Y, diameter, diameter);
  buttonLoc2 = new Button(loc2X, loc2Y, diameter, diameter);
  buttonLoc3 = new Button(loc3X, loc3Y, diameter, diameter);
  buttonLoc4 = new Button(loc4X, loc4Y, diameter, diameter);
  buttonLoc5 = new Button(loc5X, loc5Y, diameter, diameter);
  buttonLoc6 = new Button(loc6X, loc6Y, diameter, diameter);
}

void draw() {
  ave11.drawAve();
  ave10.drawAve();
  avePark.drawAve();
  ave4.drawAve();
  buttonLoc1.display();
  buttonLoc1.pulse();
  buttonLoc2.display();
  buttonLoc2.pulse();
  buttonLoc3.display();
  buttonLoc3.pulse();
  buttonLoc4.display();
  buttonLoc4.pulse();
  buttonLoc5.display();
  buttonLoc5.pulse();
  buttonLoc6.display();
  buttonLoc6.pulse();
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
  
  void showImage() {
    while(loc1.isPlaying()) {
      photo.resize(0, photoHeight);
      image(photo, width-255, height-photoHeight);
    }
  }
}


class Avenue {
  //draw a line that runs the height of the window and width of the street
  float aveX;
  float aveY;
  float aveW;
  float aveH;
  
  Avenue(float tempAveX, float tempAveY, float tempAveW, float tempAveH) {
    aveX = tempAveX;
    aveY = tempAveY;
    aveW = tempAveW;
    aveH = tempAveH;
  }

  void drawAve() {
    smooth();
    noStroke();
    rect(aveX, aveY, aveW, aveH);  
  }

//void wiggle() {}
//make line vibrate while audio track is playing


}


void mousePressed() {
  if (mouseX > loc1X - diameter/2 && mouseX < loc1X + diameter/2) {
      if (mouseY > loc1Y - diameter/2 && mouseY < loc1Y + diameter/2) {
        loc1.rewind();
        loc1.play();
      }
      else if (mouseY > loc2Y - diameter/2 && mouseY < loc2Y + diameter/2) {
        loc2.rewind();
        loc2.play();
      }
  }
  else if (mouseX > loc3X - diameter/2 && mouseX < loc3X + diameter/2) {
      if (mouseY > loc3Y - diameter/2 && mouseY < loc3Y + diameter/2) {
        loc3.rewind();
        loc3.play();
      }
  }
  else if (mouseX > loc4X - diameter/2 && mouseX < loc4X + diameter/2) {
      if (mouseY > loc4Y - diameter/2 && mouseY < loc4Y + diameter/2) {
        loc4.rewind();
        loc4.play();
      }
  }
  else if (mouseX > loc5X - diameter/2 && mouseX < loc5X + diameter/2) {
      if (mouseY > loc5Y - diameter/2 && mouseY < loc5Y + diameter/2) {
        loc5.rewind();
        loc5.play();
      }
      else if (mouseY > loc6Y - diameter/2 && mouseY < loc6Y + diameter/2) {
        loc6.rewind();
        loc6.play();
      }
  }
}


void stop() {
  //main.close();
  loc1.close();
  loc2.close();
  loc3.close();
  loc4.close();
  loc5.close();
  loc6.close();
  //spring.close();
  minim.stop();
  super.stop();
}
