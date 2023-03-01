#include<Arduino.h>
int led=13;
void ledglow(int p,int q,int r,int s,int t)
{
    if(t==0)
    {
        int y=p&&q;
        if(y==1)
        {
            digitalWrite(led, HIGH);
        }
        else
        {
            digitalWrite(led, LOW);
        }
    }
    else
    {
        int y=r&&s;
        if(y==1)
        {
            digitalWrite(led, HIGH);
        }
        else
        {
            digitalWrite(led, LOW);
        }
    }
}
void setup()
{
    pinMode(13, OUTPUT);
}
void loop()
{
    ledglow(1,1,1,1,1);
}


