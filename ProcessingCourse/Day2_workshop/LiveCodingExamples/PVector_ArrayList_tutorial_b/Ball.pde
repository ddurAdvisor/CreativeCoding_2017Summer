class Ball{
  //Global variables
  PVector loc;
  PVector speed = new PVector(2,0.5);
  PVector acc = new PVector(0, 0);
  PVector gravityIndex = new PVector(0,0.1);
  float r =25;
  
  //class Constructor
  Ball(PVector _loc, float _r){
    loc = _loc;
    r = _r;
  }
  
  //Functions
  void run(){
    move();
    display();
    bounce();
    collide();
  }
  
  void move(){
    acc.add(gravityIndex);
    speed.add(acc);
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
  
  void collide() {
    for (int i=0;i<ballCollection.size();i++) {
      Ball other = (Ball)ballCollection.get(i);
      PVector diff = PVector.sub(loc,other.loc);
      float distance = diff.mag();
      
      if (distance >0 && distance <r+other.r) {
        diff.normalize();
        diff.mult(20/r);//small balls can be more easierly change motion
        acc.add(diff);
      }
    }
  }
  
  void display(){
    ellipse(loc.x, loc.y, r*2, r*2);
  }
}
