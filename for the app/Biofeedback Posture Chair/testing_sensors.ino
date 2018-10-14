int ratios[] = {1,1,1};
double range1[] = {300.0, 650.0};
double range2[] = {150.0,400.0};


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  delay(50);
  double upperRight = analogRead(5);
  double upperLeft = analogRead(4);
  double midRight = analogRead(3);
  double midLeft = analogRead(2);
  double lowerRight = analogRead(1);
  double lowerLeft = analogRead(0);

  Serial.println(String(upperLeft) + "," + String(upperRight) + "," + String(midLeft) + "," + String(midRight) + "," + String(lowerLeft) + "," + String(lowerRight) + ",");
}


