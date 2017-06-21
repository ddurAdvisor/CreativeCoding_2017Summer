PFont font;
float ellipseX, ellipseY, ellipseR;

Elli myElli;

void setup() {
  size(600, 400);

  font = createFont("微软雅黑", 24);
  initiate();
}

void initiate() {
  ellipseX = random(width/2-200, width/2-200);
  ellipseY = random(height/2-200, height/2-200);
  ellipseR = random(20, 50);

  myElli = new Elli(ellipseX, ellipseY, ellipseR);
}

void keyPressed() {
  if (key == 'i') {
    initiate();
  }
}

void draw() {
  background(255);
  myElli.move();
  myElli.display();
}