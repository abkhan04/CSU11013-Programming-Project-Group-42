class Flight
{
  String flightDate;
  String carrierCode;
  int flightNum;
  String origin;
  String originCity;
  // String originCityAbr;
  // int originWAC;
  String dest;
  String destCity;
  // String destCityAbr;
  // int destWAC;
  String schDepTime;
  String depTime;
  String schArrTime;
  String arrTime;
  int cancelled;
  int diverted;
  // int distance;
  
  Flight (String flightDate, String carrierCode, int flightNum, String origin, String originCity, String dest, String destCity, String schDepTime, String depTime, String schArrTime, String arrTime, int cancelled, int diverted)
  {
    this.flightDate = flightDate;
    this.carrierCode = carrierCode;
    this.flightNum = flightNum;
    this.origin = origin;
    this.originCity = originCity;
    this.dest = dest;
    this.destCity = destCity;
    this.schDepTime = schDepTime;
    this.depTime = depTime;
    this.schArrTime = schArrTime;
    this.arrTime = arrTime;
    this.cancelled = cancelled;
    this.diverted = diverted;
  }
}
