// A.Khan Added Flight Class 16/03
// CK added getName 08/04

class Flight
{
  String flightDate;
  String carrierCode;
  int flightNum;
  String origin;
  String originCity;
  String originCityAbr;
  int originWAC;
  String dest;
  String destCity;
  String destCityAbr;
  int destWAC;
  String schDepTime;
  String depTime;
  String schArrTime;
  String arrTime;
  int cancelled;
  int diverted;
  int distance;
  
  Flight (String flightDate, String carrierCode, int flightNum, 
          String origin, String originCity, String originCityAbr, int originWAC, 
          String dest, String destCity, String destCityAbr, int destWAC, 
          String schDepTime, String depTime, String schArrTime, String arrTime, int cancelled, int diverted, int distance)
  {
    this.flightDate = flightDate.split(" ")[0];
    this.carrierCode = carrierCode;
    this.flightNum = flightNum;
    this.origin = origin;
    this.originCity = originCity;
    this.originCityAbr = originCityAbr;
    this.originWAC = originWAC;
    this.dest = dest;
    this.destCity = destCity;
    this.destCityAbr = destCityAbr;
    this.destWAC = destWAC;
    this.schDepTime = schDepTime;
    this.depTime = depTime;
    this.schArrTime = schArrTime;
    this.arrTime = arrTime;
    this.cancelled = cancelled;
    this.diverted = diverted;
    this.distance = distance;
  }
  public String getName() {
    return origin;
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
