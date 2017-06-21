/* Zhang Liqun@SJTU IDM
*/

void setup() {
  // OPENGL is added as a parameter to size()
  // to indicate we want to use it as a renderer
  size(400,400, P3D);  
}

void draw() {
  background(200);

  translate(width/2,height/2,0);

  lights();
  
  // rotate around the Y axis to spin in space
  rotateY(radians(frameCount)*2);

  sphereDetail(30);
  
//  noStroke();
  
  fill(255);
  box(100);

  pushMatrix();
  translate(-100,-100,0);
  
  fill(255,200,0);
  sphere(75);
  popMatrix();
  
  pushMatrix();
  translate(100,150,-100);
  
  fill(0,50,100);
  sphere(150);
  popMatrix();
}