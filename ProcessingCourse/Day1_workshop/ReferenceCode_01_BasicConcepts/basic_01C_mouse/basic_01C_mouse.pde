/* Zhang Liqun@SJTU IDM
*/

void setup() {
  size(400,400);  
}

void draw() {
  background(100);
  
  fill(255,200,0);
  noStroke();
  
  // use the built-in variables mouseX and 
  // mouseY to get mouse position
  ellipse(mouseX,mouseY, 200,200);  
}