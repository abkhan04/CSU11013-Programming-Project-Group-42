// A.Khan Added Flight Class 16/03

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
}
