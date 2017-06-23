
//Processing Code
import processing.serial.*;
Serial myPort;

void setup(){
  println(Serial.list()); 
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 19200);//in fact, any rate is ok...
  myPort.bufferUntil('\n'); //buffer until meet '\n', then call the event listener
}

void draw(){
}

//listen to the event. when buffer filled, run this method
void serialEvent(Serial p) {
  String inString = p.readString();
  //int inString = p.read();
  print(inString);
}
//then the buffer will reveive all the bytes
