// A.Khan Added main 16/03
// CK Added Flights Framework 16/03
// A.Khan Merged Main and Flight Framework 19/03

Table table;
ArrayList<Flight> flights;

PFont ttlFont;
PFont stdFont;

Widget widget1, widget2, widget3, widget4, widget5, widget6;
Screen screen1, screen2;
int currentScreen;

void settings()
{
  size(SCREENX, SCREENY);
}

void setup()
{
  ttlFont = loadFont("MicrosoftYaHeiUI-Bold-48.vlw");
  stdFont = loadFont("ComicSansMS-30.vlw");
  
  widget1 = new Widget(100, 600, 180, 40, "Bar Chart", color(0,255,255), stdFont, EVENT_BUTTON1);
  widget2 = new Widget(300, 600, 180, 40, "Line Graph", color(0, 102, 102), stdFont, EVENT_BUTTON2); 
  widget3 = new Widget(500, 600, 180, 40, "Heat Map", color(0, 102, 255), stdFont, EVENT_BUTTON3); 
  widget4 = new Widget(100, 650, 180, 40, "PieChart", color(0, 153, 0), stdFont, EVENT_BUTTON4);
  widget5 = new Widget(300, 650, 180, 40, "X", color(0, 153, 0), stdFont, EVENT_BUTTON5);
  widget6 = new Widget(500, 650, 180, 40, "X", color(0, 153, 0), stdFont, EVENT_BUTTON6);
  
  screen1 = new Screen(color(51, 102, 153));
  screen2 = new Screen(color(102, 255, 102));
  
  screen1.addWidget(widget1);
  screen1.addWidget(widget2);
  screen1.addWidget(widget3);
  screen1.addWidget(widget4);
  screen1.addWidget(widget5);
  screen1.addWidget(widget6);
  
  screen2.addWidget(widget1);
  screen2.addWidget(widget2);
  screen2.addWidget(widget3);
  screen2.addWidget(widget4);
  screen2.addWidget(widget5);
  screen2.addWidget(widget6);
  
  currentScreen = 1;
  
  table = loadTable("flights2k.csv", "header");
  flights = new ArrayList();
  loadData();
  printData(flights);
}

void draw()
{
  background(100, 100, 100);
  
  if (currentScreen == 1)
  {
    screen1.draw();
    textFont(ttlFont);
    text("Flight Data Visualiser", SCREENX/2, 200);
    textAlign(CENTER);
  }
  else if (currentScreen == 2)
  {
    screen2.draw();
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
  else if (currentScreen == 2)
  {
    event = screen2.getEvent(mouseX, mouseY);
    switch (event)
    {
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

void mouseMoved()
{
  int event;
  
  if (currentScreen == 1)
  {
    event = screen1.getEvent(mouseX, mouseY);
    switch (event)
    {
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
  else
  {
    event = screen2.getEvent(mouseX, mouseY);
    switch (event)
    {
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
