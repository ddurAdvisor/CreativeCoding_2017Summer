int elliR = 50;
float elliStroke = 3.5;

void setup() {
  size(600, 400);
  background(255, 255, 0);
  //frameRate(10);
}

void draw() {
  println(elliR);
  background(255, 255, 0, 10);
  //rect(0, 0, width, height);  
  int circleDiv = 16;
  for (int i = 0; i < circleDiv; i ++) {
    //sin(TWO_PI);
    //cos();
    float ellipseX = width/2+150*cos(TWO_PI/circleDiv*i);//f1(i);
    float ellipseY = height/2+150*sin(TWO_PI/circleDiv*i);//f2(i);
    int myColor;
    if (i<circleDiv/4) {
      myColor = 50;
    }
    else if (i<circleDiv*3/4 && i >circleDiv/2) {
      myColor = 150;
    } else {
      myColor = 255;
    }
    myEllipse(ellipseX, ellipseY, myColor);
  }
}

void myEllipse(float x, float y, int ellipseColor) {
  fill(ellipseColor);
  stroke(100);
  strokeWeight(elliStroke);
  ellipse(x, y, elliR, elliR);
}

void keyPressed() {
  if (key == 'a') {
    elliR = elliR +1; // elliR ++;
  }
  if (key == 'z') {
    elliR --;
  }
}