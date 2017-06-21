PFont font;
float ellipseX, ellipseY, ellipseR;

Elli[] myElli = new Elli[5];

void setup() {
  size(600, 400);

  font = createFont("微软雅黑", 24);
  initiate();
}

void initiate() {
  for (int i = 0; i < myElli.length; i++) {
    ellipseX = random(width/2-200, width/2-200);
    ellipseY = random(height/2-200, height/2-200);
    ellipseR = random(20, 50);
    myElli[i] = new Elli(ellipseX, ellipseY, ellipseR);
  }
}

void keyPressed() {
  if (key == 'i') {
    initiate();
  }
}

void draw() {
  background(255);
  for (int i = 0; i < myElli.length; i++) {
    myElli[i].update(i);
  }
}