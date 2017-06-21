class Elli {
  float elliR;
  float elliX;
  float elliY;
  float speedX = 2;
  float speedY = 1;
  float gravity = 0.1;
  int index;

  Elli(float _elliX, float _elliY, float _elliR) { 
    elliX = _elliX;
    elliY = _elliY;
    elliR = _elliR;
  }
  
  void update(int newIndex){
    gravityEffect();
    move();
    bounce();
    display(newIndex);
  }
  
  void gravityEffect(){
    speedY += gravity;
  }

  void move() {
    elliX += speedX;
    elliY += speedY;
  }
  
  void bounce(){
    if(elliX+elliR > width){
      elliX = width - elliR;
      speedX = speedX * -1;
    }
    if(elliX < elliR){
      elliX = elliR;
      speedX = speedX * -1;
    }
    
    if(elliY+elliR > height){
      elliY = height - elliR;
      speedY = speedY * -1;
    }
    if(elliY < elliR){
      elliY = elliR;
      speedY = speedY * -1;
    }
  }

  void display(int newIndex) {
    noFill();
    ellipse(elliX, elliY, elliR*2, elliR*2);
    textFont(font,16);
    fill(0);
    textAlign(CENTER,CENTER);
    text(newIndex, elliX, elliY);
  }
}