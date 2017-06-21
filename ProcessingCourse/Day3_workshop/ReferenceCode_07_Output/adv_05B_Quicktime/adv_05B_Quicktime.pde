/* Zhang Liqun@SJTU IDM
*/

// export to QuickTime
import processing.video.*;

MovieMaker mm;

float x[],y[],dir[],speed[];
float rad[],gray[],dirD[];
int num;

void setup() {
  size(640,480);  

  // Save uncompressed Quicktime, at 15 frames per second
  mm = new MovieMaker(this, width, height, "drawing.mov");
  println("Saving movie...");

  num=20;
  x=new float[num];
  y=new float[num];
  dir=new float[num];
  speed=new float[num];
  rad=new float[num];
  gray=new float[num];
  dirD=new float[num];

  for(int i=0; i<num; i++) {
    x[i]=width/2;
    y[i]=height/2;
    rad[i]=random(10,50);
    gray[i]=random(255);
  }

  initDirection();
}

void draw() {
  //  background(200);

  for(int i=0; i<num; i++) {

    // calculate changein direction using
    // direction and speed
    x[i]=x[i]+cos(radians(dir[i]))*speed[i];
    y[i]=y[i]+sin(radians(dir[i]))*speed[i];
    dir[i]=dir[i]+dirD[i];
    
    fill(gray[i]);
    ellipse(x[i],y[i], rad[i],rad[i]);

    // keep x,y on screen
    if(x[i]<0) x[i]=width;
    if(x[i]>width) x[i]=0;
    if(y[i]<0) y[i]=height;
    if(y[i]>height) y[i]=0;  
  }
  
  // Add window's pixels to movie
  mm.addFrame();
  if(frameCount%50==0) println("Frame no. "+frameCount);
}

void initDirection() {
  for(int i=0; i<num; i++) {
    dir[i]=random(360);
    dirD[i]=random(-3,3);
    speed[i]=random(5,10);
  }
}

void mousePressed() {
  initDirection();  
}

void keyPressed() {
  
  if (key == ' ') {
    // Finish the movie if space bar is pressed
    mm.finish();
    // Quit running the sketch once the file is written
    println("Done.");

    exit();
  }
}