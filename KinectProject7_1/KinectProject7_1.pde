import SimpleOpenNI.*;
SimpleOpenNI kinect;

int closestValue;
int closestX;
int closestY;

float lastX;
float lastY;

float image1X;
float image1Y;

//declere a boolean to store whether or not the image is moving
boolean imageMoving;

PImage image1;

void setup(){
  
  size(640, 480);
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
  
  //start the image out moving
  imageMoving = true;
  
  //load image from a file
  image1 = loadImage("neko.png");
  background(255);
}

void draw(){
  
  closestValue = 8000;
  kinect.update();
  
  int [] depthValues = kinect.depthMap();
  
  for(int y = 0; y < 480; y++){
    for(int x = 0; x < 640; x++){
      int reversedX = 640 - x - 1;
      int i = reversedX + y *640;
      int currentDepthValue = depthValues[i];
      
      if(currentDepthValue > 610 &&
      currentDepthValue < 1525 &&
      currentDepthValue < closestValue) {
        
        closestValue = currentDepthValue;
        closestX = x;
        closestY = y;
      }
    }
  }
  
  float interpolatedX = lerp(lastX, closestX, 0.3);
  float interpolatedY = lerp(lastY, closestY, 0.3);
  
  background(0);
  
  if(imageMoving){
    image1X = interpolatedX;
    image1Y = interpolatedY;
  }
  image(image1, image1X, image1Y);
  
  lastX = interpolatedX;
  lastY = interpolatedY;
}

void mousePressed(){
  imageMoving = !imageMoving;
}
