import Bit2AtomLibs.*;

Bit2AtomBouncingBall myBall;

void setup() {
  size(800, 800);
  myBall = new Bit2AtomBouncingBall(width, height,2,3);
}

void draw() {
  background(51);
  myBall.update();
  ellipse(myBall.x, myBall.y, 40, 40);
}