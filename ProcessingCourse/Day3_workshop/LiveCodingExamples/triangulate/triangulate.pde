import Bit2AtomLibs.*;

ArrayList triangles = new ArrayList();
ArrayList points = new ArrayList();

void setup() {
  size(800, 800);
  smooth();
  reset();
}

void reset() {
  
  // clear the list
  points.clear();
  
  // fill the points arraylist with random points
  for (int i = 0; i < 50; i++) {
    // PVector.z is used to store an angle (particle's direction)
    points.add(new PVector(random(width), random(height), random(TWO_PI)));
  }
 
}

void mouseClicked() {
  reset();
}

void draw() {
  model();
  setColor();
  view();
}

void model() {
  // get the triangulated mesh
  triangles = Triangulate.triangulate(points);
}
  
void view() {
  background(255);    
  noStroke();
  fill(70, 70, 250);
  
  // draw the points
  for (int i = 0; i < points.size(); i++) {
    PVector p = (PVector)points.get(i);
    ellipse(p.x, p.y, 2.5, 2.5);
  }
 
  // draw the mesh of triangles
  stroke(0, 40);
  //fill(255, 0, 255);
  beginShape(TRIANGLES);
 
  for (int i = 0; i < triangles.size(); i++) {
    fill((color)triColor.get(i));
    //fill(random(255), 0, 255);
    Triangle t = (Triangle)triangles.get(i);
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }
  
  endShape();
}

ArrayList triColor = new ArrayList();

void setColor(){
  for (int i = 0; i < triangles.size(); i++) {
    color cc = color(random(255), 0, 255);
    triColor.add(cc);
  }
}