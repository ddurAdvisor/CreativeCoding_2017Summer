import controlP5.*;

ControlP5 myControl;

int sliderH=20;
int sliderW=200;
int sliderLX=20;
int sliderLY=20;
int sliderInterv=5;

float ellX=450;
float ellY=300;
float ellR=50;
int ellStroke=3;

int bColorR=100;
int bColorG=100;
int bColorB=100;

int fColorR=150;
int fColorG=150;
int fColorB=150;

void setup(){
  size(900,600);
  
  myControl=new ControlP5(this);
  
  myControl.addSlider("bColorR",0,255,100,sliderLX,sliderLY,sliderW,sliderH);
  myControl.addSlider("bColorG",0,255,100,sliderLX,sliderLY+sliderH+sliderInterv,sliderW,sliderH);
  myControl.addSlider("bColorB",0,255,100,sliderLX,sliderLY+2*(sliderH+sliderInterv),sliderW,sliderH);
  
  myControl.addSlider("fColorR",0,255,100,sliderLX,sliderLY+4*(sliderH+sliderInterv),sliderW,sliderH);
  myControl.addSlider("fColorG",0,255,100,sliderLX,sliderLY+5*(sliderH+sliderInterv),sliderW,sliderH);
  myControl.addSlider("fColorB",0,255,100,sliderLX,sliderLY+6*(sliderH+sliderInterv),sliderW,sliderH);
  
  myControl.addSlider("ellR",10,300,50,sliderLX,sliderLY+9*(sliderH+sliderInterv),sliderW,sliderH);
  myControl.addSlider("ellX",ellR,width-ellR,width/2,sliderLX,sliderLY+10*(sliderH+sliderInterv),sliderW,sliderH);
  myControl.addSlider("ellY",ellR,height-ellR,height/2,sliderLX,sliderLY+11*(sliderH+sliderInterv),sliderW,sliderH);
  myControl.addSlider("ellStroke",0.1,100,5,sliderLX,sliderLY+7*(sliderH+sliderInterv),sliderW,sliderH);
  // smooth();
}

void draw(){
  background(bColorR,bColorG,bColorB);
  //background(0);
  //stroke(0);
  stroke(fColorR,fColorG,fColorB);
  strokeWeight(ellStroke);
  noFill();
  ellipse(ellX,ellY,ellR*2,ellR*2);
}
