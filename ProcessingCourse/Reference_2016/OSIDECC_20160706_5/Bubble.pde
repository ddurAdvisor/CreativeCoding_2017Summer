//a Bubble class

class Bubble {
  float x, y;
  float diameter;
  String name;
  int index;

  boolean over = false;

  //create the Bubble
  Bubble(float x_, float y_, float diameter_, String s, int index_) {
    x = x_;
    y = y_;
    diameter = diameter_;
    name = s;
    index = index_;
  }

  void display() {
    drawBubbles();
    overBubbles();
  }

  void drawBubbles() {
    noFill();
    ellipse(x, y, diameter, diameter);
    fill(200, 0, 255);
    textAlign(CENTER, CENTER);
    textFont(font);
    text(index, x, y);
    if (over) {      
      text(name, x, y+10);
    }
  }

  void overBubbles() {
    if (mouseX < x+diameter && mouseX > x-diameter) {
      if (mouseY < y+diameter && mouseY > y-diameter) {
        over = true;
      }
    } else {
      over = false;
    }
    println(over);
  }
}