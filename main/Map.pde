// J.Nash added 28/03
// CK added getAirportName 08/04

class Airport {
  int x, y, radius, count;
  String name, state;
  color airportColor;
  
  Airport (int x, int y, int radius, String name, String state) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.state = state;
    this.name = name;
    airportColor = color(#C60E0E);
  }
  
  void draw() {
    fill(airportColor);
    ellipse(x, y+100, radius, radius); // Moved y down 100 to fit title above map
   
  }
  
  String selectAirport(String name) {
    return name;
  }

  public String getAirportName() {
    return name;
  }
 
 // if user selects a state, have only airports in that state displayed
 // text info at bottom regarding number of flights and whatnot
  
}
