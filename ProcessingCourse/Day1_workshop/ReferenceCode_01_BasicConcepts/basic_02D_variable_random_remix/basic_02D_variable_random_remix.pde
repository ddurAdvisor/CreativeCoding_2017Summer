/* Zhang Liqun@SJTU IDM
*/

// declare variables "x", "y", "speed", "col" and "rad"
float x,y,speed,rad;
float xd,yd;
int col,col2;

void setup() {
  size(400,400);  

  x=0;
  y=random(0.25f,0.75f)*height;  
  speed=random(5,10);
  xd=random(0.5f,1)*speed;
  yd=random(-0.5f,0.5f)*speed;  
  rad=random(20,50);
  
  col=color(random(50,255),random(100,255),0);
  if(random(100)>60) col=color(0,random(150,255),random(150,255));
  if(brightness(col)>180) col2=color(0);
  else col2=color(255);
  
  background(100,0,0);
  smooth();
}

void draw() {
  //turn off background() to draw trails
//  background(200);

  fill(col);
  stroke(col2);

  rad=rad+random(-5,5);
  if(rad<10) rad=10;
  else if(rad>100) rad=100;
  
  ellipse(x,y, rad,rad);

  // increase x for each frame
  x=x+xd;  
  y=y+yd;  
  
  // if x goes off screen, set it back to zero
  // and choose new random parameters
  if(x>width+rad || y<-rad || y>height+rad) {
    x=0;
    y=random(0.25f,0.75f)*height;  
    speed=random(5,10);
    xd=random(0.5f,1)*speed;
    yd=random(-0.5f,0.5f)*speed;  
    
    rad=random(10,30);
    col=color(random(50,255),random(100,255),0);
    if(random(100)>60) col=color(0,random(150,255),random(150,255));
    if(brightness(col)>180) col2=color(0);
    else col2=color(255);
  }
}