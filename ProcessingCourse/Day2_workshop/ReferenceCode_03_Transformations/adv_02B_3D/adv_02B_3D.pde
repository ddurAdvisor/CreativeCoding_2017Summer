/* Zhang Liqun@SJTU IDM
*/


void setup() {
  // OPENGL is added as a parameter to size()
  // to indicate we want to use it as a renderer
  size(400,400, P3D);  
}

void draw() {
  background(200);

  // Drawing in 3D using transformations is
  // the same as 2D, but extends to 3 axis
  
  translate(width/2,height/2);

  // rotate around the Y axis to spin in space
  rotateY(radians(frameCount)*2);
  rotateX(radians(frameCount)*1.5);

  for(float i=0; i<12; i++) {
    rect(50,-5, 100,10);
    rotate(radians(30));
  }
}