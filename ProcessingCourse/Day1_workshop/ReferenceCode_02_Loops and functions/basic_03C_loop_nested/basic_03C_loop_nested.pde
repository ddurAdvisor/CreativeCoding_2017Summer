/* Zhang Liqun@SJTU IDM
*/

// example of how to use a for loop.
// see comment below for more details

float rad,gray;

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
  
  // draw circles at each point on the grid
  // using one for loop nested inside another.
  
  fill(255);
  
  for(float i=0; i<21; i++) {
    for(float j=0; j<21; j++) {
      rad=(i+j)*0.5+6;
      
      ellipse(i*15+50,j*15+50, rad,rad);
    }
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