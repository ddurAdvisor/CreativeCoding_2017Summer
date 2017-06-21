/* Zhang Liqun@SJTU IDM
*/

// moving using direction and speed
float x[],y[],dir[],speed[];
float rad[],gray[],dirD[];
int num;

void setup() {
  size(400,400);  

  num=20;
  x=new float[num];
  y=new float[num];
  dir=new float[num];
  speed=new float[num];
  rad=new float[num];
  gray=new float[num];
  dirD=new float[num];

  for(int i=0; i<num; i++) {
    x[i]=width/2;
    y[i]=height/2;
    rad[i]=random(10,50);
    gray[i]=random(255);
  }

  initDirection();
}

void draw() {
  //  background(200);

  for(int i=0; i<num; i++) {

    // calculate changein direction using
    // direction and speed
    x[i]=x[i]+cos(radians(dir[i]))*speed[i];
    y[i]=y[i]+sin(radians(dir[i]))*speed[i];
    dir[i]=dir[i]+dirD[i];
    
    fill(gray[i]);
    ellipse(x[i],y[i], rad[i],rad[i]);

    // keep x,y on screen
    if(x[i]<0) x[i]=width;
    if(x[i]>width) x[i]=0;
    if(y[i]<0) y[i]=height;
    if(y[i]>height) y[i]=0;  
  }
}

void initDirection() {
  for(int i=0; i<num; i++) {
    dir[i]=random(360);
    dirD[i]=random(-3,3);
    speed[i]=random(5,10);
  }
}

void mousePressed() {
  initDirection();
}