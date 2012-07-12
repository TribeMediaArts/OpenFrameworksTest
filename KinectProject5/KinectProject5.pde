import SimpleOpenNI.*;
SimpleOpenNI kinect;

int closestValue;
int closestX;
int closestY;

PImage monkey;

void setup(){
  
  size(640, 480);
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
  monkey = loadImage("MonkeyKing.png");
}

void draw(){
  
  closestValue = 8000;
  kinect.update();
  
  //get the depth array form the kinect
  int[] depthValues = kinect.depthMap();
  
  //for each row in th depth image
  for(int y = 0; y < 480; y++){
    
    for(int x = 0; x < 640; x++){
      
      //pull out the corresponding value from the depth array
      int i = x + y * 640;
      int currentDepthValue = depthValues[i];
      
      //if that pixel is the closest one we've seen so far
      if(currentDepthValue > 0 && currentDepthValue < closestValue){
        
        //save its value
        closestValue = currentDepthValue;
        //and save its position(both x and y coordinates)
        
        closestX = x;
        closestY = y;
      }
    }
  }
  
  //draw the peth image on the screen
 // image(kinect.depthImage(), 0, 0);
 background(255,0, 0);
  
  //draw a red cirtcle over it
  //position at the x and y coordinates
  //we saved for the closest pixel
  image(monkey, closestX, closestY);
}
        


