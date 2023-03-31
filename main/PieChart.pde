class PieChart{
  float diameter;
  int[] data;
  
  PieChart(float diameter, int[] data){
    this.diameter = diameter; 
    this.data = data;
  }
  
  void draw() {
    pieChart(300,data);
  }

  void pieChart(float diameter, int[] data) {
    float lastAngle = 0;
    for (int i = 0; i < data.length; i++) {
      float gray = map(i, 0, data.length, 0, 255);
      fill(gray);
      arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(data[i]));
      lastAngle += radians(data[i]);
    }
  }

}
