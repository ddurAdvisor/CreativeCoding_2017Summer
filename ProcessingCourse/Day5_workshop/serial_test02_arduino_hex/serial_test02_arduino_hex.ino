//Arduino Code
int potpin = 5; //把电位计连在Arduino模拟端口5

void setup(){
  Serial.begin(19200);//rate
}
void loop(){
  int sensorValue = analogRead(potpin);
  int data= sensorValue/4;
  Serial.println(data,HEX); //send data, end up with '\n'
  delay(1000);
}
