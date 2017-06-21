/* Zhang Liqun@SJTU IDM
*/

void setup() {
  size(400,400);  
  
}

void draw() {
  background(200);
  fill(255);

  // use translate to move origin to center
  // of canvas
  translate(width/2,height/2);
  ellipse(0,0, 300,300);
}