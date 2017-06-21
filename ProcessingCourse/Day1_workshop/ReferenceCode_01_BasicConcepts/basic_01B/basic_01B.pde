/* Zhang Liqun@SJTU IDM
*/

void setup() {
  size(400,400);  
}

void draw() {
  background(100);

  // draw orange circle  
  fill(255,200,0);
  noStroke();
  ellipse(200,200, 200,200);  

  // draw rectangle with black outline
  noFill();
  stroke(0,0,0);
  rect(50,50, 300,300);
  
  // draw lines from corners of rectangle
  line(50,50, 350,350);
  line(350,50, 50,350);
}