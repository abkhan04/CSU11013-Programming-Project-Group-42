class Screen{
  color background;
  ArrayList<Widget> widgets;
  int event;
  
  Screen(color background, ArrayList<Widget> widgets){
    this.background = background;
    this.widgets = widgets;
  }
  
  void addWidget(Widget widget1, Widget widget2, Widget widget3, Widget widget4, Widget widget5, Widget widget6){
    widgets.add(widget1);
    widgets.add(widget2);
    widgets.add(widget3);
    widgets.add(widget4);
    widgets.add(widget5);
    widgets.add(widget6);
  }
  
  int getEvent(int x, int y){
    for(int i = 0; i < widgets.size(); i++){
      if(x > widgets.get(i).x && x < widgets.get(i).x + widgets.get(i).width 
        && y > widgets.get(i).y && y < widgets.get(i).y + widgets.get(i).height){
        return widgets.get(i).event;
      }
    }
    return EVENT_NULL;
  }
  
  void draw(){
    background(background);
    for(int i = 0; i < widgets.size(); i++){
      widgets.get(i).draw();
    }
  }
}
