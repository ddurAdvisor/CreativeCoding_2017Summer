PVector a,b,c;

void setup(){
  size(600,600);
  smooth();
}

void draw(){
  background(255);
  a=new PVector(mouseX,mouseY);
  b=new PVector(200,200);
  c =PVector.add(a,b); 
  // a.sub(b);
  // a.mult(0.5);
  //translate(width/2,height/2);
  strokeWeight(1);
  line(0,0,a.x,a.y);
  line(0,0,c.x,c.y);
  strokeWeight(5);
  point(a.x, a.y);
  point(b.x, b.y);
}
