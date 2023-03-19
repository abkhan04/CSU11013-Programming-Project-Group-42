// CK Created Screen Class 16/03

class Screen
{
  ArrayList<Widget> widgetList;
  color bgColor;
  
  Screen(color bgColor)
  {
    widgetList = new ArrayList();
    this.bgColor = bgColor;
  }
  
  void draw()
  {
    background(bgColor);
    
    for (int i = 0; i < widgetList.size(); i++)
    {
      Widget aWidget = (Widget) widgetList.get(i);
      aWidget.draw();
    }
  }
  
  void addWidget(Widget widget)
  {
    widgetList.add(widget);
  }
  
  int getEvent(int mX, int mY)
  {
    for (int i = 0; i < widgetList.size(); i++)
    {
      int x = widgetList.get(i).x;
      int y = widgetList.get(i).y;
      if ((mX > x) && (mX < x + width) && (mY > y) && (mY < y + height)) return widgetList.get(i).event;
    }
    
    return EVENT_NULL;
  }
}
