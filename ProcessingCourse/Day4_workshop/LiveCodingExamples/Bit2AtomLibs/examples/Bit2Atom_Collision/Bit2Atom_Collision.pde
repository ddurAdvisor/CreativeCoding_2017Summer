import Bit2AtomLibs.*;

ArrayList<Bit2AtomCollision> myBall;

void setup() {
  size(600, 600);
  smooth();
  myBall = new ArrayList();
}

void draw() {
  background(0);
  for (int i=0; i<myBall.size(); i++) {
    Bit2AtomCollision mb = (Bit2AtomCollision)myBall.get(i);
    mb.run();
  }
}

void mousePressed() {
  PVector mb = new PVector(mouseX, mouseY);
  color cb = color(random(255), random(255), random(255));
  myBall.add(new Bit2AtomCollision(this, myBall, mb, random(5, 30), cb));
}