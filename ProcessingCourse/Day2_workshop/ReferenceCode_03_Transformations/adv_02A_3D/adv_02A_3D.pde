/* Zhang Liqun@SJTU IDM
*/

void setup() {
  size(400,400);  

}

void draw() {
  background(200);

  fill(255);

  // Drawing in 2D using transformations
  
  translate(width/2,height/2);

  for(float i=0; i<12; i++) {
    rect(50,-5, 100,10);
    rotate(radians(30));
  }
  
}