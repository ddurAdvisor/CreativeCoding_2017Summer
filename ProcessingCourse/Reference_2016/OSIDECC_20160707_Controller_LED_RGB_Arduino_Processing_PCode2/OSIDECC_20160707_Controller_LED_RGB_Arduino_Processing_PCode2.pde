/*
 * Controller LED RGB
 * Liqun Zhang SMD Shanghai Jiao Tong Univ.
 */

import processing.serial.*;
PFont f1;
String[] name = {"::M.D.T. 固态照明开发项目 :: 上海数字化城市与交通研究所 :: 张立群 S.J.T.U."};
Serial port;

void setup() {
  size(600, 400);
  f1=createFont("TrueFrutigerLight",16,true);
  frame.setTitle(name[0]);
  background(255);
  smooth();
  //noStroke();
  
  // Background
  colorMode(HSB, 400);
  for (int i = 0; i < 400; i++) {
    for (int j = 0; j < 400; j++) {
      stroke(i, j, 400);
      point(i, j);
    }
  }
  
  textFont(f1,16);
  fill(0);
  textAlign(CENTER);
  text("Lamp Color Pallette",200,height*1/10);
  text("Current Lamp Color",500,height*8/10);
  // Select port
  println(Serial.list());
  port = new Serial(this, Serial.list()[0], 9600);
}

void draw() {
  // Only to enable the method mouseDragged
  stroke(175);
  fill(175);
  rect(485, 200, 30, 50);
  noFill();
  quad(470,100,530,100, 560,200,440,200);
}

void mouseClicked() {
  processColor();
}

void mouseDragged() {
  processColor();
}

void processColor() {
  color c = get(mouseX, mouseY);
  noStroke();
  fill(c);
  quad(470,100,530,100, 560,200,440,200);
  sendColorToSerial(c);
}

void sendColorToSerial(color colour) {
  // Get HEX
  String hexColor = hex(colour, 6);
  
  // Convert HEC to Number
  long numColor = unhex(hexColor);
  
  // Send color number to serial port
  port.write("^" + numColor + "$");
}