/* Zhang Liqun@SJTU IDM
*/

float x,y,xd,yd;

void setup() {
  size(400,400);  
  x=width/2;
  y=height/2;
  
  xd=random(-3,3);
  yd=random(-3,3);
}

void draw() {
  
  ellipse(x,y, 50,50);
  x=x+xd;  
  y=y+yd;
  
  if(x>width) x=0;
  if(x<0) x=width;
  if(y>height) y=0;
  if(y<0) y=height;
}

void mousePressed() {
  xd=random(-3,3);
  yd=random(-3,3);  
}

void mouseMoved() {
  if(mouseX<width/2) xd=-1.5;
  else xd=1.5;
  if(mouseY<height/2) yd=-1.5;
  else yd=1.5;  
}