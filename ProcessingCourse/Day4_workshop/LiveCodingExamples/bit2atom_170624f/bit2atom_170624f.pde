import controlP5.*;

import controlP5.*;
ControlP5 cp5;

float x = 400;
float y = 400;
float d = 20;

void setup() {
    size(800, 800);
    cp5 = new ControlP5(this);
    cp5.addSlider("x", 0, width, 400, 50, 50, 200, 40);
    cp5.addSlider("y", 0, height, 400, 50, 50+40+10, 200, 40);
    cp5.addSlider("d", 0, 100, 20, 50, 50+80+20, 200, 40);
}

void draw() {
    background(51);
    ellipse(x, y, d, d);
}