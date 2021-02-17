/**
 * Simple Read
 * 
 * Read data from the serial port and change the color of a rectangle
 * when a switch connected to a Wiring or Arduino board is pressed and released.
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;

Serial myPort;  // Create object from Serial class
String xVal;      // Data received from the serial port
String yVal;
String zVal;
String button1Val;
String button2Val;
String switchVal;
String oldSwitchVal;
int count;
int counter1;
int counter2;
int counter3;
int counter4;
int counter5;
int counter6;
float x1;
float x2;
float x3;
float bullet1;
float bullet2;
float bullet3;
float bullet4;
float bullet5;
float bullet6;
float bulletx1;
float bulletx2;
float bulletx3;
float bulletx4;
float bulletx5;
float bulletx6;
int shot1;
int shot2;
int shot3;
int shot4;
int shot5;
int shot6;
float ball1;
float ballx1;
float ball2;
float ballx2;
float ball3;
float ballx3;
float ball4;
float ballx4;
float ball5;
float ballx5;
float ball6;
float ballx6;
float ball7;
float ballx7;
float ball8;
float ballx8;
float ball9;
float ballx9;
float ball10;
float ballx10;
int hit1;
int hit2;
int hit3;
int hit4;
int hit5;
int hit6;
int hit7;
int hit8;
int hit9;
int hit10;
int score;
int fail;
float speed;

void setup() 
{
  size(960, 540);
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  //fullScreen();
  String portName = Serial.list()[4];
  System.out.println(portName);
  myPort = new Serial(this, portName, 9600);
  count = 0;
  oldSwitchVal = "0";
  
  x1 = (width/2)-50;
  x2 = (width/4)-50;
  x3 = (3*width/4)-50;
  
  shot1 = 0;
  shot2 = 0;
  shot3 = 0;
  shot4 = 0;
  shot5 = 0;
  shot6 = 0;
  bullet1 = height-75;
  bullet2 = height-75;
  bullet3 = height-75;
  bullet4 = height-75;
  bullet5 = height-75;
  bullet6 = height-75;
  bulletx1 = x1;
  bulletx2 = x1;
  bulletx3 = x2;
  bulletx4 = x2;
  bulletx5 = x3;
  bulletx6 = x3;
  
  ball1 = 0;
  ballx1 = random(25, width-25);
  ball2 = 0;
  ballx2 = random(25, width-25);
  ball3 = 0;
  ballx3 = random(25, width-25);
  ball4 = 0;
  ballx4 = random(25, width-25);
  ball5 = 0;
  ballx5 = random(25, width-25);
  ball6 = 0;
  ballx6 = random(25, width-25);
  ball7 = 0;
  ballx7 = random(25, width-25);
  ball8 = 0;
  ballx8 = random(25, width-25);
  ball9 = 0;
  ballx9 = random(25, width-25);
  ball10 = 0;
  ballx10 = random(25, width-25);
  hit1 = 0;
  hit2 = 0;
  hit3 = 0;
  hit4 = 0;
  hit5 = 0;
  hit6 = 0;
  hit7 = 0;
  hit8 = 0;
  hit9 = 0;
  hit10 = 0;
  score = 0;
  speed = 1;
  
}

void draw()
{
  if ( myPort.available() > 0) {  // If data is available,
    xVal = myPort.readStringUntil('\t'); // read it and store it in val
    yVal = myPort.readStringUntil('\t');
    zVal = myPort.readStringUntil('\t');
    button1Val = myPort.readStringUntil('\t');
    button2Val = myPort.readStringUntil('\t');
    switchVal = myPort.readStringUntil('\n');
  }
  xVal = trim(xVal);
  yVal = trim(yVal);
  zVal = trim(zVal);
  button1Val = trim(button1Val);
  button2Val = trim(button2Val);
  switchVal = trim(switchVal);
  System.out.print(xVal);
  System.out.print(" ");
  System.out.print(yVal);
  System.out.print(" ");
  System.out.print(zVal);
  System.out.print(" ");
  System.out.print(button1Val);
  System.out.print(" ");
  System.out.print(button2Val);
  System.out.print(" ");
  System.out.print(switchVal);
  
  if (switchVal != null && switchVal.equals(oldSwitchVal) == false) {
    if (count < 2) {
      count = count + 1;
    } else {
      count = 0;
    }
    oldSwitchVal = switchVal;
  }
  
  System.out.print(" ");
  System.out.print(count);
  System.out.print("\n");
  
  background(255);
  
  if (xVal != null && count == 0) {
    
    if (xVal.equals("0") && x1 > (x2+100)) {
      x1 = x1 - 5;
    } else if (xVal.equals("4095") && x1 < (x3-100)) {
      x1 = x1 + 5;
    }
    
    if (button1Val != null && button1Val.equals("0")) {
      shot1 = 1;
    }
    
    if (button2Val != null && button2Val.equals("0")) {
      shot2 = 1;
    }    
    
  }
  
  if (xVal != null && count == 1) {
    if (xVal.equals("0") && x3 > (x1+100)) {
      x3 = x3 - 5;
    } else if (xVal.equals("4095") && x3 < (width-100)) {
      x3 = x3 + 5;
    }
    
    if (button1Val != null && button1Val.equals("0")) {
      shot5 = 1;
    }
    
    if (button2Val != null && button2Val.equals("0")) {
      shot6 = 1;
    }
  }
  
  if (xVal != null && count == 2) {
    if (xVal.equals("0") && x2 > 0) {
      x2 = x2 - 5;
    } else if (xVal.equals("4095") && x2 < (x1-100)) {
      x2 = x2 + 5;
    }
    
    if (button1Val != null && button1Val.equals("0")) {
      shot3 = 1;
    }
    
    if (button2Val != null && button2Val.equals("0")) {
      shot4 = 1;
    }
  }
  
  fill(0, 100, 0);
  rect(x1, height-25, 100, 25);
  rect(x2, height-25, 100, 25);
  rect(x3, height-25, 100, 25);
  rect(x1+20, height-50, 25, 50);
  rect(x1+55, height-50, 25, 50);
  rect(x2+20, height-50, 25, 50);
  rect(x2+55, height-50, 25, 50);
  rect(x3+20, height-50, 25, 50);
  rect(x3+55, height-50, 25, 50);
  
  fill(100);
  if (shot1 == 1 && fail == 0) {
    if (counter1 == 0) {
      bulletx1 = x1;
      counter1 = 1;
    }
    rect(bulletx1+20, bullet1, 25, 25, 30, 30, 0, 0);
    bullet1 = bullet1 - 5;
  }
  
  if (bullet1 < 0 || shot1 == 0) {
    shot1 = 0;
    bullet1 = height - 75;
    rect(x1+20, bullet1, 25, 25, 30, 30, 0, 0);
    counter1 = 0;
  }
  
  if (shot2 == 1 && fail == 0) {
    if (counter2 == 0) {
      bulletx2 = x1;
      counter2 = 1;
    }
    rect(bulletx2+55, bullet2, 25, 25, 30, 30, 0, 0);
    bullet2 = bullet2 - 5;
  }
  
  if (bullet2 < 0 || shot2 == 0) {
    shot2 = 0;
    bullet2 = height - 75;
    rect(x1+55, bullet2, 25, 25, 30, 30, 0, 0);
    counter2 = 0;
  }
   
  if (shot3 == 1 && fail == 0) {
    if (counter3 == 0) {
      bulletx3 = x2;
      counter3 = 1;
    }
    rect(bulletx3+20, bullet3, 25, 25, 30, 30, 0, 0);
    bullet3 = bullet3 - 5;
  }
  
  if (bullet3 < 0 || shot3 == 0) {
    shot3 = 0;
    bullet3 = height - 75;
    rect(x2+20, bullet3, 25, 25, 30, 30, 0, 0);
    counter3 = 0;
  }
  
  if (shot4 == 1 && fail == 0) {
    if (counter4 == 0) {
      bulletx4 = x2;
      counter4 = 1;
    }
    rect(bulletx4+55, bullet4, 25, 25, 30, 30, 0, 0);
    bullet4 = bullet4 - 5;
  }
  
  if (bullet4 < 0 || shot4 == 0) {
    shot4 = 0;
    bullet4 = height - 75;
    rect(x2+55, bullet4, 25, 25, 30, 30, 0, 0);
    counter4 = 0;
  }
    
  if (shot5 == 1 && fail == 0) {
    if (counter5 == 0) {
      bulletx5 = x3;
      counter5 = 1;
    }
    rect(bulletx5+20, bullet5, 25, 25, 30, 30, 0, 0);
    bullet5 = bullet5 - 5;
  }
  
  if (bullet5 < 0 || shot5 == 0) {
    shot5 = 0;
    bullet5 = height - 75;
    rect(x3+20, bullet5, 25, 25, 30, 30, 0, 0);
    counter5 = 0;
  }
  
  if (shot6 == 1 && fail == 0) {
    if (counter6 == 0) {
      bulletx6 = x3;
      counter6 = 1;
    }
    rect(bulletx6+55, bullet6, 25, 25, 30, 30, 0, 0);
    bullet6 = bullet6 - 5;
  }
  
  if (bullet6 < 0 || shot6 == 0) {
    shot6 = 0;
    bullet6 = height - 75;
    rect(x3+55, bullet6, 25, 25, 30, 30, 0, 0);
    counter6 = 0;
  }
  
  fill(0);
  if (hit1 == 0) {
    ellipse(ballx1, ball1, 25, 25);
    ball1 = ball1+speed;
  } else {
    hit1 = 0;
    ballx1 = random(25, width-25);
    ball1 = 0;
    score = score+1;
  }
  
  if ((bullet1 <= ball1+12.5 && bullet1 >= ball1-12.5) && (bulletx1+32.5 >= ballx1-25 && bulletx1+32.5 <= ballx1+25)) {
    hit1 = 1;
    shot1 = 0;
  }
  if ((bullet2 <= ball1+12.5 && bullet2 >= ball1-12.5) && (bulletx2+67.5 >= ballx1-25 && bulletx2+67.5 <= ballx1+25)) {
    hit1 = 1;
    shot2 = 0;
  } 
  if ((bullet3 <= ball1+12.5 && bullet3 >= ball1-12.5) && (bulletx3+32.5 >= ballx1-25 && bulletx3+32.5 <= ballx1+25)) {
    hit1 = 1;
    shot3 = 0;
  } 
  if ((bullet4 <= ball1+12.5 && bullet4 >= ball1-12.5) && (bulletx4+67.5 >= ballx1-25 && bulletx4+67.5 <= ballx1+25)) {
    hit1 = 1;
    shot4 = 0;
  }
  if ((bullet5 <= ball1+12.5 && bullet5 >= ball1-12.5) && (bulletx5+32.5 >= ballx1-25 && bulletx5+32.5 <= ballx1+25)) {
    hit1 = 1;
    shot5 = 0;
  }
  if ((bullet6 <= ball1+12.5 && bullet6 >= ball1-12.5) && (bulletx6+67.5 >= ballx1-25 && bulletx6+67.5 <= ballx1+25)) {
    hit1 = 1;
    shot6 = 0;    
  }
  
  if (score >= 3) {
    if (hit2 == 0) {
      ellipse(ballx2, ball2, 25, 25);
      ball2 = ball2+speed;
    } else {
      hit2 = 0;
      ballx2 = random(25, width-25);
      ball2 = 0;
      score = score+1;
    }
  
    if ((bullet1 <= ball2+12.5 && bullet1 >= ball2-12.5) && (bulletx1+32.5 >= ballx2-25 && bulletx1+32.5 <= ballx2+25)) {
      hit2 = 1;
      shot1 = 0;
    }
    if ((bullet2 <= ball2+12.5 && bullet2 >= ball2-12.5) && (bulletx2+67.5 >= ballx2-25 && bulletx2+67.5 <= ballx2+25)) {
      hit2 = 1;
      shot2 = 0;
    } 
    if ((bullet3 <= ball2+12.5 && bullet3 >= ball2-12.5) && (bulletx3+32.5 >= ballx2-25 && bulletx3+32.5 <= ballx2+25)) {
      hit2 = 1;
      shot3 = 0;
    } 
    if ((bullet4 <= ball2+12.5 && bullet4 >= ball2-12.5) && (bulletx4+67.5 >= ballx2-25 && bulletx4+67.5 <= ballx2+25)) {
      hit2 = 1;
      shot4 = 0;
    }
    if ((bullet5 <= ball2+12.5 && bullet5 >= ball2-12.5) && (bulletx5+32.5 >= ballx2-25 && bulletx5+32.5 <= ballx2+25)) {
      hit2 = 1;
      shot5 = 0;
    }
    if ((bullet6 <= ball2+12.5 && bullet6 >= ball2-12.5) && (bulletx6+67.5 >= ballx2-25 && bulletx6+67.5 <= ballx2+25)) {
      hit2 = 1;
      shot6 = 0;    
    }
  }
  
  if (score >= 6) {
    if (hit3 == 0) {
      ellipse(ballx3, ball3, 25, 25);
      ball3 = ball3+speed;
    } else {
      hit3 = 0;
      ball3 = random(25, width-25);
      ball3 = 0;
      score = score+1;
    }
  
    if ((bullet1 <= ball3+12.5 && bullet1 >= ball3-12.5) && (bulletx1+32.5 >= ballx3-25 && bulletx1+32.5 <= ballx3+25)) {
      hit3 = 1;
      shot1 = 0;
    }
    if ((bullet2 <= ball3+12.5 && bullet2 >= ball3-12.5) && (bulletx2+67.5 >= ballx3-25 && bulletx2+67.5 <= ballx3+25)) {
      hit3 = 1;
      shot2 = 0;
    } 
    if ((bullet3 <= ball3+12.5 && bullet3 >= ball3-12.5) && (bulletx3+32.5 >= ballx3-25 && bulletx3+32.5 <= ballx3+25)) {
      hit3 = 1;
      shot3 = 0;
    } 
    if ((bullet4 <= ball3+12.5 && bullet4 >= ball3-12.5) && (bulletx4+67.5 >= ballx3-25 && bulletx4+67.5 <= ballx3+25)) {
      hit3 = 1;
      shot4 = 0;
    }
    if ((bullet5 <= ball3+12.5 && bullet5 >= ball3-12.5) && (bulletx5+32.5 >= ballx3-25 && bulletx5+32.5 <= ballx3+25)) {
      hit3 = 1;
      shot5 = 0;
    }
    if ((bullet6 <= ball3+12.5 && bullet6 >= ball3-12.5) && (bulletx6+67.5 >= ballx3-25 && bulletx6+67.5 <= ballx3+25)) {
      hit3 = 1;
      shot6 = 0;    
    }
  }
  
  if (score >= 9) {
    if (hit4 == 0) {
      ellipse(ballx4, ball4, 25, 25);
      ball4 = ball4+speed;
    } else {
      hit4 = 0;
      ballx4 = random(25, width-25);
      ball4 = 0;
      score = score+1;
    }
  
    if ((bullet1 <= ball4+12.5 && bullet1 >= ball4-12.5) && (bulletx1+32.5 >= ballx4-25 && bulletx1+32.5 <= ballx4+25)) {
      hit4 = 1;
      shot1 = 0;
    }
    if ((bullet2 <= ball4+12.5 && bullet2 >= ball4-12.5) && (bulletx2+67.5 >= ballx4-25 && bulletx2+67.5 <= ballx4+25)) {
      hit4 = 1;
      shot2 = 0;
    } 
    if ((bullet3 <= ball4+12.5 && bullet3 >= ball4-12.5) && (bulletx3+32.5 >= ballx4-25 && bulletx3+32.5 <= ballx4+25)) {
      hit4 = 1;
      shot3 = 0;
    } 
    if ((bullet4 <= ball4+12.5 && bullet4 >= ball4-12.5) && (bulletx4+67.5 >= ballx4-25 && bulletx4+67.5 <= ballx4+25)) {
      hit4 = 1;
      shot4 = 0;
    }
    if ((bullet5 <= ball4+12.5 && bullet5 >= ball4-12.5) && (bulletx5+32.5 >= ballx4-25 && bulletx5+32.5 <= ballx4+25)) {
      hit4 = 1;
      shot5 = 0;
    }
    if ((bullet6 <= ball4+12.5 && bullet6 >= ball4-12.5) && (bulletx6+67.5 >= ballx4-25 && bulletx6+67.5 <= ballx4+25)) {
      hit4 = 1;
      shot6 = 0;    
    }
  }

  if (score >= 12) {
    if (hit5 == 0) {
      ellipse(ballx5, ball5, 25, 25);
      ball5 = ball5+speed;
    } else {
      hit5 = 0;
      ballx5 = random(25, width-25);
      ball5 = 0;
      score = score+1;
    }
  
    if ((bullet1 <= ball2+12.5 && bullet1 >= ball5-12.5) && (bulletx1+32.5 >= ballx5-25 && bulletx1+32.5 <= ballx5+25)) {
      hit5 = 1;
      shot1 = 0;
    }
    if ((bullet2 <= ball5+12.5 && bullet2 >= ball5-12.5) && (bulletx2+67.5 >= ballx5-25 && bulletx2+67.5 <= ballx5+25)) {
      hit5 = 1;
      shot2 = 0;
    } 
    if ((bullet3 <= ball5+12.5 && bullet3 >= ball5-12.5) && (bulletx3+32.5 >= ballx5-25 && bulletx3+32.5 <= ballx5+25)) {
      hit5 = 1;
      shot3 = 0;
    } 
    if ((bullet4 <= ball5+12.5 && bullet4 >= ball5-12.5) && (bulletx4+67.5 >= ballx5-25 && bulletx4+67.5 <= ballx5+25)) {
      hit5 = 1;
      shot4 = 0;
    }
    if ((bullet5 <= ball5+12.5 && bullet5 >= ball5-12.5) && (bulletx5+32.5 >= ballx5-25 && bulletx5+32.5 <= ballx5+25)) {
      hit5 = 1;
      shot5 = 0;
    }
    if ((bullet6 <= ball5+12.5 && bullet6 >= ball5-12.5) && (bulletx6+67.5 >= ballx5-25 && bulletx6+67.5 <= ballx5+25)) {
      hit5 = 1;
      shot6 = 0;    
    }
  }
  
  if (score >= 15) {
    if (hit6 == 0) {
      ellipse(ballx6, ball6, 25, 25);
      ball6 = ball6+speed;
    } else {
      hit6 = 0;
      ballx6 = random(25, width-25);
      ball6 = 0;
      score = score+1;
    }
  
    if ((bullet1 <= ball6+12.5 && bullet1 >= ball6-12.5) && (bulletx1+32.5 >= ballx6-25 && bulletx1+32.5 <= ballx6+25)) {
      hit6 = 1;
      shot1 = 0;
    }
    if ((bullet2 <= ball6+12.5 && bullet2 >= ball6-12.5) && (bulletx1+67.5 >= ballx6-25 && bulletx2+67.5 <= ballx6+25)) {
      hit6 = 1;
      shot2 = 0;
    } 
    if ((bullet3 <= ball6+12.5 && bullet3 >= ball6-12.5) && (bulletx3+32.5 >= ballx6-25 && bulletx3+32.5 <= ballx6+25)) {
      hit6 = 1;
      shot3 = 0;
    } 
    if ((bullet4 <= ball6+12.5 && bullet4 >= ball6-12.5) && (bulletx4+67.5 >= ballx6-25 && bulletx4+67.5 <= ballx6+25)) {
      hit6 = 1;
      shot4 = 0;
    }
    if ((bullet5 <= ball6+12.5 && bullet5 >= ball6-12.5) && (bulletx5+32.5 >= ballx6-25 && bulletx5+32.5 <= ballx6+25)) {
      hit6 = 1;
      shot5 = 0;
    }
    if ((bullet6 <= ball6+12.5 && bullet6 >= ball6-12.5) && (bulletx6+67.5 >= ballx6-25 && bulletx6+67.5 <= ballx6+25)) {
      hit6 = 1;
      shot6 = 0;    
    }
  }
  
  if (score >= 18) {
    if (hit7 == 0) {
      ellipse(ballx7, ball7, 25, 25);
      ball7 = ball7+speed;
    } else {
      hit7 = 0;
      ballx7 = random(25, width-25);
      ball7 = 0;
      score = score+1;
    }
  
    if ((bullet1 <= ball7+12.5 && bullet1 >= ball7-12.5) && (bulletx1+32.5 >= ballx7-25 && bulletx1+32.5 <= ballx7+25)) {
      hit7 = 1;
      shot1 = 0;
    }
    if ((bullet2 <= ball7+12.5 && bullet2 >= ball7-12.5) && (bulletx1+67.5 >= ballx7-25 && bulletx2+67.5 <= ballx7+25)) {
      hit7 = 1;
      shot2 = 0;
    } 
    if ((bullet3 <= ball7+12.5 && bullet3 >= ball7-12.5) && (bulletx3+32.5 >= ballx7-25 && bulletx3+32.5 <= ballx7+25)) {
      hit7 = 1;
      shot3 = 0;
    } 
    if ((bullet4 <= ball7+12.5 && bullet4 >= ball7-12.5) && (bulletx4+67.5 >= ballx7-25 && bulletx4+67.5 <= ballx7+25)) {
      hit7 = 1;
      shot4 = 0;
    }
    if ((bullet5 <= ball7+12.5 && bullet5 >= ball7-12.5) && (bulletx5+32.5 >= ballx7-25 && bulletx5+32.5 <= ballx7+25)) {
      hit7 = 1;
      shot5 = 0;
    }
    if ((bullet6 <= ball7+12.5 && bullet6 >= ball7-12.5) && (bulletx6+67.5 >= ballx7-25 && bulletx6+67.5 <= ballx7+25)) {
      hit7 = 1;
      shot6 = 0;    
    }
  }
  
  if (score >= 21) {
    if (hit8 == 0) {
      ellipse(ballx8, ball8, 25, 25);
      ball8 = ball8+speed;
    } else {
      hit8 = 0;
      ballx8 = random(25, width-25);
      ball8 = 0;
      score = score+1;
    }
  
    if ((bullet1 <= ball8+12.5 && bullet1 >= ball8-12.5) && (bulletx1+32.5 >= ballx8-25 && bulletx1+32.5 <= ballx8+25)) {
      hit8 = 1;
      shot1 = 0;
    }
    if ((bullet2 <= ball8+12.5 && bullet2 >= ball8-12.5) && (bulletx2+67.5 >= ballx8-25 && bulletx2+67.5 <= ballx8+25)) {
      hit8 = 1;
      shot2 = 0;
    } 
    if ((bullet3 <= ball8+12.5 && bullet3 >= ball8-12.5) && (bulletx3+32.5 >= ballx8-25 && bulletx3+32.5 <= ballx8+25)) {
      hit8 = 1;
      shot3 = 0;
    } 
    if ((bullet4 <= ball8+12.5 && bullet4 >= ball8-12.5) && (bulletx4+67.5 >= ballx8-25 && bulletx4+67.5 <= ballx8+25)) {
      hit8 = 1;
      shot4 = 0;
    }
    if ((bullet5 <= ball8+12.5 && bullet5 >= ball8-12.5) && (bulletx5+32.5 >= ballx8-25 && bulletx5+32.5 <= ballx8+25)) {
      hit8 = 1;
      shot5 = 0;
    }
    if ((bullet6 <= ball8+12.5 && bullet6 >= ball8-12.5) && (bulletx6+67.5 >= ballx8-25 && bulletx6+67.5 <= ballx8+25)) {
      hit8 = 1;
      shot6 = 0;    
    }
  }
  
  if (score >= 24) {
    if (hit9 == 0) {
      ellipse(ballx9, ball9, 25, 25);
      ball9 = ball9+speed;
    } else {
      hit9 = 0;
      ballx9 = random(25, width-25);
      ball9 = 0;
      score = score+1;
    }
  
    if ((bullet1 <= ball9+12.5 && bullet1 >= ball9-12.5) && (bulletx1+32.5 >= ballx9-25 && bulletx1+32.5 <= ballx9+25)) {
      hit9 = 1;
      shot1 = 0;
    }
    if ((bullet2 <= ball9+12.5 && bullet2 >= ball9-12.5) && (bulletx1+67.5 >= ballx9-25 && bulletx2+67.5 <= ballx9+25)) {
      hit9 = 1;
      shot2 = 0;
    } 
    if ((bullet3 <= ball9+12.5 && bullet3 >= ball9-12.5) && (bulletx3+32.5 >= ballx9-25 && bulletx3+32.5 <= ballx9+25)) {
      hit9 = 1;
      shot3 = 0;
    } 
    if ((bullet4 <= ball9+12.5 && bullet4 >= ball9-12.5) && (bulletx4+67.5 >= ballx9-25 && bulletx4+67.5 <= ballx9+25)) {
      hit9 = 1;
      shot4 = 0;
    }
    if ((bullet5 <= ball9+12.5 && bullet5 >= ball9-12.5) && (bulletx5+32.5 >= ballx9-25 && bulletx5+32.5 <= ballx9+25)) {
      hit9 = 1;
      shot5 = 0;
    }
    if ((bullet6 <= ball9+12.5 && bullet6 >= ball9-12.5) && (bulletx6+67.5 >= ballx9-25 && bulletx6+67.5 <= ballx9+25)) {
      hit9 = 1;
      shot6 = 0;    
    }
  }
  
  if (score >= 27) {
    if (hit10 == 0) {
      ellipse(ballx10, ball10, 25, 25);
      ball10 = ball10+speed;
    } else {
      hit10 = 0;
      ballx10 = random(25, width-25);
      ball10 = 0;
      score = score+1;
    }
  
    if ((bullet1 <= ball10+12.5 && bullet1 >= ball10-12.5) && (bulletx1+32.5 >= ballx10-25 && bulletx1+32.5 <= ballx10+25)) {
      hit10 = 1;
      shot1 = 0;
    }
    if ((bullet2 <= ball10+12.5 && bullet2 >= ball10-12.5) && (bulletx1+67.5 >= ballx10-25 && bulletx2+67.5 <= ballx10+25)) {
      hit10 = 1;
      shot2 = 0;
    } 
    if ((bullet3 <= ball10+12.5 && bullet3 >= ball10-12.5) && (bulletx3+32.5 >= ballx10-25 && bulletx3+32.5 <= ballx10+25)) {
      hit10 = 1;
      shot3 = 0;
    } 
    if ((bullet4 <= ball10+12.5 && bullet4 >= ball10-12.5) && (bulletx4+67.5 >= ballx10-25 && bulletx4+67.5 <= ballx10+25)) {
      hit10 = 1;
      shot4 = 0;
    }
    if ((bullet5 <= ball10+12.5 && bullet5 >= ball10-12.5) && (bulletx5+32.5 >= ballx10-25 && bulletx5+32.5 <= ballx10+25)) {
      hit10 = 1;
      shot5 = 0;
    }
    if ((bullet6 <= ball10+12.5 && bullet6 >= ball10-12.5) && (bulletx6+67.5 >= ballx10-25 && bulletx6+67.5 <= ballx10+25)) {
      hit10 = 1;
      shot6 = 0;    
    }
  }
  
  textSize(25);
  text("score: " + score, 15, 30);
  
  if (ball1 > height) {
    fail = 1;
  }
  if (ball2 > height) {
    fail = 1;
  }
  if (ball3 > height) {
    fail = 1;
  }
  if (ball4 > height) {
    fail = 1;
  }
  if (ball5 > height) {
    fail = 1;
  }
  if (ball6 > height) {
    fail = 1;
  }
  if (ball7 > height) {
    fail = 1;
  }
  if (ball8 > height) {
    fail = 1;
  }
  if (ball9 > height) {
    fail = 1;
  }
  if (ball10 > height) {
    fail = 1;
  }
  
  if (fail == 1) {
    fill(255, 0, 0);
    textSize(50);
    text("GAME OVER", 325, height/2);
    speed = 0;
  }
  
  
}
