class Elli {
  ///////////////declare the variables///////////////
  PVector loc;  
  PVector speed = new PVector(2, 1);
  PVector gravity = new PVector(0, 0.2);
  PVector acc = new PVector(0, 0);
  
  float elliR;
  
  ///////////////declare the variables///////////////

  ///////////////design the data structure od class///////////////
  Elli(PVector _loc, float _elliR) { 
    loc = _loc;
    elliR = _elliR;
  }
  ///////////////design the data structure od class///////////////

  ///////////////design the function - object behavior///////////////
  void update(int newIndex) {
    accSpeed();
    //gravityEffect();
    //move();
    bounce();
    collision();
    display(newIndex);
  }
  ///////////////design the function - object behavior///////////////

  ///////////////design the function - object behavior///////////////
  //void gravityEffect() {
  //  speed.add(gravity);
  //}
  ///////////////design the function - object behavior///////////////

  ///////////////design the function - object collision behavior///////////////
  void collision() {
    for (int i = 0; i < myElli.length; i++) {
      Elli other = myElli[i];
      PVector diff = PVector.sub(loc, other.loc);
      float distance = diff.mag();

      if (distance > 0 && distance < elliR + other.elliR) {
        diff.normalize();
        diff.mult(50/elliR);
        acc.add(diff);
      }
    }
  }
  ///////////////design the function - object collision behavior///////////////

  void accSpeed() {
    speed.add(acc);
    speed.add(gravity);
    loc.add(speed);
    
    if(speed.mag()>3){
      speed.normalize();
      speed.mult(3);
    }
    
    acc = new PVector(0, 0);
  }

  ///////////////design the function - object behavior///////////////
  //void move() {
  //  loc.add(speed);
  //}
  ///////////////design the function - object behavior///////////////

  ///////////////design the function - object behavior///////////////
  void bounce() {
    if (loc.x+elliR > width) {
      loc.x = width - elliR;
      speed.x = speed.x * -1;
    }
    if (loc.x < elliR) {
      loc.x = elliR;
      speed.x = speed.x * -1;
    }

    if (loc.y+elliR > height) {
      loc.y = height - elliR;
      speed.y = speed.y * -1;
    }
    if (loc.y < elliR) {
      loc.y = elliR;
      speed.y = speed.y * -1;
    }
  }
  ///////////////design the function - object behavior///////////////

  ///////////////design the function - object behavior///////////////
  void display(int newIndex) {
    noFill();
    ellipse(loc.x, loc.y, elliR*2, elliR*2);
    textFont(font, 16);
    fill(0);
    textAlign(CENTER, CENTER);
    text(newIndex, loc.x, loc.y);
  }
  ///////////////design the function - object behavior///////////////
}