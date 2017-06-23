int postiveIndex = 0;
int oppositIndex = 0;
int totalRound = 100;

int[] upSidePercent = new int[totalRound];
int[] downSidePercent = new int[totalRound];

void setup() {
  size(1200, 600);
  initiate();
}

void draw() {
  background(0);
  pushMatrix();
  translate(50,100);
  drawCurve();
  popMatrix();
  averagePossibility();
}

void averagePossibility() {
  int totalPositive = 0;
  int totalOppositive = 0;
  for (int i = 0; i < totalRound; i ++) {
    totalPositive += upSidePercent[i];
    totalOppositive += downSidePercent[i];
  }
  float averagePositive = totalPositive / totalRound;
  float averageOppositive = totalOppositive / totalRound;
  fill(200, 200, 0);
  noStroke();
  rect(20,height-216,20,20);
  text("Positive: "+averagePositive,50,height-200);
  
  fill(200, 0, 200);
  noStroke();
  rect(20,height-166,20,20);  
  text("Oppositive: "+averageOppositive,50,height-150);
}

void drawCurve() {
  noFill();
  strokeWeight(3);
  stroke(200, 200, 0);
  beginShape();
  curveVertex(0*11, height/2-3*upSidePercent[0]);
  for (int i = 0; i < totalRound; i ++) {
    curveVertex(i*11, height/2-3*upSidePercent[i]);
  }
  curveVertex((totalRound-1)*11, height/2-3*upSidePercent[totalRound-1]);
  endShape();

  stroke(200, 0, 200);
  strokeWeight(3);
  beginShape();
  curveVertex(0*11, height/2-3*downSidePercent[0]);
  for (int i = 0; i < totalRound; i ++) {
    curveVertex(i*11, height/2-3*downSidePercent[i]);
  }
  curveVertex((totalRound-1)*11, height/2-3*downSidePercent[totalRound-1]);
  endShape();
}

void initiate() {
  for (int i = 0; i < totalRound; i ++) {
    for (int j = 0; j < 100; j ++) {
      float pos = random(1);
      if (pos > 0.5) {
        postiveIndex ++;
      } else {
        oppositIndex ++;
      }
    }
    upSidePercent[i] = postiveIndex;
    downSidePercent[i] = oppositIndex;
    postiveIndex = 0;
    oppositIndex = 0;
  }
}

void mousePressed() {
  initiate();
}

