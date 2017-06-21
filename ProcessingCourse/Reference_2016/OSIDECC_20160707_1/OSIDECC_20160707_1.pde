  
PrintWriter output;

void setup() {
  size(600,600);
  // Create a new file in the sketch directory
  output = createWriter("positions.txt"); 
}

void draw() {
  background(255);
  point(mouseX, mouseY);
  output.println("mouseX: "+mouseX + " | " + "mouseY: "+mouseY); // Write the coordinate to the file
}

void keyPressed() {
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  exit(); // Stops the program
}