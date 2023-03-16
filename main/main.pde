// A.Khan Added main 16/03

Table table;
ArrayList<Flight> flights;

void setup()
{
  table = loadTable("flights2k.csv", "header");
  flights = new ArrayList();
  loadData();
  printData(flights);
}

void draw()
{
  
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
