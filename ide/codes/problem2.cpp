#include <Arduino.h>
int Y,P,Q,R,S,T;
void setup()
{
	pinMode(10, OUTPUT);
	pinMode(2, INPUT);
	pinMode(3, INPUT);
	pinMode(4, INPUT);
	pinMode(5, INPUT);
	pinMode(6, INPUT);
}
void loop(){
 	P = digitalRead(2);
	Q = digitalRead(3);
	R = digitalRead(4);
	S = digitalRead(5);
	T = digitalRead(6);
	Y = (!T&&P&&Q)||(T&&R&&S);
	digitalWrite(10, Y);
	
}

