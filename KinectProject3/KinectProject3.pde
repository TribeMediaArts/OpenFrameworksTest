import SimpleOpenNI.*;
SimpleOpenNI kinect;
color c;
PImage test;

void setup()
{
  size(640*2, 480);
  kinect = new SimpleOpenNI(this);
  
  kinect.enableDepth();
  kinect.enableRGB();
  test = loadImage("worstphoneever_monkey.png");
}

void draw(){
  
  kinect.update();
  
  image(kinect.depthImage(), 0, 0);
  image(kinect.rgbImage(), 640, 0);
  c = get(mouseX, mouseY);
  if(red(c) > 220){
    image(test, mouseX, mouseY);
  }
  println(c);

}

void mousePressed(){
  

  println("r: " + red(c) + "g: " + green(c) + "b: " + blue(c));
}



