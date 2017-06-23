
//Define Pins
int potPin = 5;

void setup() {
  //Create Serial Object (9600 Baud)
  Serial.begin(19200);
}

void loop() {
  int val1 = analogRead(potPin);
  int val2 = map(analogRead(potPin), 0, 1023, 0, 255);
  int val3 = map(analogRead(potPin), 0, 1023, 0, 500);
  int val4 = map(analogRead(potPin), 0, 1023, 0, 100);
  int val5 = map(analogRead(potPin), 0, 1023, 0, 10);
  Serial.println(val1+" "val2+" " +val3+" "+val4+" "+val5, HEX);
  delay(200);
}

