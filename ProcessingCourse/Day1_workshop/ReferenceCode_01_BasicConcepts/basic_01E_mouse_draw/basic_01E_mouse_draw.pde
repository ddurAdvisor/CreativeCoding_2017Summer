/* Zhang Liqun@SJTU IDM
*/

void setup() {
  size(400,400);  
  background(200);
}

void draw() {
  // if we do background() we clear the canvas
 //background(200);
  
  // use mouseX and mouseY for mouse position
  // pmouseX and pmouseX is last frame's mouse position
  stroke(100);
  line(mouseX,mouseY, pmouseX,pmouseY);  
}