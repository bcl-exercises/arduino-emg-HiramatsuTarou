import processing.serial.*;
Serial myPort;

int x=0;
int y=0;
int z=0;
int w=0;

int H=255;
int U=255;


void setup(){
  size(500,500);
  myPort=new Serial(this,"COM3",9600);
}

void draw(){
  background(255);
  if(H<0){
    H=0;
  }
  else if(H>500){
    H=500;
  }
  if(U<0){
    U=0;
  }
  else if(U>500){
    U=500;
  }
  ellipse(H,U,50,50);
  H=H-(255-x)+(255-y);
  U=U-(255-z)+(255-w);
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