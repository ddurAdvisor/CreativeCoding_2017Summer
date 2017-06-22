class Ball{
  //Global variables
  float x;
  float y;  
  float speedX = 3;
  float speedY = 5;
  float r =25;
  
  //class Constructor
  Ball(float dx, float dy, float _r){
    x = dx;
    y = dy;
    r = _r;
  }
  
  //Functions
  void run(){
    move();
    display();
    collision();
    gravity();
  }
  
  void move(){
    x += speedX;
    y += speedY;
  }
  
  void gravity(){
    speedY+=0.2;
  }
  
  void collision(){
    if(x > width-r || x < r){
      speedX = speedX * -1;
    }
    if(y > height-r || y < r){
      speedY = speedY * -1;
    }
  }
  
  void display(){
    ellipse(x, y, r*2, r*2);
  }
}
