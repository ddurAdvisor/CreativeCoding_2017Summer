/* Zhang Liqun@SJTU IDM
*/

class Particle {
  float x,y,dir,speed,rad;
  int rgbcol;
  
  // constructor
  Particle() {
    x=random(width);
    y=random(height);
    dir=random(360);
    speed=random(5,10);
    rad=random(10,50);
    
    int choice=(int)random(4);
    if(choice==0) rgbcol=color(#FFC400);
    if(choice==1) rgbcol=color(#00BDFF);
    if(choice==2) rgbcol=color(#FF00F3);
    if(choice==3) rgbcol=color(#FF0000);    
  }
  
  void update() {
    x=x+cos(radians(dir))*speed;
    y=y+sin(radians(dir))*speed;

    fill(rgbcol);
    ellipse(x,y, rad,rad);

    // keep x,y on screen
    if(x<0) x=width;
    if(x>width) x=0;
    if(y<0) y=height;
    if(y>height) y=0;  
  }
}