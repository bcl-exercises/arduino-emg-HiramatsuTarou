import processing.serial.*;
Serial myPort;

int x=0;
int y=0;

int H=255;


void setup(){
  size(500,500);
  myPort=new Serial(this,"COM3",9600);
}

void draw(){
  background(255);
  if(x<80){
    x=0;
  }
  else if(x<=255 && x>=80){
    x=50;
  }
  if(H<0){
    H=0;
  }
  else if(H>500){
    H=500;
  }
  ellipse(H,250,50,50);
  H=H-x+(255-y);
}

void serialEvent(Serial p){
  if(myPort.available()>3){
    x=myPort.read();
    y=myPort.read();
    z=myPort.read();
    w=myPort.read();
    myPort.write(65);
  }
}

void mousePressed(){
  myPort.clear();
  myPort.write(65);
}