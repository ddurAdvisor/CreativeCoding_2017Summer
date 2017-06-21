/* Zhang Liqun@SJTU IDM
*/

Particle p[];
int num;

void setup() {
  size(400,400);
  
  num=10;
  p=new Particle[num];
  for(int i=0; i<num; i++) {
    p[i]=new Particle();
  }
}

void draw() {
  for(int i=0; i<num; i++) {
    p[i].update();
  }
}  