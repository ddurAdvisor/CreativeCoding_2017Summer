/**
 *this example demonstrates how to use loadTable()
 *to retrieve data from a csv file and make objects
 *from that data.
 *
 *here is what the csv looks like:
 *
 X,Y,Diameter,Name
 200,100,60.5015,Happy
 255,152,95.8324,Sad
 273,235,61.1407,Joyous
 121,179,44.7586,Melancholy
 */
PFont font;  
Table myTable;
Bubble[] myBubbles;

void setup() {
  size(640, 400);
  font = createFont("微软亚黑",16);
  smooth();
}

void loadData(){
  myTable = loadTable("data2.csv", "header");
  myBubbles = new Bubble[myTable.getRowCount()];
  
  for (int i = 0; i < myTable.getRowCount(); i ++) {
    TableRow row = myTable.getRow(i);
    float bubbleX = row.getInt("X");
    float bubbleY = row.getInt("Y");
    float bubbleD = row.getFloat("Diameter");
    String bubbleN = row.getString("Name");

    myBubbles[i] = new Bubble(bubbleX, bubbleY, bubbleD, bubbleN, i);
  }
  
}

void draw() {
  background(255);
  loadData();
  for (int i = 0; i < myTable.getRowCount(); i ++) {
    myBubbles[i].display();
  }
}

void mousePressed(){
  //create a new row
  TableRow row = myTable.addRow();
  //set the values of that row
  row.setFloat("X", mouseX);
  row.setFloat("Y", mouseY);
  row.setFloat("Diameter", random(40,80));
  row.setString("Name", "Bang");
  
  if(myTable.getRowCount() > 10){
    //delet the oldest row
    myTable.removeRow(0);
  }
  
  saveTable(myTable, "data/data2.csv");
  //and reloading it
  loadData();
}