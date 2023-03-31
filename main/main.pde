// A.Khan Added main 16/03
// CK Added Flights Framework 16/03
// A.Khan Merged Main and Flight Framework 19/03
// CK updated multiple screens for graph implementation 20/03
// CK improved Framework to planned architecture 22/03

PFont ttlFont;
PFont stdFont;
PFont inpFont;
PImage logo;

Widget widget0, widget1, widget2, widget3, widget4, widget5, widget6, widget7, widget8;
Screen screen1, screen2, screen3, screen4, screen5, screen6, screen7, screen8, screen9;
int currentScreen;

Table table;
ArrayList<Flight> flights;

Barchart b;

String inputText = "", startDate = "", endDate = "", depAP = "", arrAP = "", maxDis = "", minDis = "";
Boolean cancellations = false, diversions = false;
int boxXpos = 350, boxYpos = 660;
color screenColour = color(51, 102, 153); // Dark blue
color boxColour = color(65, 105, 225); // Light blue
//ArrayList<Box> checkbox;

void settings()
{
  size(SCREENX, SCREENY);
}

void setup()
{
  // Load Font
  ttlFont = loadFont("MicrosoftYaHeiUI-Bold-48.vlw");
  stdFont = loadFont("ComicSansMS-30.vlw");
  inpFont = loadFont("Arial-BoldMT-24.vlw");
  logo = loadImage("BTS.png");
  
  // Create Widgets
  widget0 = new Widget(WIDGET1Y/2, WIDGET1Y+75, 180, 40, "Start", color(242, 17, 17), stdFont, EVENT_BUTTON0);
  widget1 = new Widget(100, WIDGET1Y, 180, 40, "Bar Chart", color(242, 17, 17), stdFont, EVENT_BUTTON1);
  widget2 = new Widget(300, WIDGET1Y, 180, 40, "Line Graph", color(240, 155, 19), stdFont, EVENT_BUTTON2); 
  widget3 = new Widget(500, WIDGET1Y, 180, 40, "Heat Map", color(235, 219, 5), stdFont, EVENT_BUTTON3); 
  widget4 = new Widget(100, WIDGET2Y, 180, 40, "Pie Chart", color(0, 153, 0), stdFont, EVENT_BUTTON4);
  widget5 = new Widget(300, WIDGET2Y, 180, 40, "Table", color(19, 63, 240), stdFont, EVENT_BUTTON5);
  widget6 = new Widget(500, WIDGET2Y, 180, 40, "Placeholder", color(174, 33, 209), stdFont, EVENT_BUTTON6);
  widget7 = new Widget(10, 750, 180, 40, "Back", color(255, 0, 0), stdFont, EVENT_BUTTON7);
  widget8 = new Widget(600, 750, 180, 40, "Next", color(0, 255, 0), stdFont, EVENT_BUTTON8);
  
  // Create Screens
  screen1 = new Screen(screenColour);
  screen2 = new Screen(screenColour);
  screen3 = new Screen(screenColour);
  screen4 = new Screen(color(242, 17, 17));
  screen5 = new Screen(color(240, 155, 19));
  screen6 = new Screen(color(235, 219, 5));
  screen7 = new Screen(color(0, 153, 0));
  screen8 = new Screen(color(19, 63, 240));
  screen9 = new Screen(color(174, 33, 209));
  
  // Add Widgets
  screen1.addWidget(widget0);
  screen2.addWidget(widget8);
  screen3.addWidget(widget1);
  screen3.addWidget(widget2);
  screen3.addWidget(widget3);
  screen3.addWidget(widget4);
  screen3.addWidget(widget5);
  screen3.addWidget(widget6);
  screen3.addWidget(widget7);
  
  screen4.addWidget(widget7);
  screen5.addWidget(widget7);
  screen6.addWidget(widget7);
  screen7.addWidget(widget7);
  screen8.addWidget(widget7);
  screen9.addWidget(widget7);
  
  // Current Screen
  currentScreen = 1;
  
  // Load Data from file
  table = loadTable("flights2k.csv", "header");
  flights = new ArrayList();
  loadData();
  printData(flights);
  
  // BarChart
  
     
     // Checkbox
     /*
     checkbox = new ArrayList<Box>();
     for(int i = 0; i < 5; i++){
    checkbox.add(new Box(400, 625+((i+1)*50), 50, 40, nf(i+1,0,0), color(0,255,0),
          color(255, 0, 0), stdFont));
  }
  */
}

void draw(){
  background(100, 100, 100);
  
  if (currentScreen == 1)
  {
    screen1.draw();
    textFont(ttlFont);
    text("Flight Data Visualiser", SCREENX/2, 100);
    textAlign(CENTER);
    image(logo, 60, 150);
    textFont(stdFont);
    text("Press Start to continue:", SCREENX/2, WIDGET1Y + 50);
  }
  else if (currentScreen == 2)
  {
    screen2.draw(); 
    textAlign(CENTER);
    textFont(ttlFont);
    text("Data Parameters", SCREENX/2, 100);
    textFont(stdFont);
    text("Date Range:", 100, 150);
    text("Departure:", 100, 300);
    text("Arrival:", 100, 400);
    text("Distance", 100, 500);
    text("Include?", 100, 650);
    textFont(inpFont);
    text("Start", 300, 200);
    text("End", 300, 250);
    text("Max", 300, 550);
    text("Min", 300, 600);
    text("Cancellations", 250, 700);
    text("Diversions",250, 750);
    
    //Text Boxes
    
    //Start Date
    fill(boxColour);
    rect(350, 170, 200, 40);
    fill(0);
    text(startDate, 450, 200);
    
    //End Date
    fill(boxColour);
    rect(350, 225, 200, 40);
    fill(0);
    text(endDate, 450, 255);
    
    //Departure Airport Code
    fill(boxColour);
    rect(350, 295, 200, 40);
    fill(0);
    text(depAP, 450, 325);
    
    //Arrival Airport Code
    fill(boxColour);
    rect(350, 395, 200, 40);
    fill(0);
    text(arrAP, 450, 425);
    
    //Max Distance
    fill(boxColour);
    rect(350, 520, 200, 40);
    fill(0);
    text(maxDis, 450, 550);
    
    //Min Distance
    fill(boxColour);
    rect(350, 575, 200, 40);
    fill(0);
    text(minDis, 450, 600);
      
     // Checkbox
     
    fill(boxColour);
    rect(boxXpos, boxYpos, 50, 50);
  
    if (cancellations) {
      fill(0);
      //textFont(inpFont);
      textSize(40);
      text("X", boxXpos+25, boxYpos+40);
    }
    
    fill(boxColour);
    rect(boxXpos, boxYpos+60, 50, 50);
  
    if (diversions) {
      fill(0);
      //textFont(inpFont);
      textSize(40);
      text("X", boxXpos+25, boxYpos+100);
    }
    /*
    for(int i = 0; i < 2; i++){
    checkbox.get(i).draw();
    }
    */

  }
  else if (currentScreen == 3)
  {
    screen3.draw();
    textAlign(CENTER);
    textFont(stdFont);
    text("Select how you wish to visualise your data:", SCREENX/2, WIDGET1Y - 25);
    ArrayList<Flight> newFlights = flights;
    
    if (startDate != "" && endDate != "")
    {
      newFlights = dateRange(newFlights, startDate, endDate);
    }
    
    if (depAP != "")
    {
      newFlights = departure(newFlights, depAP);
    }
    
    if (arrAP != "")
    {
      newFlights = arrival(newFlights, arrAP);
    }
    
    if (minDis != "" && maxDis != "")
    {
      int min = Integer.parseInt(minDis);
      int max = Integer.parseInt(maxDis);
      newFlights = distanceRange(newFlights, min, max);
    }
    
    float[] fDates = countFlightDates(newFlights, startDate, endDate);
    b = new Barchart(fDates, 100, 675, 600, 600);
    b.setTitle("Number of Flights in a day");
    b.barLabels(getDates(startDate, endDate));
  }
  else if (currentScreen == 4)
  {
    screen4.draw();
    b.draw();
  }
  else if (currentScreen == 5)
  {
    screen5.draw(); 
  }
  else if (currentScreen == 6)
  {
    screen6.draw(); 
  }
  else if (currentScreen == 7)
  {
    screen7.draw(); 
  }
  else if (currentScreen == 8)
  {
    screen8.draw(); 
  }
  else if (currentScreen == 9)
  {
    screen9.draw(); 
  }
}

void mousePressed()
{
  int event;
  if (currentScreen == 1){
    event = screen1.getEvent(mouseX,mouseY);
     switch (event)
    {
      case EVENT_BUTTON0:
        currentScreen = 2;
        println("Start was pressed");
        break;
    }
   }
  else if (currentScreen == 2){
    event = screen2.getEvent(mouseX,mouseY);
     switch (event)
    {
      case EVENT_BUTTON8:
        currentScreen = 3;
        println("Next was pressed");
        break;
    }
    /*
    for(int i = 0; i < 2; i++){
      int chEvent = checkbox.get(i).getEvent(mouseX,mouseY);
      if(chEvent != EVENT_NULL){
        checkbox.get(chEvent-1).clicked = true;
        println("One clicked");
      }
    }
  */
    if (mouseX > boxXpos && mouseX < boxXpos+50 && mouseY > boxYpos && mouseY <boxYpos+50) {
      cancellations = !cancellations;
      if(cancellations){
         println("Cancellations included");
      }
      else{
        println("Cancellations excluded");
      }
    }
    else if (mouseX > boxXpos && mouseX < boxXpos+50 && mouseY > boxYpos+60 && mouseY <boxYpos+110) {
      diversions = !diversions;
      if(diversions){
         println("Diversions included");
      }
      else{
        println("Diversions excluded");
      }
    }
   }
   
   
  else if (currentScreen == 3)
  {
    event = screen3.getEvent(mouseX,mouseY);
    switch (event)
    {
      case EVENT_BUTTON1:
        currentScreen = 4;
        println("Bar Chart pressed");
        break;
      case EVENT_BUTTON2:
        currentScreen = 5;
        println("Line Graph was pressed");
        break;
      case EVENT_BUTTON3:
        currentScreen = 6;
        println("Heat Map was pressed");
        break;
      case EVENT_BUTTON4:
        currentScreen = 7;
        println("PieChart was pressed");
        break;
      case EVENT_BUTTON5:
        currentScreen = 8;
        println("Table was pressed");
        break;
      case EVENT_BUTTON6:
        currentScreen = 9;
        println("Placeholder was pressed");
        break;
      case EVENT_BUTTON7:
        currentScreen = 2;
        println("Backward was pressed");
        break;
    }
  }
  else if (currentScreen == 4)
  {
    event = screen4.getEvent(mouseX, mouseY);
    switch (event)
    {
      case EVENT_BUTTON7:
        currentScreen = 3;
        println("Backward was pressed");
        break;
    }
  }
  else
  {
    event = screen5.getEvent(mouseX, mouseY);
    switch (event)
    {
      case EVENT_BUTTON7:
        currentScreen = 3;
        println("Backward was pressed");
        break;
    }
  }
}

void loadData()
{
  for (TableRow row : table.rows())
  {
    String flightDate = row.getString("FL_DATE");
    String carrierCode = row.getString("MKT_CARRIER");
    int flightNum = row.getInt("MKT_CARRIER_FL_NUM");
    String origin = row.getString("ORIGIN");
    String originCity = row.getString("ORIGIN_CITY_NAME");
    String originCityAbr = row.getString("ORIGIN_STATE_ABR");
    int originWAC = row.getInt("ORIGIN_WAC");
    String dest = row.getString("DEST");
    String destCity = row.getString("DEST_CITY_NAME");
    String destCityAbr = row.getString("DEST_STATE_ABR");
    int destWAC = row.getInt("DEST_WAC");
    String schDepTime = row.getString("CRS_DEP_TIME");
    String depTime = row.getString("DEP_TIME");
    String schArrTime = row.getString("CRS_ARR_TIME");
    String arrTime = row.getString("ARR_TIME");
    int cancelled = row.getInt("CANCELLED");
    int diverted = row.getInt("DIVERTED");
    int distance = row.getInt("DISTANCE");
    
    Flight flight = new Flight(flightDate, carrierCode, flightNum, 
                        origin, originCity, originCityAbr, originWAC, 
                        dest, destCity, destCityAbr, destWAC, 
                        schDepTime, depTime, schArrTime, arrTime, cancelled, diverted, distance);
    flights.add(flight);
  }
}

void printData(ArrayList<Flight> flights)
{
  for (Flight flight : flights)
  {
    String flightDate = flight.flightDate;
    String carrierCode = flight.carrierCode;
    int flightNum = flight.flightNum;
    String origin = flight.origin;
    String originCity = flight.originCity;
    String originCityAbr = flight.originCityAbr;
    int originWAC = flight.originWAC;
    String dest = flight.dest;
    String destCity = flight.destCity;
    String destCityAbr = flight.destCityAbr;
    int destWAC = flight.destWAC;
    String schDepTime = flight.schDepTime;
    String depTime = flight.depTime;
    String schArrTime = flight.schArrTime;
    String arrTime = flight.arrTime;
    int cancelled = flight.cancelled;
    int diverted = flight.diverted;
    int distance = flight.distance;

    println(flightDate + ", " + carrierCode + ", " + flightNum + ", " 
            + origin + ", " + originCity + ", " + originCityAbr + ", " + originWAC + ", " 
            + dest + ", " + destCity + ", " + destCityAbr + ", " + destWAC + ", " 
            + schDepTime + ", " + depTime + ", " + schArrTime + ", " + arrTime + ", " + cancelled + ", " + diverted + ", " + distance);
  }
}
/*
void mouseMoved(){
  //Checkbox border highlight
  int event;
  for(int i = 0; i < 5; i++){
    event = checkbox.get(i).getEvent(mouseX,mouseY);
    checkbox.get(i).strokeColor = (event == EVENT_NULL) ? checkbox.get(i).labelColor : color(255);
  }
}
*/

void keyPressed() {
  // Input box text
  if(mouseY >= 170 && mouseY <= 170+40){
      if (key >= '/' && key <= '9') {
        startDate += key;
      }
      else if (keyCode == BACKSPACE) {
          if (startDate.length() > 0) {
              startDate = startDate.substring(0, startDate.length() - 1);
          }
      }  
  }
  else if(mouseY >= 225 && mouseY <= 225+40){
      if (key >= '/' && key <= '9') {
        endDate += key;
      }
      else if (keyCode == BACKSPACE) {
          if (endDate.length() > 0) {
              endDate = endDate.substring(0, endDate.length() - 1);
          }
      }  
  }
  else if(mouseY >= 295 && mouseY <= 295+40){
      if (key >= 'a' && key <= 'z' || key >= 'A' && key <= 'Z') {
        depAP += key;
      }
      else if (keyCode == BACKSPACE) {
          if (depAP.length() > 0) {
              depAP = depAP.substring(0, depAP.length() - 1);
          }
      }  
  }
    else if(mouseY >= 395 && mouseY <= 395+40){
      if (key >= 'a' && key <= 'z' || key >= 'A' && key <= 'Z') {
        arrAP += key;
      }
      else if (keyCode == BACKSPACE) {
          if (arrAP.length() > 0) {
              arrAP = arrAP.substring(0, arrAP.length() - 1);
          }
      }  
  }
  else if(mouseY >= 520 && mouseY <= 520+40){
      if (key >= '0' && key <= '9') {
        maxDis += key;
      }
      else if (keyCode == BACKSPACE) {
          if (maxDis.length() > 0) {
              maxDis = maxDis.substring(0, maxDis.length() - 1);
          }
      }  
  }
  else if(mouseY >= 575 && mouseY <= 575+40){
      if (key >= '0' && key <= '9') {
        minDis += key;
      }
      else if (keyCode == BACKSPACE) {
          if (minDis.length() > 0) {
              minDis = minDis.substring(0, minDis.length() - 1);
          }
      }  
  }

}
