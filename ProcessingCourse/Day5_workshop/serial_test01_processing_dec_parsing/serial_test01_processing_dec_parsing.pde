//Processing Code
import processing.serial.*;
String message;
String temp;
Serial myPort;

void setup(){
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600); //Set Serial Port
}

void draw(){
  if(myPort.available()>0){
    temp = myPort.readString(); //temp for read bytes
    for(int i = 0; i < temp.length(); i++){
      //if meet the end mark
      if(temp.charAt(i) == '\n'){
        println(message);
        message = "";  //clean string
      }
      else
        message += temp.charAt(i);  //store byte
    }
  }
}
