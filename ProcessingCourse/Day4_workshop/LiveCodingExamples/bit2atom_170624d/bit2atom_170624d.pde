//triangle(30, 75, 58, 20, 86, 75);
PVector[] triPoints = new PVector[3];

void setup() {
    size(800, 600);
    init();
}

void init() {
    setData();
}

void draw() {
    background(51);
    triangle(triPoints[0].x, triPoints[0].y, triPoints[1].x, triPoints[1].y, triPoints[2].x, triPoints[2].y);
}

void setData() {
    for (int i = 0; i < triPoints.length; i ++) {
        triPoints[i] = new PVector(random(100, width-100), random(100, height-100));
    }
}

void mousePressed() {
    init();
}