import processing.core.*; 
import processing.xml.*; 

import processing.serial.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class Controller_LED_RGB_Arduino_Processing_PCode2 extends PApplet {

/*
 * Controller LED RGB
 * Liqun Zhang SMD Shanghai Jiao Tong Univ.
 */


PFont f1;
String[] name = {"::M.D.T. \u56fa\u6001\u7167\u660e\u5f00\u53d1\u9879\u76ee :: \u4e0a\u6d77\u6570\u5b57\u5316\u57ce\u5e02\u4e0e\u4ea4\u901a\u7814\u7a76\u6240 :: \u5f20\u7acb\u7fa4 S.J.T.U."};
Serial port;

public void setup() {
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
  port = new Serial(this, Serial.list()[1], 9600);
}

public void draw() {
  // Only to enable the method mouseDragged
  stroke(175);
  fill(175);
  rect(485, 200, 30, 50);
  noFill();
  quad(470,100,530,100, 560,200,440,200);
}

public void mouseClicked() {
  processColor();
}

public void mouseDragged() {
  processColor();
}

public void processColor() {
  int c = get(mouseX, mouseY);
  noStroke();
  fill(c);
  quad(470,100,530,100, 560,200,440,200);
  sendColorToSerial(c);
}

public void sendColorToSerial(int colour) {
  // Get HEX
  String hexColor = hex(colour, 6);
  
  // Convert HEC to Number
  long numColor = unhex(hexColor);
  
  // Send color number to serial port
  port.write("^" + numColor + "$");
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#F0F0F0", "Controller_LED_RGB_Arduino_Processing_PCode2" });
  }
}
