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
  //Serial.print(button1Val);
  int switchVal = digitalRead(18);
  //Serial.print(switchVal);
  int button2Val = digitalRead(4);
  //Serial.print(button2Val);
  Serial.printf("%d\t%d\t%d\t%d\t%d\t%d\n", xVal, yVal, zVal, button1Val, button2Val, switchVal);
  //Serial.print('\n');
  delay(100);
}
