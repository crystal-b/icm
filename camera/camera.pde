/* This is a manipulated combination of Ben Fry's Framinham from 
the Video Library examples and of Elie Zananiri's grid from
http://www.silentlycrashing.net/p5/libs/video/ */

import processing.video.*;

Capture video; 
int videoX, videoY;
int videoWidth, videoHeight;
boolean isCapturing;
int column;
int columnCount;
int lastRow;
int lastColumn;

int[] manipulate;

void setup() { 
  size(640, 480);

  videoX = 0;
  videoY = 0;
  videoWidth = width/2;
  videoHeight = height/2;

  video = new Capture(this, videoWidth, videoHeight, 50);
  video.start();
  isCapturing = true;
  
  // = 640/320 = 2
  //int columnCount = width / video.width;
  //video.width and videoWidth seem to create the same value
  int columnCount = width / videoWidth;
  // = 480/240 = 2
  int rowCount = height / video.height;
  //= 2-1 = 1
  lastRow = rowCount - 1;
  lastColumn = columnCount - 1;
  
  // = 1*240 * 640 = 153,600
  //noise in bottom 2 frames
   manipulate = new int[lastRow*video.height * width];
  //noise in all 4 frames
  //manipulate = new int[lastRow*video.height + lastColumn*video.width];
  //also noise in all 4 frames
  //manipulate = new int[(video.height - 1) + video.width];
  
}

void draw() { 
  image(video, videoX, videoY);

} 

void captureEvent(Capture c) {

  
  if (isCapturing) {
    c.read(); 

    videoX += videoWidth;

    // if we're at the end of the line...
    if (videoX >= width) {
      // ...go to the beginning of the next line
      videoX = 0;
      videoY += videoHeight;

      // if we're at the bottom of the window...
      if (videoY >= height) {
        // ...restart from the top
        videoY = 0;
      }
    }
  }
  
loadPixels();
      for (int i = manipulate.length; i < pixels.length; i++) {
        pixels[i] = color(random(255), 0, random(50,200));
      }
     updatePixels();
  }

void keyPressed() {
  if (key == ' ') {
    isCapturing = !isCapturing;
    println("freeze");
  }
}
