/* Zhang Liqun@SJTU IDM
*/

// example of how to use a for loop.
// see comment below for more details

void setup() {
  size(400,400);  
}

void draw() {
  background(200);

  noFill();
  stroke(0);
  
  // draw grid of lines
  for(float i=0; i<21; i++) {
    // draw vertical lines
    line(i*15+50,50, i*15+50,350);

    // draw horizontal lines
    line(50,i*15+50, 350,i*15+50);
  }            
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