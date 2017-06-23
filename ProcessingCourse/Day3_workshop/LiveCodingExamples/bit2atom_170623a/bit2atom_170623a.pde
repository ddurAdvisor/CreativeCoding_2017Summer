int sampleSize = 20;
PVector[] location = new PVector[sampleSize];
float[] radius = new float[sampleSize];
color[] sampleColor = new color[sampleSize];

void setup() {
    size(800, 600);
    init();
}

void init() {
    generateData();
}

void draw() {
    background(51);
    drawLines();
}

//generate raw dataset for future use
void generateData() {
    for (int i = 0; i < sampleSize; i ++) {
        location[i] = new PVector((width/sampleSize)*i +random(20), random(100, 500)); //location: x value and y value
        radius[i] = random(5, 20); //radiu values of each sample data
        sampleColor[i] = color(random(255), random(255), random(255)); //colors of each sample data
    }
}

void drawLines() {
    //draw folding lines
    for (int i = 0; i < sampleSize-1; i ++) {
        stroke(255);
        line(location[i].x, location[i].y, location[i+1].x, location[i+1].y);
    }
    
    //draw ellipses
    for (int i = 0; i < sampleSize; i ++) {
        fill(sampleColor[i]);
        ellipse(location[i].x, location[i].y, radius[i]*2, radius[i]*2);
    }
    
    //draw curve chain
    beginShape();
    curveVertex(location[0].x, location[0].y);
    for (int i = 0; i < sampleSize; i ++) {
        stroke(255, 0, 255);
        noFill();
        curveVertex(location[i].x, location[i].y);
    }
    curveVertex(location[sampleSize-1].x, location[sampleSize-1].y);
    endShape();
}

//reset raw dataset
void mousePressed() {
    init();
}