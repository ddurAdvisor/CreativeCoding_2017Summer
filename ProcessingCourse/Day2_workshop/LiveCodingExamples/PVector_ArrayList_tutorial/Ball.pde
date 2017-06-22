class Ball{
  //Global variables
  PVector loc;
  PVector speed = new PVector(2,0.5);
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
    gravity();
  }
  
  void move(){
    loc.add(speed);
  }
  
  void gravity(){
    speed.add(gravityIndex);
  }
  
  void bounce(){
    if(loc.x > width-r || loc.x < r){
      speed.x = speed.x * -1;
    }
    if(loc.y > height-r || loc.y < r){
      speed.y = speed.y * -1;
    }
  }
  
  void display(){
    ellipse(loc.x, loc.y, r*2, r*2);
  }
}
