import java.awt.Robot;
import java.awt.image.BufferedImage;
import java.awt.Rectangle;
import java.awt.Color;

Robot windowgrabber;
Color pixgrab;
int gridsize = 50;

void setup(){
  
  size(800, 400);
  noStroke();
  try {
    windowgrabber = new Robot();
  } 
  catch (Exception e) {
    println(e.getMessage());
  }

}

void draw(){
  
  int SampleX=0;
  int SampleY=0;
  int rectstartX = 400;
  int rectstartY = 0;
  
  Rectangle r = new Rectangle(600, 600, 55, 30);
  BufferedImage img1 = windowgrabber.createScreenCapture(r);
  PImage img2 = new PImage(img1);
  image(img2, 0, 0);
  
  for (int x2 = 0; x2<8; x2++){
  
        for (int x = 0; x<55; x++){
          color pixgrab = img2.get(SampleX+x,SampleY);
          fill(pixgrab);
          rect(rectstartX,rectstartY,gridsize,gridsize);
          rectstartX = rectstartX+gridsize;
        }
     rectstartX = 400;
     SampleX=0;
     SampleY = SampleY + 1;
     rectstartY = rectstartY + gridsize;
  }
  println(frameRate);
}