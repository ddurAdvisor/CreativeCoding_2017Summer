import controlP5.*;

ControlP5 bar;
PFont font;
int ellipseRadius = 50;

void setup() {
  size(800, 800);
  font = createFont("微软雅黑", 32);
  UI();
}

void draw() {
  background(50);
  ellipse(width/2, height/2, ellipseRadius*2, ellipseRadius*2);
}