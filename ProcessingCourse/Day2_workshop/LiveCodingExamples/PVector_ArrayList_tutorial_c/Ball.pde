class Ball{
  //Global variables
  PVector loc;
  PVector speed = new PVector(1, 1);
  PVector gravity = new PVector(0, 0.1);
  PVector acc = new PVector(0,0);
  float r =25;
  int colorBall;
  //int index;
  
  //class Constructor
  Ball(PVector _loc, float _r, int _colorBall){
    loc = _loc;
    r = _r;
    colorBall = _colorBall;
  }
  
  //Functions
  void run(int index){
    move();
    display(index);
    bounce();
    collisionInBetween();
  }
  
  void move(){
    acc.add(gravity);
    speed.add(acc);
    speed.limit(10);
    loc.add(speed);
    acc = new PVector(0,0);
  }
  
  void bounce(){
    if(loc.x > width-r){
      speed.x = speed.x * -1;
      loc.x = width-r;
    }
    if(loc.x < r){
      speed.x = speed.x * -1;
      loc.x = r;
    }
    if(loc.y > height-r){
      speed.y = speed.y * -1;
      loc.y = height-r;
    }
    if(loc.y < r){
      speed.y = speed.y * -1;
      loc.y = r;
    }
  }
  
  //resolve collision inbetween balls
  void collisionInBetween() {
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
  
  void display(int index){
     fill(colorBall);
     ellipse(loc.x, loc.y, r*2, r*2);
     fill(200);
     textFont(myFont);
     textAlign(CENTER,CENTER);
     text(index+1, loc.x, loc.y);
  }
}
