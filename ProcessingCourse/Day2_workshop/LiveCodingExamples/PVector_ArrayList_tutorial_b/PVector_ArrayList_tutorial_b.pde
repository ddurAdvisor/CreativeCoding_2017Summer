//Declare
ArrayList ballCollection;

float x = 50;
float y = 50;

void setup() {
  size(600, 600);
  initiate();
}

void draw() {
  background(0);

  for (int i = 0; i < ballCollection.size(); i++) {
    Ball thisBalls = (Ball)ballCollection.get(i);
    thisBalls.run();
  }
}

void initiate() {
  ballCollection = new ArrayList();

  for (int i = 0; i < 5; i++) {
    PVector origin = new PVector(random(50, width-50), random(50, height-50));
    Ball myBall = new Ball(origin, random(5, 30));
    ballCollection.add(myBall);
  }
}

void mousePressed() {
  initiate();
}

