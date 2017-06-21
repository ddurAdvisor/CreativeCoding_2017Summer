/* Zhang Liqun@SJTU IDM
*/

// An array is a variable that can contain more than one value.
// Think of it as a shelf with compartments that each hold a 
// single value.

// The following declares an array of floating point values
float h[];

void setup() {
  size(400,400);  
  
  // construct our array and declare its size  
  h=new float[50];
  
  // fill the array with values using a for loop. we need to 
  // use an int variable as a counter to index the array.
  for(int i=0; i<50; i++) {
    h[i]=random(50,height/2);
  }
}

void draw() {
  background(200);
  
  // draw a sequence of bars using our "h" array
  for(int i=0; i<50; i++) {
    rect(i*8,height/2, 8,h[i]);
    h[i]=h[i]+random(-2,2);
  }

}