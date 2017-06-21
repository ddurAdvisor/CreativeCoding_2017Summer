/* Zhang Liqun@SJTU IDM
*/

// moving using direction and speed
float x,y,deg,rad;

void setup() {
  size(400,400);  
  
  deg=0;
  rad=150;
  
  x=width/2;
  y=height/2;
}

void draw() {
  background(200);
  
  translate(width/2,height/2); 

  noFill();
  ellipse(0,0, rad*2,rad*2);
  line(-rad,0, rad,0);
  line(0,rad, 0,-rad);
  
  
  fill(255);
  x=cos(radians(deg))*rad;
  y=sin(radians(deg))*rad;

  line(x,y, x,0);
  line(x,y, 0,y);
  
  ellipse(x,y, 50,50);
  
  deg=deg+0.5;
}