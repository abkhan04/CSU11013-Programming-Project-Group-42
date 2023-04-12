class PieChart{
  float diameter;
  int[] data;
  int dataTotal;
  
  PieChart(float diameter, int[] data){
    this.diameter = diameter; 
    this.data = data;
  }
  
  void pieChart(float diameter, int[] data) { //<>// //<>// //<>//
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

}
