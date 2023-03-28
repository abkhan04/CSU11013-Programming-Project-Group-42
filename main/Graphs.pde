// A.Khan Added Graphs Class 22/03

import org.gicentre.utils.stat.*;

class Barchart
{
  processing.core.PApplet parent;
  float[] data;
  float xOrigin;
  float yOrigin;
  float width;
  float height;
  float min;
  float max;
  
  BarChart barChart;
  
  private Barchart(processing.core.PApplet parent, float[] data)
  {
    this.parent = parent;
    this.data = data;
    
    BarChart barChart = new BarChart(parent);
    barChart.setData(data);
  }
  
  Barchart(processing.core.PApplet parent, float[] data, float xOrigin, float yOrigin, float width, float height)
  {
    this.parent = parent;
    this.data = data;
    this.xOrigin = xOrigin;
    this.yOrigin = yOrigin;
    this.width = width;
    this.height = height;
    
    BarChart barChart = new BarChart(parent);
    barChart.setData(data);
    min = 0;
    barChart.setMinValue(min);
  }
  
  void draw()
  {
    barChart.draw(xOrigin, yOrigin, width, height);
  }
  
  void draw(float xOrigin, float yOrigin, float width, float height)
  {
    this.xOrigin = xOrigin;
    this.yOrigin = yOrigin;
    this.width = width;
    this.height = height;
    barChart.draw(this.xOrigin, this.yOrigin, this.width, this.height);
  }
  
  void setData(float[] data)
  {
    this.data = data;
    barChart.setData(this.data);
  }
  
  float getMaxValue()
  {
    return barChart.getMaxValue();
  }
  
  void setMaxValue(float max)
  {
    this.max = max;
  }
  
  float getMinValue()
  {
    return barChart.getMinValue();
  }
  
  void setMinValue(float min)
  {
    this.min = min;
  }
  
  void setBarColor(int colour)
  {
    barChart.setBarColour(colour);
  }
  
  void setBarGap(float gap)
  {
    barChart.setBarGap(gap);
  }
  
  void setBarLabels(java.lang.String[] labels)
  {
    barChart.setBarLabels(labels);
  }
  
  void setBarPadding(float padding)
  {
    barChart.setBarPadding(padding);
  }
  
  void setCategoryAxisAt(float value)
  {
    barChart.setCategoryAxisAt(value);
  }
  
  void setCategoryAxisLabel(String label)
  {
    barChart.setCategoryAxisLabel(label);
  }
  
  void setCategoryFormat(String format)
  {
    barChart.setCategoryFormat(format);
  }
  
  void setValueAxisLabel(String label)
  {
    barChart.setValueAxisLabel(label);
  }
  
  void setValueFormat(String format)
  {
    barChart.setValueFormat(format);
  }
  
  void showCategoryAxis(boolean showAxis)
  {
    barChart.showCategoryAxis(showAxis);
  }
  
  void showValueAxis(boolean showAxis)
  {
    barChart.showValueAxis(showAxis);
  }
  
  void updateLayout()
  {
    barChart.updateLayout();
  }
}
