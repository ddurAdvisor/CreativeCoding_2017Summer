/* Zhang Liqun@SJTU IDM
*/

float h[],gray[];

// declare an integer variable to control 
// the number of elements
int num;
float barW;

void setup() {
  size(400,400);  
  
  num=40;
  barW=width/num;
    
  // construct our arrays
  h=new float[num];
  gray=new float[num];

  // call a custom function to initialize values
  initBoxes();  
}

void draw() {
  background(200);
  
  // draw a sequence of bars using our "h" array
  for(int i=0; i<num; i++) {
    fill(gray[i]);
    rect(i*barW,height/2, barW,h[i]);
  }
  
//  println("frame "+frameCount+" "+frameRate);
}

// declare a custom function called "initBoxes"
void initBoxes() {
  println("initBoxes");
  // fill the array with values using a for loop.
  for(int i=0; i<num; i++) {
    h[i]=random(-height/2,height/2);
    gray[i]=random(255);
  }
}  

// reinitialize when mouse button is pressed
void mousePressed() {
  initBoxes();
}