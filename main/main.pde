Table table;

void setup()
{
  table = loadTable("flights2k.csv", "header");
  
  println("Number of Rows: " + table.getRowCount());
  
  for (TableRow row : table.rows()) {

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

    println(flightDate + ", " + carrierCode + ", " + flightNum + ", " + origin + ", " + originCity + ", " + originCityAbr + ", " + originWAC + ", " + dest + ", " + destCity + ", " + destCityAbr + ", " 
    + destWAC + ", " + schDepTime + ", " + depTime + ", " + schArrTime + ", " + arrTime + ", " + cancelled + ", " + diverted + ", " + distance + ", ");
  }
}

void draw()
{
  
}
