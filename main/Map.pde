// J.Nash added 28/03

/*
main {
  Airport LAX;
  Airport JFK;
  Airport ORD;
  
  LAX = new Airport (30, 300, 20);
  
}
*/


class Airport {
  int x, y, radius, count;
  String name;
  color airportColor;
  
  Airport (int x, int y, int radius, String name, int count) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.count = count;
    this.name = name;
    airportColor = color(#C60E0E);
  }
  
  void draw() {
    fill(airportColor);
    ellipse(x, y, radius, radius);
   
  }
  
  //void increaseSize (int count) {
  //  if (count >= 50) {
  //    radius += 5;
  //  }
  //}
  
 // ArrayList<String> listOfAirports (ArrayList<Flight> flights) {
 //   ArrayList<String> airportList = new ArrayList<String>();
 //   for (Flight flight : flights) {
 //     for (String name: airportList) {
 //     if (!flight.origin.equals(name)) {
 //       airportList.add(flight.origin);
 //     }  
 //   }
 // }
 //}
 
 // if user selects a state, have only airports in that state displayed
 // text info at bottom regarding number of flights and whatnot
  
}
