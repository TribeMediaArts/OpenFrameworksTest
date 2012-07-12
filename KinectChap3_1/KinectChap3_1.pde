import SimpleOpenNI.*;
import processing.opengl.*;
SimpleOpenNI kinect;


int z = 200;

void setup(){
 
 size(1024, 768, OPENGL);
 kinect = new SimpleOpenNI(this);
 kinect.enableDepth(); 
 
}

void draw(){
 
  background(0);
  kinect.update();
  
  translate(width/2, height/2, -1000);
  rotateX(radians(180));
  
  stroke(255);
  
  PVector[] depthPoints = kinect.depthMapRealWorld();
  for(int i = 0; i < depthPoints.length; i++){
    
    PVector currentPoint = depthPoints[i];
    
    point (currentPoint.x, currentPoint.y, currentPoint.z);
  }
}
