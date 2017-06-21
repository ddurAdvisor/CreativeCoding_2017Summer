/* Zhang Liqun@SJTU IDM
*/

// declare a variable called "x"
float x;

void setup() {
  size(400,400);  
  x=0;
}

void draw() {
  background(200);

  ellipse(x,200, 50,50);

  // increase x for each frame
  x=x+3;  
  
  // if x goes off screen, set it back to zero
  if(x>width+25) x=-25;
}