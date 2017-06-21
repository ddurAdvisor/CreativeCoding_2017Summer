/* Zhang Liqun@SJTU IDM
*/

// declare variables "x", "y", "speed", "col" and "rad"
float x,y,speed,rad,col;

void setup() {
  size(400,400);  

  x=0;
  y=random(height);  
  speed=random(5,10);
  rad=random(20,50);
  col=random(50,255);
  
}

void draw() {
  //turn off background() to draw trails
  //background(200);

  
  x=mouseX;
  y=mouseY;
  fill(x,y, frameCount%255);

  rad=dist(0,0, width/2,height/2)-
    dist(x,y, width/2,height/2);
  ellipse(x,y, rad,rad);

  // increase x for each frame
  x=x+speed;  
  
  // if x goes off screen, set it back to zero
  // and choose new random parameters
  if(x>width) {
    x=0;
    y=random(height);  
    speed=random(5,10);
    rad=random(10,30);
    col=random(50,255);
  }
}