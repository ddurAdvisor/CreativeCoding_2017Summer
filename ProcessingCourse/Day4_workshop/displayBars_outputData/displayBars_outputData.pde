/**
 *copyright 2015.07.01
 *UI elements
 *key c - control the display of curve
 *key p - control the display of points
 *key n - control the display of value of bar height
 *array barHeight - 
 */

//comment
int[] barHeight=new int[10];

float rectH =100;

boolean displayCurve = true;
boolean displayPoint = true;
boolean displayNumbers = false;

PrintWriter output;

void setup() {
  size(800, 600);
  generateArray();
  output = createWriter("data/points.csv");
}

void draw() {
  background(0);
  // generateArray();

  translate(50, 0);
  for (int i = 0; i < barHeight.length; i++) {
    fill(255);
    stroke(0);
    strokeWeight(1);
    rect(50*i, height/2-barHeight[i], 50, barHeight[i]);
    if (displayNumbers) {
      fill(0);
      textAlign(CENTER);
      text(barHeight[i], 50*i+25, height/2-20);
    }
  }
  //draw curve
  if (displayCurve) {
    noFill();
    beginShape();
    stroke(#BCDE28);
    strokeWeight(5);
    curveVertex(50*0+25, height/2-barHeight[0]);
    for (int i = 0; i < barHeight.length; i++) {
      curveVertex(50*i+25, height/2-barHeight[i]);
    }
    curveVertex(50*barHeight.length-1+25, height/2-barHeight[barHeight.length-1]);
    endShape();
  }

  //draw points
  if (displayPoint) {
    stroke(#5F8DC4);
    strokeWeight(10);
    for (int i = 0; i < barHeight.length; i++) {
      point(50*i+25, height/2-barHeight[i]);
    }
  }
}

void generateArray() {
  for (int i = 0; i <barHeight.length; i++) {
    barHeight[i] = (int)random(50, 200);
  }
}

void keyPressed() {
  if (key == 'a') {
    rectH +=5;
  }
  if (key == 'z') {
    rectH -=5;
  }
  if (key == 'c') {
    if (!displayCurve) {
      displayCurve = true;
    } else
      displayCurve = false;
  }
  if (key == 'p') {
    if (!displayPoint) {
      displayPoint = true;
    } else
      displayPoint = false;
  }
  if (key == 'n') {
    if (!displayNumbers) {
      displayNumbers = true;
    } else
      displayNumbers = false;
  }
  if (key == 'o') {
    println("Output Printed");
    //output.println("test");
    ///*
    for (int i = 0; i <barHeight.length; i++) {
      output.println(i*50+","+barHeight[i]);
    }
    //*/
    output.flush();
    output.close();
  }
}

void mousePressed() {
  generateArray();
}

