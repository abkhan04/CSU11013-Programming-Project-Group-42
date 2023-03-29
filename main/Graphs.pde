// A.Khan Added Graphs Class 22/03
// A.Khan Made Barchart class 29/03

class Barchart
{
  float[] dataSet;
  color[] colours;
  int xOrigin;
  int yOrigin;
  int width;
  int height;
  float maxValue;
  
  Barchart(float[] dataSet, color[] colours, int xOrigin, int yOrigin, int width, int height)
  {
    this.dataSet = dataSet;
    this.colours = colours;
    this.xOrigin = xOrigin;
    this.yOrigin = yOrigin;
    this.width = width;
    this.height = height;
    maxValue = getMaxValue();
  }
  
  Barchart(float[] dataSet, int xOrigin, int yOrigin, int width, int height)
  {
    this.dataSet = dataSet;
    colours = new color[dataSet.length];
    generateColours();
    this.xOrigin = xOrigin;
    this.yOrigin = yOrigin;
    this.width = width;
    this.height = height;
    maxValue = getMaxValue();
  }
  
  Barchart(int xOrigin, int yOrigin, int width, int height)
  {
    this.xOrigin = xOrigin;
    this.yOrigin = yOrigin;
    this.width = width;
    this.height = height;
  }
  
  void setData(float[] dataSet)
  {
    this.dataSet = dataSet;
    if (colours == null) generateColours();
    maxValue = getMaxValue();
  }
  
  void generateColours()
  {
    for (int i = 0; i < dataSet.length; i++) colours[i] = color(random(0, 256), random(0, 256), random(0, 256));
  }
  
  float getMaxValue()
  {
    float maxValue = 0;
    for (float f : dataSet) if (f > maxValue) maxValue = f;
    return maxValue;
  }
  
  void draw()
  {
    int nearestTenth = ((int) (maxValue / 10.0)) * 10;
    int barWidth = (int) ((float) width / dataSet.length);
    int increment = 0;
    
    // X and Y Axis
    line(xOrigin, yOrigin, xOrigin, yOrigin - height);
    line(xOrigin, yOrigin, xOrigin + width, yOrigin);
    
    // Y Axis Value Text
    text(nearestTenth, xOrigin - 30, yOrigin - height + 15);
    text((nearestTenth / 2) + (nearestTenth / 4), xOrigin - 30, yOrigin - ((float) height / 2) - ((float) height / 4) + 15);
    text(nearestTenth / 2, xOrigin - 30, yOrigin - ((float) height / 2) + 15);
    text(nearestTenth / 4, xOrigin - 30, yOrigin - ((float) height / 4) + 15);
    text(0, xOrigin - 25, yOrigin + 10);
    
    for (int i = 0; i < dataSet.length; i++)
    {
      float data = height * (dataSet[i] / nearestTenth);
      fill(colours[i]);
      rect(xOrigin + increment, yOrigin, barWidth, -data);
      increment = increment + barWidth;
    }
  }
}
