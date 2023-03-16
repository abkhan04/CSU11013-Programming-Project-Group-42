// CK added Flights Framework 16/03

final int EVENT_BUTTON1=1;
final int EVENT_BUTTON2=2;
final int EVENT_BUTTON3=3;
final int EVENT_BUTTON4=4;
final int EVENT_BUTTON5=5;
final int EVENT_BUTTON6=6;
final int EVENT_NULL=0;

final int WIDGETX = 100;
final int WIDGET1Y = 600;
final int WIDGET2Y = 600;
final int SIZE = 800;

PFont ttlFont,stdFont;
Widget widget1, widget2, widget3, widget4, widget5, widget6;
Screen screen1, screen2;
int currentScreen;

void setup(){
  ttlFont = loadFont("MicrosoftYaHeiUI-Bold-48.vlw");
  stdFont = loadFont("ComicSansMS-30.vlw");
  textFont(stdFont);
  widget1 = new Widget(100, WIDGET1Y, 180, 40, "Bar Chart", color(0,255,255),
          stdFont, EVENT_BUTTON1);
  widget2 = new Widget(300, WIDGET1Y, 180, 40, "Line Graph", color(0, 102, 102),
          stdFont, EVENT_BUTTON2); 
  widget3 = new Widget(500, WIDGET2Y, 180, 40, "Heat Map", color(0, 102, 255),
          stdFont, EVENT_BUTTON3); 
  widget4 = new Widget(100, WIDGET2Y+50, 180, 40, "PieChart", color(0, 153, 0),
          stdFont, EVENT_BUTTON4);
  widget5 = new Widget(300, WIDGET2Y+50, 180, 40, "X", color(0, 153, 0),
          stdFont, EVENT_BUTTON5);
  widget6 = new Widget(500, WIDGET2Y+50, 180, 40, "X", color(0, 153, 0),
          stdFont, EVENT_BUTTON6);
  screen1 = new Screen(color(51, 102, 153), new ArrayList<Widget>());
  screen2 = new Screen(color(102, 255, 102), new ArrayList<Widget>());
  screen1.addWidget(widget1, widget2, widget3,widget4,widget5,widget6);
  screen2.addWidget(widget1,widget2, widget3, widget4,widget5,widget6);
  currentScreen = 1;
  size(800,800);
}


void mousePressed(){
  int event;
  if(currentScreen == 1){
    event = screen1.getEvent(mouseX,mouseY);
    switch(event){
      case EVENT_BUTTON1:
        currentScreen = 2;
        println("Bar Chart pressed");
        break;
      case EVENT_BUTTON2:
        currentScreen = 2;
        println("Line Graph was pressed");
        break;
      case EVENT_BUTTON3:
        currentScreen = 2;
        println("Heat Map was pressed");
        break;
      case EVENT_BUTTON4:
        currentScreen = 2;
        println("PieChart was pressed");
        break;
      case EVENT_BUTTON5:
        currentScreen = 2;
        println("Table was pressed");
        break;
      case EVENT_BUTTON6:
        currentScreen = 2;
        println("X was pressed");
        break;
    }
  }
   if(currentScreen == 2){
    event = screen2.getEvent(mouseX,mouseY);
    switch(event){
      case EVENT_BUTTON2:
        println("Button 2 was pressed");
        break;
      case EVENT_BUTTON4:
        currentScreen = 1;
        println("Backward was pressed");
        break;
    }
  }
  else {
    event = screen2.getEvent(mouseX,mouseY);
    switch(event){
      case EVENT_BUTTON2:
        println("Button 2 was pressed");
        break;
      case EVENT_BUTTON4:
        currentScreen = 1;
        println("Backward was pressed");
        break;
    }
  }
}

void mouseMoved(){
  int event;
  if(currentScreen == 1){
    event = screen1.getEvent(mouseX,mouseY);
    switch(event){
      case EVENT_BUTTON1:
        widget1.strokeColor = color(255);
        break;
      case EVENT_BUTTON2:
        widget2.strokeColor = color(255);
        break;
      case EVENT_BUTTON3:
        widget3.strokeColor = color(255);
        break;
      case EVENT_BUTTON4:
        widget4.strokeColor = color(255);
        break;
      case EVENT_BUTTON5:
        widget5.strokeColor = color(255);
        break;
      case EVENT_BUTTON6:
        widget6.strokeColor = color(255);
        break;
      case EVENT_NULL:
        widget1.strokeColor = color(0);
        widget2.strokeColor = color(0);
        widget3.strokeColor = color(0);
        widget4.strokeColor = color(0);
        widget5.strokeColor = color(0);
        widget6.strokeColor = color(0);
        break;
    }
  }
  else{
    event = screen2.getEvent(mouseX,mouseY);
    switch(event){
      case EVENT_BUTTON2:
        widget2.strokeColor = color(255);
        break;
      case EVENT_BUTTON4:
        widget4.strokeColor = color(255);
        break;
      case EVENT_NULL:
        widget2.strokeColor = color(0);
        widget4.strokeColor = color(0);
        break;
    }
  }    
}


void draw(){
  background(100,100,100);
  
  if(currentScreen == 1){
    screen1.draw();
    textFont(ttlFont);
    text("Flight Data Visualiser",SIZE/2, 200);
    textAlign(CENTER);
  }
  else{
    screen2.draw();
  }
}
