/* Zhang Liqun@SJTU IDM
*/

void setup() {
  size(400,400);  
  smooth();
}

void draw() {
  background(200);

  fill(255);
  // use translate to move origin to center
  // of canvas
  translate(width/2,height/2);
  ellipse(0,0, 300,300);

  fill(128);
  // to rotate we need to give our degrees
  // as radians, using the radians() method
  
  for(float i=0; i<6; i++) {
    rotate(radians(60));
    scale(1.2);
    ellipse(50,0, 50,50);
  }
}