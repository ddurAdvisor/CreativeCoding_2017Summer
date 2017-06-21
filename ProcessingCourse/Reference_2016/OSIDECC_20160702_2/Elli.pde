class Elli {
  float elliR;
  float elliX;
  float elliY;

  Elli(float _elliX, float _elliY, float _elliR) { 
    elliX = _elliX;
    elliY = _elliY;
    elliR = _elliR;
  }

  void move() {
    elliX += 0.5;
    elliY += 0.2;
  }

  void display() {
    ellipse(elliX, elliY, elliR*2, elliR*2);
  }
}