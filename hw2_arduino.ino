 
/**********************************************************************
  Filename    : Joystick
  Description : Read data from joystick.
  Auther      : www.freenove.com
  Modification: 2020/07/11
**********************************************************************/
int xyzPins[] = {13, 12, 14};   //x,y,z pins
void setup() {
  Serial.begin(9600);
  pinMode(xyzPins[2], INPUT_PULLUP);  //z axis is a button.
  pinMode(25, INPUT_PULLUP);
  pinMode(18, INPUT_PULLUP);
  pinMode(4, INPUT_PULLUP);
}

void loop() {
  int xVal = analogRead(xyzPins[0]);
  int yVal = analogRead(xyzPins[1]);
  int zVal = digitalRead(xyzPins[2]);
  int button1Val = digitalRead(25);
  int switchVal = digitalRead(18);
  int button2Val = digitalRead(4);
  Serial.print(xVal);
  Serial.print("\t");
  Serial.print(yVal);
  Serial.print("\t");
  Serial.print(zVal);
  Serial.print("\t");
  Serial.print(button1Val);
  Serial.print("\t");
  Serial.print(button2Val);
  Serial.print("\t");
  Serial.print(switchVal);
  Serial.print("\n");
  delay(100);
}
