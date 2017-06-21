/* Zhang Liqun@SJTU IDM
*/

// moving using direction and speed
float x[],y[],dir[],speed[];
int rgbcol[];
float rad[];
int num;

void setup() {
  size(400,400);  

  num=4;
  x=new float[num];
  y=new float[num];
  dir=new float[num];
  speed=new float[num];
  
  rgbcol=new int[num];
  rad=new float[num];

  for(int i=0; i<num; i++) {
    x[i]=width/2;
    y[i]=height/2;
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

    fill(rgbcol[i]);
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
    speed[i]=random(5,10);
    rad[i]=random(10,50);
    
    // set choice to be an integer number
    int choice=(int)random(4);
    if(choice==0) rgbcol[i]=color(#FFC400);
    if(choice==1) rgbcol[i]=color(#00BDFF);
    if(choice==2) rgbcol[i]=color(#FF00F3);
    if(choice==3) rgbcol[i]=color(#FF0000);
  }
}

void mousePressed() {
  initDirection();
}