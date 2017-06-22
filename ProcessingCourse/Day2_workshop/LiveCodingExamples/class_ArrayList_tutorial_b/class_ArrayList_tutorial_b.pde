//Declare
//Ball[] myBall = new Ball[100];
ArrayList ballCollection;

float x = 50;
float y = 50;

void setup() {
  size(600, 600);
  initiate();
}

void draw() {
  background(0);
  // for (int i = 0; i < myBall.length; i++) {
  //   myBall[i].run();
  // }

  // Ball myBall = (Ball)ballCollection.get(0);
  // myBall.run();
  
  Ball myBall = new Ball(300, 300, 30);
  ballCollection.add(myBall);

  // for (int i = 0; i < 100; i++) {
  for (int i = 0; i < ballCollection.size(); i++) {
    Ball thisBalls = (Ball)ballCollection.get(i);
    thisBalls.run();
  }
}

void initiate() {
  // for (int i = 0; i < myBall.length; i++) {
  //   myBall[i] = new Ball(random(50, width-50), random(50, height-50), random(5, 30));
  // }

  ballCollection = new ArrayList();
  // Ball myBall = new Ball(200, 200, 50);
  // ballCollection.add(myBall);

  // for (int i = 0; i < 100; i++) {
  //   Ball myBall = new Ball(random(50, width-50), random(50, height-50), random(5, 30));
  //   ballCollection.add(myBall);
  // }
}

void mousePressed() {
  initiate();
}

