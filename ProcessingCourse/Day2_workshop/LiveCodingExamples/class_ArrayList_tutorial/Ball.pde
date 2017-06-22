class Ball{
  //Global variables
  float x;
  float y;  
  float speedX = 3;
  float speedY = 5;
  float r =25;
  int colorBall;
  //int index;
  
  //class Constructor
  Ball(float dx, float dy, float _r, int _colorBall){
    x = dx;
    y = dy;
    r = _r;
    colorBall = _colorBall;
  }
  
  //Functions
  void run(int index){
    move();
    display(index);
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
    if(x > width-r){
      speedX = speedX * -1;
      x = width-r;
    }
    if(x < r){
      speedX = speedX * -1;
      x = r;
    }
    if(y > height-r){
      speedY = speedY * -1;
      y = height-r;
    }
    if(y < r){
      speedY = speedY * -1;
      y = r;
    }
  }
  
  void display(int index){
     fill(colorBall);
     ellipse(x, y, r*2, r*2);
     fill(200);
     textFont(myFont);
     textAlign(CENTER,CENTER);
     text(index+1,x,y);
  }
}
