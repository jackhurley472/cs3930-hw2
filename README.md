Name: Jack Hurley (jth2165)

For hardware, a raspberry pi 4, an ESP32 and a monitor were used.
Also, used were two push buttons, a switch and a joystick.
The push buttons both have one pin connected to ground and
the other connected to an output port of the ESP32.
In my arduino script, outputs 25 and 4 were used. 
The switch has one outside pin connected to 5V and the other connected to ground. 
The middle pin is then connected to an output pin of the ESP32.
In my case, pin 18. The joystick has 5 pins connecting to 
ground, 5V and 3 output pins of the ESP32. 
I used pins 13, 12, 14 to correspond to x, y, z values respectively even though only the x value is used. 
You can enclose all this in a small box to make it more like a controller. 
Then plug in the ESP32 into the usb port of the raspberry pi and
the arduino script will print the output values to the serial port,
so make sure the correct port is selected. The one I used was "/dev/ttyUSB0".
Also, change the upload speed to "115200" and select for board: "ESP32 Wrover Module" (may need to be installed).
Then click upload. Next, in the processing script, make sure you have the correct port for "Serial.list()[x]".
For mine x was 4 but may be different. Then connect your raspberry pi to a monitor and click play, and you're good to go.

video link: https://youtu.be/Vv1dC9wqwcw
