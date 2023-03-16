class Widget{
  int x, y, width, height;
  String label; int event;
  color widgetColor, labelColor, strokeColor;
  PFont widgetFont;

  Widget(int x,int y, int width, int height, String label,
    color widgetColor, PFont widgetFont, int event){
    this.x = x; this.y = y;
    this.width = width; this.height = height;
    this.label = label; this.event = event; 
    this.widgetColor = widgetColor; this.widgetFont = widgetFont;
    switch(label){
      case "red":
        labelColor = color(200,50,50);
        break;
      case "green":
        labelColor = color(0,200,100);
        break;
      case "blue":
        labelColor = color(0,100,200);
        break;
    }
  }
  
  void draw(){
    fill(widgetColor);
    stroke(strokeColor,150);
    rect(x,y,width,height);
    fill(labelColor);
    textFont(widgetFont);
    text(label, x+90, y+height-10);
  }
}
