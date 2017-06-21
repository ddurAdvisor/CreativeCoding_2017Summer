/* Zhang Liqun@SJTU IDM
*/

void setup() {
  size(400,400);  
}

void draw() {
  background(100);
  

  noFill();
  stroke(0);
  line(0,0, mouseX,mouseY);
  line(400,0, mouseX,mouseY);
  line(400,400, mouseX,mouseY);
  line(0,400, mouseX,mouseY);

  fill(255,200,0);
  noStroke();
  
  // use mouseX and mouseY for mouse position
  ellipse(mouseX,mouseY, 200,200);  
  
  // draw additional ellipse with radius depending on 
  // mouse position
  fill(255,50,0);
  ellipse(mouseX,mouseY, (mouseX+mouseY)/4,(mouseX+mouseY)/4);  

}