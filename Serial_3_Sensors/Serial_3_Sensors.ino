void setup() {
  Serial.begin(9600);
}

void loop() {
  delay(50);
  //int val = analogRead(0) * 1000000 + analogRead(1) * 1000 + analogRead(2);

 Serial.println(String(analogRead(0)) + "," + String(analogRead(1)) + "," + String(analogRead(2)) + ",");


  
}
