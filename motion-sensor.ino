int lamp = 8; // relay pin
int inputPin = 4; // Motion sensor input pin 
int val = 0; // variable for reading the pin status

void setup() {

pinMode(lamp, OUTPUT); // lamp as output

pinMode(inputPin, INPUT); // sensor as input

Serial.begin(9600);

}

void loop(){

val = digitalRead(inputPin); // read input value

Serial.println(val);

if( val== 1) {

digitalWrite(lamp,HIGH); // turn ON the lamp
delay(10000);
} else {

digitalWrite(lamp,LOW); // turn OFF the lamp
delay(500);
}

}
