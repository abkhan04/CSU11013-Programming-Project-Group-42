/*
class PieChart{
  float diameter;
  int[] data;
  int dataTotal;
  
  PieChart(float diameter, int[] data){
    this.diameter = diameter; 
    this.data = data;
  }
  
  void pieChart(float diameter, int[] data) { //<>//
    float lastAngle = 0;
    for (int i = 0; i < data.length; i++) {
      float gray = map(i, 0, data.length, 0, 255);
      fill(gray);
      arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians((data[i]*360/dataTotal)));
      lastAngle += radians(((data[i]*360/dataTotal)));
    }
  }
  void draw() {
    dataTotal = 0;
    for(int i = 0; i<data.length;i++){
        dataTotal=dataTotal+data[i];
    }
    pieChart(300,data);
  }

}*/

class PieChart {
  float diameter;
  float[] data;
  int dataTotal;
  
  PieChart(float diameter, float[] data) {
    this.diameter = diameter; 
    this.data = data;
  }
  
  void pieChart(float diameter, float[] data) {
    float lastAngle = 0;
    
    color[] colors = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), color(255, 255, 0), color(0, 255, 255), color(255, 0, 255), color(128, 0, 0), color(0, 128, 0), color(0, 0, 128), color(128, 128, 0),
      color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), color(255, 255, 0), color(0, 255, 255), color(255, 0, 255), color(128, 0, 0), color(0, 128, 0), color(0, 0, 128), color(128, 128, 0)}; // Define an array of colors
    
    for (int i = 0; i < data.length; i++) {
      fill(colors[i]); // Use a different color for each segment
      arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle + radians((data[i]*360/dataTotal)));
      lastAngle += radians((data[i]*360/dataTotal));
    }
  }
  
  void draw() {
    dataTotal = 0;
    for (int i = 0; i < data.length; i++) {
      dataTotal += data[i];
    }
    pieChart(300, data);
  }
}
