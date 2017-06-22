class Ball {
  PVector loc;
  PVector speed = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  PVector gravity = new PVector(0,0.05);
  float r;
  color c;

  Ball(PVector loc_, float r_, color c_) {
    loc = loc_;
    r=r_;
    c=c_;
  }

  void run() {
    update();//
    display();
    bounce();//ball bouncing with edges of canvas
    collide();//balls collide with each other
  }

  void collide() {
    for (int i=0;i<myBall.size();i++) {
      Ball other = (Ball)myBall.get(i);
      PVector diff = PVector.sub(loc,other.loc);
      float distance = diff.mag();
      
      if (distance >0 && distance <r+other.r) {
        diff.normalize();
        diff.mult(20/r);//small balls can be more easierly change motion
        acc.add(diff);
      }
    }
  }

  void update() {
    acc.add(gravity);
    speed.add(acc);
    //computing resistance from the air
    speed.mult(0.995);
    //limit the speed to maxium of 5
    if(speed.mag()>5){
      speed.normalize();
      speed.mult(5);
    }
    loc.add(speed);
    acc = new PVector(0, 0);
  }

  void bounce() {
    if (loc.x>width-r) {
      speed.x*=-1;
      loc.x = width-r;
    }
    if (loc.x<r) {
      speed.x*=-1;
      loc.x = r;
    }
    if (loc.y>height-r) {
      speed.y*=-1;
      loc.y = height-r;
    }
    if (loc.y<r) {
      speed.y*=-1;
      loc.y = r;
    }
  }

  void display() {
    stroke(255);
    fill(c); 
    ellipse(loc.x, loc.y, r*2, r*2);
  }
}
