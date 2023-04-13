// A.Khan Added Graphs Class 22/03
// A.Khan Made Barchart class 29/03
// A.Khan Bug Fixes 31/03
// A.Khan Added Line Graph 01/04
// A.Khan Added Labels to Line Graph 05/04
// A.Khan Fixed bug where the bar would go off the screen 12/04
// A.Khan Added mouseover for graphs 12/04;
// A.Khan Adjusted labels 13/04;

class Barchart
{
  float[] dataSet;
  color[] colours;
  String title;
  String[] barLabels;
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
  
  void setTitle(String title)
  {
    this.title = title;
  }
  
  void barLabels(String[] barLabels)
  {
    this.barLabels = barLabels;
  }
  
  float getMaxValue()
  {
    float maxValue = 0;
    for (float f : dataSet) if (f > maxValue) maxValue = f;
    return maxValue;
  }
  
  void draw()
  {
    if (dataSet != null)
    {
      int nearestTenth = ((int) (maxValue / 10.0)) * 10;
      
      for (int i = 0; i < maxValue; i++)
      {
        if ((i * 10) >= maxValue)
        {
          nearestTenth = i * 10;
          break;
        }
      }
      
      int barWidth = (int) ((float) width / dataSet.length);
      int increment = 0;
      
      // Title
      if (title != null) text(title, 400, 40);
      
      // X and Y Axis
      line(xOrigin, yOrigin, xOrigin, yOrigin - height);
      line(xOrigin, yOrigin, xOrigin + width, yOrigin);
      
      // Y Axis Value Text
      text(nearestTenth, xOrigin - 45, yOrigin - height + 15);
      text((nearestTenth / 2) + (nearestTenth / 4), xOrigin - 45, yOrigin - ((float) height / 2) - ((float) height / 4) + 15);
      text(nearestTenth / 2, xOrigin - 45, yOrigin - ((float) height / 2) + 15);
      text(nearestTenth / 4, xOrigin - 45, yOrigin - ((float) height / 4) + 15);
      text(0, xOrigin - 25, yOrigin + 10);
      
      for (int i = 0; i < dataSet.length; i++)
      {
        float data = height * (dataSet[i] / nearestTenth);
        
        if (barLabels != null)
        {
          fill(0);
          if (barLabels[i] != null) text(barLabels[i], xOrigin + (i * barWidth + ((float) barWidth / 2)), yOrigin + 35);
        }
        
        fill(colours[i]);
        rect(xOrigin + increment, yOrigin, barWidth, -data);
        increment = increment + barWidth;
        

      }
      
      increment = 0;
      
      textAlign(LEFT);
      
      for (int i = 0; i < dataSet.length; i++)
      {
        float data = height * (dataSet[i] / nearestTenth);
        
        if ((mouseX > xOrigin + increment) && (mouseX < xOrigin + increment + barWidth) && (mouseY > yOrigin - data) && (mouseY < yOrigin))
        {
          fill(0);
          noStroke();
          rect(mouseX, mouseY, 115, -43);
          fill(255);
          textFont(msoFont);
          text("Value:    " + dataSet[i], mouseX + 10, mouseY - 25);
          text("Label:    " + barLabels[i], mouseX + 10, mouseY - 10);
        }
        
        increment = increment + barWidth;
      }
      
      textAlign(CENTER);
    }
  }
}

class Linegraph
{
  float[] dataSet;
  String title;
  String[] lineLabels;
  String xAxisLabel;
  String yAxisLabel;
  int xOrigin;
  int yOrigin;
  int width;
  int height;
  float maxValue;
  
  Linegraph(float[] dataSet, int xOrigin, int yOrigin, int width, int height)
  {
    this.dataSet = dataSet;
    this.xOrigin = xOrigin;
    this.yOrigin = yOrigin;
    this.width = width;
    this.height = height;
    maxValue = getMaxValue();
  }
  
  void setData(float[] dataSet)
  {
    this.dataSet = dataSet;
    maxValue = getMaxValue();
  }
  
  void setTitle(String title)
  {
    this.title = title;
  }
  
  void lineLabels(String[] lineLabels)
  {
    this.lineLabels = lineLabels;
  }
  
  void setXAxisLabel(String xAxisLabel)
  {
    this.xAxisLabel = xAxisLabel;
  }
  
  void setYAxisLabel(String yAxisLabel)
  {
    this.yAxisLabel = yAxisLabel;
  }
  
  float getMaxValue()
  {
    float maxValue = 0;
    for (float f : dataSet) if (f > maxValue) maxValue = f;
    return maxValue;
  }
  
  void draw()
  {
    if (dataSet != null)
    {
      int nearestTenth = ((int) (maxValue / 10.0)) * 10;
      
      for (int i = 0; i < maxValue; i++)
      {
        if ((i * 10) >= maxValue)
        {
          nearestTenth = i * 10;
          break;
        }
      }
      
      int segmentWidth = (int) ((float) width / dataSet.length);
      
      // Title
      if (title != null) text(title, 400, 40);
      
      // X and Y Axis
      if (xAxisLabel != null) text(xAxisLabel, 700, 750);
      if (yAxisLabel != null) text(yAxisLabel, 50, 50);
      line(xOrigin, yOrigin, xOrigin, yOrigin - height);
      line(xOrigin, yOrigin, xOrigin + width, yOrigin);
      circle(xOrigin, yOrigin, 10);
      
      // Y Axis Value Text
      text(nearestTenth, xOrigin - 45, yOrigin - height + 15);
      text((nearestTenth / 2) + (nearestTenth / 4), xOrigin - 45, yOrigin - ((float) height / 2) - ((float) height / 4) + 15);
      text(nearestTenth / 2, xOrigin - 45, yOrigin - ((float) height / 2) + 15);
      text(nearestTenth / 4, xOrigin - 45, yOrigin - ((float) height / 4) + 15);
      text(0, xOrigin - 25, yOrigin + 10);
      
      float lineX = xOrigin;
      float lineY = yOrigin;
      
      for (int i = 0; i < dataSet.length; i++)
      {
        float data = height * (dataSet[i] / nearestTenth);
        data = yOrigin - data;
        line(lineX, lineY, lineX + segmentWidth, data);
        circle(lineX + segmentWidth, data, 10);
        lineX = lineX + segmentWidth;
        lineY = data;
        
        if (lineLabels != null)
        {
          fill(0);
          if (lineLabels[i] != null) text(lineLabels[i], lineX, yOrigin + 35);
        }
      }
      
      textAlign(LEFT);
      
      lineX = xOrigin;
      lineY = yOrigin;
      
      for (int i = 0; i < dataSet.length; i++)
      {
        float data = height * (dataSet[i] / nearestTenth);
        data = yOrigin - data;
        lineX = lineX + segmentWidth;
        lineY = data;
        
        if ((mouseX > lineX - 10) && (mouseX < lineX + 10) && (mouseY > lineY - 10) && (mouseY < lineY + 10))
        {
          fill(0);
          noStroke();
          rect(mouseX, mouseY, 115, -43);
          fill(255);
          textFont(msoFont);
          text("Value:    " + dataSet[i], mouseX + 10, mouseY - 25);
          text("Label:    " + lineLabels[i], mouseX + 10, mouseY - 10);
        }
      }
      
      textAlign(CENTER);
    }
  }
}
