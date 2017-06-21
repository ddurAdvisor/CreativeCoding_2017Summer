/* Zhang Liqun@SJTU IDM
*/

// example of how to use a for loop.
// see comment below for more details

float x,y,rad,gray;

void setup() {
  size(400,400);  
  
}

void draw() {
  background(200);
  
  // draw 200 random circles
  for(float i=0; i<200; i++) {
    x=random(width);
    y=random(height);
    rad=random(10,100);
    rad=200-i;
    gray=random(255);
    
    fill(gray);
    ellipse(x,y, rad,rad);    
  }            
  
  // turn off looping so that the sketch is
  // only drawn once
  noLoop();  
}

// use mousePressed to redraw
void mousePressed() {
  loop();
}

void keyPressed() {  
  println("Saving frame "+frameCount);
  saveFrame("RandomCircles"+frameCount+".png");
}

/* 

  A for loop has the following structure:
  
  for(init; test; update) {
    statements
  }
  
  The following is a flowchart of how it a for
  loop is executed:
  
       init
         |
         v
   --> test -> false -> ---
  |      |                 |
  |      | true            |
  |      v                 |
  |    statements {}       |
  |      |                 |
  |      v                 |
  |    update              |
  |      |                 |
   ------                  |
                           |
         |-----------------
         |
         v       
         
*/