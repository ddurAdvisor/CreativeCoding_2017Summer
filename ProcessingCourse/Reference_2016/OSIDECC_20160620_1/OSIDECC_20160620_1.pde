 float x = 50;
 float y = 50;
 float r = 50;
 
 void setup(){
   size(600, 400);
   background(200,200,0);
 }
 
 void draw(){
   background(200,200,0);
   fill(100);
   stroke(255);
   strokeWeight(4);
     
   ellipse(x, y, r*2, r*2);
   
   x = x + 1;
   y = y + 0.5;
   
   
   float eX = mouseX;
   float eY = mouseY;
   fill(eX, eY, 100);
   ellipse(eX, eY, 50, 50);

 }