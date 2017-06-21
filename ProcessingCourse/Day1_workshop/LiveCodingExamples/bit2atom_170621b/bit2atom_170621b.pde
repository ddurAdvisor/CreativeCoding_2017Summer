int x;
float r = 100;

void setup() {
    size(1200, 600); //width, height
    //background(0);
}

void draw() {
    background(100); 
    noStroke();
    //stroke(200, 100, 0);
    //strokeWeight(20);
    fill(255, 100);
    //noFill();

    for (int i = 0; i < 40; i ++) {
        for (int j = 0; j < 40; j ++) {
            float alpha = 0;
            alpha = map(40*i, 0, width, 0, TWO_PI);
            r = 10 * cos(alpha);
            ellipse(40*i, 40*j, 2*r, 2*r);
        }
    }
    //x = x + 5;
    //if (x > width + 100) {
    //    x = -100;
    //}
    //float alpha = 0;
    //alpha = map(x, 0, width, 0, PI);
    //r = 100 * sin(alpha);
    //ellipse(x, height/2, 2*r, 2*r);
}