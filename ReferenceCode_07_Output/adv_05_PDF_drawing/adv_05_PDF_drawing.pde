/* Zhang Liqun@SJTU IDM
*/

import processing.pdf.*;

int isRecording=0;
float distance;

void setup() {
  size(400,400);  
}

void draw() {
  line(mouseX,mouseY, pmouseX,pmouseY);
  
  // calculate distance between points
  distance=dist(mouseX,mouseY, pmouseX,pmouseY);
  if(distance>5) {
    ellipse(mouseX,mouseY, distance,distance);
  }
  
}

// use mousePressed to start / stop recording
void mousePressed() {
  if(isRecording==0) {
    // start recording to PDF
    beginRecord(PDF,"Drawing"+frameCount+".pdf");
    
    background(200);
    println("Begin recording.."); 
    isRecording=1;  
  }
  else {
    // end recording
    endRecord();
    println("Done.");    
    isRecording=0;
  }

}