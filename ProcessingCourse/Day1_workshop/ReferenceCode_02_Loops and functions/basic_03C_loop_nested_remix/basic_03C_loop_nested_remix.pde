/* Zhang Liqun@SJTU IDM
*/

// example of how to use a for loop.
// see comment below for more details

float rad,radMod,radMax,gray;

void setup() {
  size(400,400);  
  smooth();
}

void draw() {
  background(200);

  noFill();
  stroke(0);
  radMod=random(0.5,5);
  radMax=random(10,30);
  
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
//      line(i*15+50,j*15+50, (20-i)*15+50,(20-j)*15+50);
      line(i*15+50,j*15+50, 0,0);
      line(i*15+50,j*15+50, width,height);
    }
  }

  for(float i=0; i<21; i++) {
    for(float j=0; j<21; j++) {
      rad=dist(i,j, 10,10);
      rad=(rad*radMod)%radMax+5;
      ellipse(i*15+50,j*15+50, rad,rad);
    }
  }

  noLoop();
}

void mousePressed() {
  loop();
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