import controlP5.*;

ControlP5 cp;

PImage img;
int rectNum = 50000;

void setup() {
    img = loadImage("bear.jpg");
    //cp = new ControlP5(this);
    //cp.addSlider("xDiv", 0, 500, 100, 50, 50, 200, 30);
    //cp.addSlider("yDiv", 0, 300, 50, 50, 90, 200, 30);
    size(1024, 576);
    background(0);
}

void draw() {
    //background(0);
    //image(img, 0, 0);
    //drawRect();
    //drawGrid();
    drawElli();
}

void drawElli() {
        int x = int(random(width));
        int y = int(random(height));
        color c = img.get(x, y);
        rectMode(CENTER);
        fill(c, 100);
        noStroke();
        float d = random(10,60);
        ellipse(x, y, d, d);
}

void drawRect() {
    for (int i = 0; i < rectNum; i ++) {
        int x = int(random(width));
        int y = int(random(height));
        color c = img.get(x, y);
        rectMode(CENTER);
        fill(c, 100);
        noStroke();
        rect(x, y, 30, 30);
    }
}

int xDiv = 100;
int yDiv = 50;

void drawGrid() {
    for (int i = 0; i < xDiv; i ++) {
        for (int j = 0; j < yDiv; j ++) {
            color c = img.get(width/xDiv*(i+1/2), height/yDiv*(j+1/2));
            rectMode(CENTER);
            fill(c);
            noStroke();
            rect(width/xDiv*i, height/yDiv*j, width/xDiv, height/yDiv);
        }
    }
}