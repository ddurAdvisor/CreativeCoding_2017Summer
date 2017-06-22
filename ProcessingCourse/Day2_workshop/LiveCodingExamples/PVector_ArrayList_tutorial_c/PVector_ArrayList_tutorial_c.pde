PFont myFont;

ArrayList ballCollection;

float x = 50;
float y = 50;

void setup() {
  size(600, 600);
  myFont = createFont("微软雅黑", 16);
  initiate();
}

void draw() {
  background(0);

  for (int i = 0; i < ballCollection.size (); i++) {
    Ball myBall = (Ball)ballCollection.get(i);
    myBall.run(i);
  }
  println(ballCollection.size ());
}

void initiate() {

  ballCollection = new ArrayList();

  for (int i = 0; i < 10; i++) {
    PVector ballLoc = new PVector(random(50, width-50), random(50, height-50));
    Ball myBall = new Ball(ballLoc, random(5, 30), 150);
    ballCollection.add(myBall);
  }
}

void mousePressed() {
  //initiate();
  
  PVector mouseLoc = new PVector(mouseX, mouseY);
  Ball myBall = new Ball(mouseLoc, 30, (int)random(50,255));
  ballCollection.add(myBall);
}

