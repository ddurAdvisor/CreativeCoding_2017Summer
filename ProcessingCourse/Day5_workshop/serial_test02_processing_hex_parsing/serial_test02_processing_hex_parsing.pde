/**
*copyright Zhangliqun creative conceptual prototyping 2015.06 SJTU
*
*
*本程序中使用了.read()而不是.readString()可以获取从串口发过来的数据。Returns a number between 0 and 255
*/
import processing.serial.*;

Serial myPort;

int brightness = 0;
PFont font;
String brightnessHEX;
String brightnessHEXClean;

void setup() {
  size(800, 600);
  smooth();
  println(Serial.list()); 
  String portName = Serial.list()[0];
  //Serial(PApplet parent, String portName, int baudRate, char parity, int dataBits, float stopBits)
  //this(parent, portName, baudRate, 'N', 8, 1);
  //myPort = new Serial(this, portName, 19200);
  //myPort = new Serial(this, portName, 19200, 'N', 8, 1); 
  //char parity: N - 
  //PARITY_ODD:O
  //PARITY_EVEN:E
  //PARITY_MARK:M
  //PARITY_SPACE:S
  //int dataBits: 8/16
  //float stopBits:
  //STOPBITS_1:STOPBITS_1
  //STOPBITS_1_5:1.5
  //STOPBITS_2:2
  myPort = new Serial(this, portName, 9600, 'E', 8, 1);
  myPort.bufferUntil('\n');
}

void draw() {
  background(0);

  while (myPort.available () > 0) {
    //String brightness = myPort.read();//read numbers from serial port
    brightnessHEX = myPort.readStringUntil('\n');

    if (brightnessHEX != null) {
      int l1 = brightnessHEX.length();
      brightnessHEXClean = trim(brightnessHEX);//Removes whitespace characters from the beginning and end of a String
      int l2 = brightnessHEX.length();
      println(brightnessHEXClean);
      brightness = unhex(brightnessHEXClean);
      println(brightness);
      println(l1+" : "+l2);
    }
  }

  fill(#5089E3);
  noStroke();
  rect(50, height-50, 80, -brightness);
  stroke(255);
  line(40, height-50, 140, height-50);
  textAlign(CENTER);
  fill(255);
  text(brightness, 90, height-50-brightness+10);
  textAlign(LEFT);
  text("Hex: "+brightnessHEXClean,50,50);
  text("Dec: "+brightness,50,70);
  drawCircle();

}

/*  
 void serialEvent (Serial port){
 brightness = float(port.readStringUntil('\n'));
 //inBuffer = myPort.readString();   
 //brightness = float(inBuffer);
 }
 */


void drawCircle() {
  translate(width/2+50, height/2);
  int rotAng = (int)map(brightness, 0, 255, 0, 360);
  for (int i = 0; i < rotAng; i++) {
    float ang = 2*PI/360;
    float angLine = 2*PI/360*rotAng;
    fill(#78F018);
    noStroke();
    ellipse(150*cos(ang*i), 150*sin(ang*i), 15, 15);
    stroke(255);
    line(0, 0, 180*cos(angLine), 180*sin(angLine));
    line(0, 0, 180, 0);
  }
}

