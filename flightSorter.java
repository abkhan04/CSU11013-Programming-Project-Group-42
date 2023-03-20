// added by Julia Nash 20/3

import java.util.*;
public class flightSorter implements Comparator<Flight> {
  public enum Order {FLIGHTDATE, NUMBER, START, END, CANCELLED, DIVERTED}
  
  private Order sortingBy = Order.FLIGHTDATE;
  
  @Override
 public int compare (Flight flight1, Flight flight2) {
    switch(sortingBy) {
      case FLIGHTDATE:
        return flight1.flightDate.compareTo(flight2.flightDate);
        
      //case NUMBER:
      //  return flight1.flightNum.compareTo(flight2.flightNum);
      case START:
        return flight1.origin.compareTo(flight2.origin);
      case END:
        return flight1.dest.compareTo(flight2.dest);
      //case CANCELLED:
      //  return flight1.cancelled.compareTo(flight2.cancelled);
      //case DIVERTED:
      //  return flight1.diverted.compareTo(flight2.diverted);
       default:
    	   return 0;
    }
    
  }
//  ArrayList flights;
//  Array[] String airportCount;
  
//  void sortOriginAirport(flights) {
//    Collections.sort(flights, new Comparator<
//    index = 0;
//    String current = Flight.origin(1);
//    for (index < Flight.size(); index++) {
//      if (current == Flight.origin(index)) {
        
//      }
      
//      airportCount.trimToSize();
//    }
  
//}

//void sortLateness(flights) {
//  flights.sort(
//}



public void setSortingBy(Order sortBy) {
  this.sortingBy = sortingBy;
  }
}