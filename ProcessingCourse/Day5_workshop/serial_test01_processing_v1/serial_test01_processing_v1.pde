
import processing.serial.*;
Serial myPort;
float brightness = 0;
PFont font;

void setup(){
  size(800,600);
  smooth();

  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');  
}

void draw(){
  background(0);
  fill(#5089E3);
  noStroke();
  rect(50,height-50,80,-brightness);
  stroke(255);
  line(40,height-50,140,height-50);
  textAlign(CENTER);
  fill(255);
  text(brightness,90,height-50-brightness+10);
  drawCircle();
}
  
void serialEvent (Serial port){
  brightness = float(port.readStringUntil('\n'));
}

void drawCircle(){
  translate(width/2+50, height/2);
  int rotAng = (int)map(brightness,0,255, 0, 360);
  for(int i = 0; i < rotAng; i++){
    float ang = 2*PI/360;
    float angLine = 2*PI/360*rotAng;
    fill(#78F018);
    noStroke();
    ellipse(150*cos(ang*i),150*sin(ang*i),15,15);
    stroke(255);
    line(0,0,180*cos(angLine),180*sin(angLine));
    line(0,0,180,0);
  }
}
