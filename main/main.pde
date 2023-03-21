// A.Khan Added main 16/03
// CK Added Flights Framework 16/03
// A.Khan Merged Main and Flight Framework 19/03
// CK updated multiple screens for graph implementation 20/03

import org.gicentre.utils.stat.*;

PFont ttlFont;
PFont stdFont;
PImage logo;

Widget widget1, widget2, widget3, widget4, widget5, widget6, widget7;
Screen screen1, screen2, screen3, screen4, screen5, screen6, screen7;
int currentScreen;

Table table;
ArrayList<Flight> flights;

BarChart bc;

void settings()
{
  size(SCREENX, SCREENY);
}

void setup()
{
  // Load Font
  ttlFont = loadFont("MicrosoftYaHeiUI-Bold-48.vlw");
  stdFont = loadFont("ComicSansMS-30.vlw");
  logo = loadImage("BTS.png");
  
  // Create Widgets
  widget1 = new Widget(100, WIDGET1Y, 180, 40, "Bar Chart", color(242, 17, 17), stdFont, EVENT_BUTTON1);
  widget2 = new Widget(300, WIDGET1Y, 180, 40, "Line Graph", color(240, 155, 19), stdFont, EVENT_BUTTON2); 
  widget3 = new Widget(500, WIDGET1Y, 180, 40, "Heat Map", color(235, 219, 5), stdFont, EVENT_BUTTON3); 
  widget4 = new Widget(100, WIDGET2Y, 180, 40, "Pie Chart", color(0, 153, 0), stdFont, EVENT_BUTTON4);
  widget5 = new Widget(300, WIDGET2Y, 180, 40, "Table", color(19, 63, 240), stdFont, EVENT_BUTTON5);
  widget6 = new Widget(500, WIDGET2Y, 180, 40, "Placeholder", color(174, 33, 209), stdFont, EVENT_BUTTON6);
  widget7 = new Widget(10, 750, 180, 40, "Back", color(255, 0, 0), stdFont, EVENT_BUTTON7);
  
  // Create Screens
  screen1 = new Screen(color(51, 102, 153));
  screen2 = new Screen(color(242, 17, 17));
  screen3 = new Screen(color(240, 155, 19));
  screen4 = new Screen(color(235, 219, 5));
  screen5 = new Screen(color(0, 153, 0));
  screen6 = new Screen(color(19, 63, 240));
  screen7 = new Screen(color(174, 33, 209));
  
  // Add Widgets
  screen1.addWidget(widget1);
  screen1.addWidget(widget2);
  screen1.addWidget(widget3);
  screen1.addWidget(widget4);
  screen1.addWidget(widget5);
  screen1.addWidget(widget6);
  
  screen2.addWidget(widget7);
  screen3.addWidget(widget7);
  screen4.addWidget(widget7);
  screen5.addWidget(widget7);
  screen6.addWidget(widget7);
  screen7.addWidget(widget7);
  
  // Current Screen
  currentScreen = 1;
  
  // Load Data from file
void setup()
{
  table = loadTable("flights2k.csv", "header");
  flights = new ArrayList();
  loadData();
  printData(flights);
  
  // BarChart
  bc = new BarChart(this);
  float n1 = 0;
  float n2 = 0;
  float n3 = 0;
  float n4 = 0;
  float n5 = 0;
  
  for (Flight f : flights)
  {
    if (f.flightDate.equals("01/01/2022 00:00")) n1 = n1 + 1;
    else if (f.flightDate.equals("01/02/2022 00:00")) n2 = n2 + 1;
    else if (f.flightDate.equals("01/03/2022 00:00")) n3 = n3 + 1;
    else if (f.flightDate.equals("01/04/2022 00:00")) n4 = n4 + 1;
    else if (f.flightDate.equals("01/05/2022 00:00")) n5 = n5 + 1;
  }
  
  println(flights.get(1).flightDate);
  
  bc.setData(new float[] {n1, n2, n3, n4, n5});
  bc.setMinValue(0);
  bc.showValueAxis(true);
  bc.setBarLabels(new String[] {"01/01", "01/02", "01/03", "01/04", "01/05"});
  bc.showCategoryAxis(true);
}

void draw()
{
  background(100, 100, 100);
  
  if (currentScreen == 1)
  {
    screen1.draw();
    textFont(ttlFont);
    text("Flight Data Visualiser", SCREENX/2, 100);
    textAlign(CENTER);
    image(logo, 60, 150);
    textFont(stdFont);
    text("Select how you wish to visualise your data:", SCREENX/2, WIDGET1Y - 25);
  }
  else if (currentScreen == 2)
  {
    screen2.draw();
    bc.draw(100, 100, SCREENX - 200, SCREENY - 200);
  }
  else if (currentScreen == 3)
  {
    screen3.draw(); 
  }
  else if (currentScreen == 4)
  {
    screen4.draw(); 
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
}

void mousePressed()
{
  int event;
  if (currentScreen == 1)
  {
    event = screen1.getEvent(mouseX,mouseY);
    switch (event)
    {
      case EVENT_BUTTON1:
        currentScreen = 2;
        println("Bar Chart pressed");
        break;
      case EVENT_BUTTON2:
        currentScreen = 3;
        println("Line Graph was pressed");
        break;
      case EVENT_BUTTON3:
        currentScreen = 4;
        println("Heat Map was pressed");
        break;
      case EVENT_BUTTON4:
        currentScreen = 5;
        println("PieChart was pressed");
        break;
      case EVENT_BUTTON5:
        currentScreen = 6;
        println("Table was pressed");
        break;
      case EVENT_BUTTON6:
        currentScreen = 7;
        println("Placeholder was pressed");
        break;
    }
  }
  else if (currentScreen == 2)
  {
    event = screen2.getEvent(mouseX, mouseY);
    switch (event)
    {
      case EVENT_BUTTON7:
        currentScreen = 1;
        println("Backward was pressed");
        break;
    }
  }
  else
  {
    event = screen2.getEvent(mouseX, mouseY);
    switch (event)
    {
      case EVENT_BUTTON7:
        currentScreen = 1;
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
    // String originCityAbr = row.getString("ORIGIN_STATE_ABR");
    // int originWAC = row.getInt("ORIGIN_WAC");
    String dest = row.getString("DEST");
    String destCity = row.getString("DEST_CITY_NAME");
    // String destCityAbr = row.getString("DEST_STATE_ABR");
    // int destWAC = row.getInt("DEST_WAC");
    String schDepTime = row.getString("CRS_DEP_TIME");
    String depTime = row.getString("DEP_TIME");
    String schArrTime = row.getString("CRS_ARR_TIME");
    String arrTime = row.getString("ARR_TIME");
    int cancelled = row.getInt("CANCELLED");
    int diverted = row.getInt("DIVERTED");
    // int distance = row.getInt("DISTANCE");
    
    Flight flight = new Flight(flightDate, carrierCode, flightNum, origin, originCity, dest, destCity, schDepTime, depTime, schArrTime, arrTime, cancelled, diverted);
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
    // String originCityAbr = flight.originCityAbr;
    // int originWAC = flight.originWAC;
    String dest = flight.flightDate;
    String destCity = flight.flightDate;
    // String destCityAbr = flight.destCityAbr;
    // int destWAC = flight.destWAC;
    String schDepTime = flight.schDepTime;
    String depTime = flight.depTime;
    String schArrTime = flight.schArrTime;
    String arrTime = flight.arrTime;
    int cancelled = flight.cancelled;
    int diverted = flight.diverted;
    // int distance = flight.distance;

    println(flightDate + ", " + carrierCode + ", " + flightNum + ", " + origin + ", " + originCity + ", " + dest + ", " + destCity + ", " + schDepTime + ", " + depTime + ", " + schArrTime + ", " + arrTime + ", " + cancelled + ", " + diverted);
  }
}
