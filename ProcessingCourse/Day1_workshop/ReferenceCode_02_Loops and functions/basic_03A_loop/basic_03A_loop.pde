/* Zhang Liqun@SJTU IDM
*/

/* 

  A for loop has the following structure:
  
  for(init; test; update) {
    statements
  }
  
  Flowchart of how a for loop is executed:
  
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
         v   Continue program   
         
*/

void setup() {
  size(400,400);  
}

void draw() {
  background(200);

  noFill();
  stroke(0);
  
  // draw 21 lines from top left corner
  for(float i=0; i<21; i=i+1) {
    line(0,0, i*20,height);
    line(width/2,height/2, width,i*15+50);
  }            
}