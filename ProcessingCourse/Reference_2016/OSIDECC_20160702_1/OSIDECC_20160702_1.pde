PFont font;
int[] data = new int[5];

void setup(){
  size(600, 400);
  
  font = createFont("微软雅黑", 24);
  
  for(int i = 0; i < data.length; i ++){
    data[i] = (int)random(5, 20);
  }
}

void draw(){
  background(255);
  for(int i = 0; i < data.length; i ++){
    int value = data[i];
    textAlign(CENTER, CENTER);
    textFont(font, 18);
    fill(0);
    text(value+", ", width/2 + 20*i, height/2);
    //println(value);
  }
}