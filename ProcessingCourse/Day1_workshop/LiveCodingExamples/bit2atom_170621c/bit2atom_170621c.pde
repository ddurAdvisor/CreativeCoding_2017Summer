void setup() {
    size(800, 600);
}

void draw() {
    background(51);
    for (int i = 0; i < 10; i ++) {
        float alpha = 0;
        alpha = map(40*i, 0, width, 0, TWO_PI);
        float r = 10 * cos(alpha);
        myForm(100, 50 + 50*i, r);
    }
}

void myForm(float rectX, float rectY, float elliR) {
    float x = rectX;
    float y = rectY;
    float r = elliR;
    fill(100);
    rect(x, y, r*6, r*2);
    for (int i = 0; i < 3; i ++) {
        ellipse(x+r*(i*2+1), y+r, r*2, r*2);
    }
}