PFont font;
Elli[] myElli = new Elli[100];

void setup() {
  size(800, 800);
  font = createFont("微软雅黑", 24);
  initiate();
}

void initiate() {
  for (int i = 0; i < myElli.length; i++) {
    //float ellipseX = random(width/2-200, width/2+200);
    //float ellipseY = random(height/2-100, height/2+100);
    PVector elliCent = new PVector(random(width/2-200, width/2+200), random(height/2-100, height/2+100));
    float ellipseR = random(20, 30);
    myElli[i] = new Elli(elliCent, ellipseR);
  }
}

void keyPressed() {
  if (key == 'i') {
    initiate();
  }
}

void draw() {
  background(128);
  for (int i = 0; i < myElli.length; i++) {
    myElli[i].update(i);
  }
}