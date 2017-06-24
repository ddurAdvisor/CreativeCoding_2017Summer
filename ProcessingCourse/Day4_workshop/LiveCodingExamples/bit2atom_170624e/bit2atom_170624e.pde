import peasy.*;
import Bit2AtomLibs.*;

PeasyCam myCam;

ArrayList triPoints = new ArrayList();
ArrayList triangles = new ArrayList();

void setup() {
    size(800, 800, P3D);
    myCam = new PeasyCam(this, 500);
    init();
}

void draw() {
    background(51);
    model();
    drawTriangels();
}

void init() {
    triPoints.clear();
    for (int i = 0; i < 15; i++) {
        for (int j = 0; j < 15; j++) {
            triPoints.add(new PVector(100 + 40*i, 100 + 40*j + random(5*j), random(10)));
        }
    }
}

void model() { 
    triangles = Triangulate.triangulate(triPoints);
}

void drawTriangels() {
    beginShape(TRIANGLES);
    for (int i = 0; i < triangles.size(); i++) {
        Triangle t = (Triangle)triangles.get(i);
        
        float mean= (t.p1.y + t.p2.y + t.p3.y)/3;
        fill(map(mean, 0, height, 0, 255));
        
        vertex(t.p1.x, t.p1.y, t.p1.z);
        vertex(t.p2.x, t.p2.y, t.p1.z);
        vertex(t.p3.x, t.p3.y, t.p1.z);
    }
    endShape();
}

void mousePressed() {
    init();
}