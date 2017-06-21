/* Zhang Liqun@SJTU IDM
*/

// declare two variables called "x" and "y"
float x,y;

void setup() {
  size(400,400);  

  x=0;
  y=random(height);  
}

void draw() {
//  background(200);

  ellipse(x,y, 50,50);

  // increase x for each frame
  x=x+3;  
  
  // if x goes off screen, set it back to zero
  // and choose new y position 
  if(x>width+25) {
    x=0;
    y=random(height);  
  }
}