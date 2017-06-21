/* Zhang Liqun@SJTU IDM
*/

import processing.pdf.*;

void setup() {
  size(400,400);  
}

void draw() {
  // start recording to PDF
  beginRecord(PDF,"Test.pdf");
  println("Begin recording..");    
  
  background(200);
  for(int i=0; i<21; i++) {
    for(int j=0; j<21; j++) {
      line(i*15+50,50, i*15+50,350);
      line(50,i*15+50, 350,i*15+50);
      ellipse(i*15+50,j*15+50, 10,10);
    }
  }
  
  // end recording
  endRecord();
  println("Done.");    
  
  noLoop();
}