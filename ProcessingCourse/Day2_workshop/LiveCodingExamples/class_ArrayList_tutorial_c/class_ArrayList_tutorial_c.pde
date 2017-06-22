PFont myFont;

ArrayList ballCollection;

float x = 50;
float y = 50;

void setup() {
  size(600, 600);
  myFont = createFont("微软雅黑", 16);
  initiate();
  // frameRate(1);
}

void draw() {
  background(0);
  // for (int i = 0; i < myBall.length; i++) {
  //   myBall[i].run();
  // }
  fill(255);
  for (int i = 0; i < ballCollection.size (); i++) {
    Ball myBall = (Ball)ballCollection.get(i);
    myBall.run(i);
  }
  println(ballCollection.size ());
}

void initiate() {
  // for (int i = 0; i < myBall.length; i++) {
  //   myBall[i] = new Ball(random(50, width-50), random(50, height-50), random(5, 30));
  // }

  ballCollection = new ArrayList();

  for (int i = 0; i < 10; i++) {
    Ball myBall = new Ball(random(50, width-50), random(50, height-50), random(5, 30), 150);
    ballCollection.add(myBall);
  }
}

void mousePressed() {
  //initiate();

  Ball myBall = new Ball(mouseX, mouseY, 30, (int)random(50,255));
  ballCollection.add(myBall);
}

