import Bit2AtomLibs.*;



ArrayList triangles = new ArrayList();
ArrayList points = new ArrayList();

void setup() {
  size(400, 400);
  smooth();
  reset();
}

void reset() {
  
  // clear the list
  points.clear();
  
  // fill the points arraylist with random points
  for (int i = 0; i < 100; i++) {
    points.add(new PVector(random(width), random(height)));
  }
 
}

void mouseClicked() {
  reset();
}

void draw() {
  model();
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
  fill(255, 40);
  beginShape(TRIANGLES);
 
  for (int i = 0; i < triangles.size(); i++) {
    Triangle t = (Triangle)triangles.get(i);
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }
  
  endShape();
  
}