/* Zhang Liqun@SJTU IDM
*/

// moving using direction and speed
float x,y,dir,speed,dird;

void setup() {
  size(400,400);  
  
  x=width/2;
  y=height/2;
  
  initDirection();
}

void draw() {
//  background(200);
  
  // calculate change in position using
  // direction and speed  
  dir=dir+dird;
//    dir=random(360);

  x=x+cos(radians(dir))*speed;
  y=y+sin(radians(dir))*speed;
  
  ellipse(x,y, 50,50);

  // keep x,y on screen
  if(x<0) x=width;
  if(x>width) x=0;
  if(y<0) y=height;
  if(y>height) y=0;  
}

void initDirection() {
  dir=random(360);
  dird=random(-2,2);
  speed=random(5,10);
}

void mousePressed() {
  initDirection();
}