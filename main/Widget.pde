// CK Created Widget Class 16/03
// A.Khan Added getEvent method to Widget Class 19/03

class Widget
{
  int x;
  int y;
  int width;
  int height;
  String label;
  color widgetColor;
  color labelColor;
  color strokeColor;
  PFont widgetFont;
  int event;

  Widget (int x, int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event)
  {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.label = label;
    this.event = event; 
    this.widgetColor = widgetColor;
    this.widgetFont = widgetFont;
    labelColor = color(0);
  }
  
  void draw()
  {
    fill(widgetColor);
    if (mouseMoved()) stroke(255);
    else stroke(0);
    rect(x, y, width, height);
    fill(labelColor);
    textFont(widgetFont);
    text(label, x + 10, y + height - 10);
  }
  
  boolean mouseMoved()
  {
    if (getEvent(mouseX, mouseY) == event) return true;
    return false;
  }
  
  int getEvent(int mX, int mY)
  {
     if ((mX > x) && (mX < x + width) && (mY > y) && (mY < y + height)) return event;
     return EVENT_NULL;
  }
}
