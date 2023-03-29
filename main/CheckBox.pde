//CK added CheckBoxes 22/03

class Box{
  int x, y, wide, tall;
  String label; int event;
  color widgetColor1, widgetColor2, labelColor, strokeColor;
  PFont widgetFont;
  boolean clicked;

  Box(int x,int y, int wide, int tall, String label,
    color unclickedColor, color clickedColor, PFont widgetFont){
    this.x = x; this.y = y;
    this.wide = wide; this.tall = tall;
    this.label = label;
    this.widgetColor1 = unclickedColor; this.widgetColor2 = clickedColor;
    this.widgetFont = widgetFont;
    event = int(label);
    clicked = false;
  }
  
  void draw(){
    fill(clicked ? widgetColor2 : widgetColor1);
    stroke(strokeColor,150);
    rect(x,y,wide,tall);
    fill(labelColor);
    textFont(widgetFont);
    text(label, x+10, y+tall-10);
  }
  
  int getEvent(int mX, int mY){
    if(mX > x && mX < x + wide && mY > y && mY < y + tall){
      return event;
    }
    return EVENT_NULL;
  }
}
