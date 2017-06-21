/* Zhang Liqun@SJTU IDM
*/

void setup() {
  size(400,400);  

}

void draw() {
  background(200);

  fill(255);
  
  // use pushMatrix() to save world coordinates 
  pushMatrix();  
   
  translate(150,150);
  ellipse(0,0, 200,200);

  rotate(radians(frameCount)*-3);

  for(float i=0; i<12; i++) {
    rect(50,-5, 100,10);
    rotate(radians(30));
  }
  
  // and popMatrix() to restore them
  popMatrix();  


  fill(128);
  pushMatrix();  

  translate(mouseX,mouseY);
  ellipse(0,0, 200,200);

  rotate(radians(frameCount)*2);
  for(float i=0; i<12; i++) {
    ellipse(75,0, 50,50);
    rotate(radians(30));
  }
  
  popMatrix();  
  
  line(0,0, mouseX,mouseY);
}