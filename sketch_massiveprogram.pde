import processing.serial.*;
Serial myPort;

int x=0;

PImage imgA;


void setup(){
  size(500,500);
  myPort=new Serial(this,"COM3",9600);
  imgA=loadImage("ziki2.png");
}

void draw(){
  background(0);
  image(imgA,x,250);
}

void serialEvent(Serial p){
  if(myPort.available()>0){
    x=myPort.read();
    myPort.write(65);
  }
}

void mousePressed(){
  myPort.clear();
  myPort.write(65);
}