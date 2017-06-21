PImage img;

void setup() {
  size(1280, 720);
  img = loadImage("sunSet.jpg");
  imageMode(CENTER);
  img.resize(width, height);
  noStroke();
  background(50);
}

void draw() { 
  //image(img, width/ 2, height/2);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  float ellR = map(brightness(pix),0,255,10,40);
  fill(pix,150);
  ellipse(x, y, ellR*2, ellR*2);
}