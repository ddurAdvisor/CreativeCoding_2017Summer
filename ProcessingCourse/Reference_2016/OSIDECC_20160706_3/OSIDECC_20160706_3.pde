int[] curveX=new int[10];
int[] curveY=new int[10];

void setup(){
  size(800, 800);
  generateArray();
}

void generateArray(){
  for(int i = 0; i < curveX.length; i ++){
    curveX[i] = int(random(50, width-50));
    curveY[i] = int(random(50, height-50));
  }
}

void draw(){
  background(50);
  curveDisplay();
}

void curveDisplay(){
  noFill();
  stroke(255);
  strokeWeight(3);
  beginShape();
  curveVertex(curveX[0], curveY[0]);
  for(int i = 0; i < curveX.length; i ++){
    curveVertex(curveX[i], curveY[i]);
  }
  curveVertex(curveX[curveX.length-1], curveY[curveX.length-1]);
  endShape();
  
  stroke(200, 0, 255);
  strokeWeight(9);
  for(int i = 0; i < curveX.length; i ++){
    point(curveX[i], curveY[i]);
    textSize(20);
    text(i, curveX[i]+5, curveY[i]-5);
  }
}

void mousePressed(){
  generateArray();
}