void setup() {
  size(600, 600);

  String[] lines = loadStrings("points2.csv");
  //println(lines);
  // printArray(lines);
  // println(lines[2]);
  for (int i = 0; i < lines.length; i ++) {
    //println(lines[i]);
    String[] nums = split(lines[i], ",");
    // printArray(nums);
    int ellipseX = int(nums[0]);
    int ellipseY = int(nums[1]);
    ellipse(ellipseX, ellipseY, 20, 20);
  }
}

/*
String s = "100,90,32,7,87";
 //String c = "200,50,120,190,90";
 String[] nums = split(s, ",");
 //String[] colors = split(c, ",");
 int[] vals = int(nums);
 //int[] ellipseColor = int(colors);
 
 for(int i = 0; i < nums.length; i ++){
 //fill(ellipseColor[i]);
 ellipse(50 + i*50, 200, vals[i], vals[i]);
 }
 */
