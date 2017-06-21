/* Zhang Liqun@SJTU IDM
*/

float rotx,roty;

void setup() {
  size(400,400, P3D);  
}

void draw() {
  background(200);

  fill(255);

  // translate to center of canvas
  translate(width/2,height/2);
  
  rotx=rotx+(((float)mouseX/(float)width)-0.5)*2;
  roty=roty+(((float)mouseY/(float)height)-0.5)*2;
  
  // do 3D rotations
  rotateY(radians(roty));
  rotateX(radians(rotx));

  // funky scaling
  scale(abs(cos(radians(frameCount)))+0.1);
  
  for(float j=0; j<6; j++) {
    rotate(radians(15));
    rotateY(radians(30));
    for(float i=0; i<12; i++) {
      pushMatrix();
      translate(100,0,0);
      box(100,10,10);
      popMatrix();
      rotate(radians(30));
    }
  }
}