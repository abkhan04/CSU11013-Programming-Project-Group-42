class flightSort {
  // variables for sorting by lateness
    int oneHour;
    int lessThan30;
    int moreThan30;
    int early;
    
    // variables for sorting cancelled flight
    int cancelled;
    int notCancelled;
    
    // variables for sorting diverted flight
    int diverted;
    int notDiverted;
    
    // variables for sorting flights by date
    int firstWeek;
    int secondWeek;
    int thirdWeek;
    int fourthWeek;
    
    // variables for sorting flights by distance
    int lessthan500;
    int lessThan1000;
    int lessThan2000;
    int greaterThan2000;
    
    
  void sortLateness (Flight flight) {
    int lateness = flight.arrTime - flight.schArrTime;
    if (lateness >= 30 && lateness <60)
      moreThan30 += 1;
    if (lateness < 0)
      early += 1;
    if (lateness >= 0 && lateness <30)
      lessThan30 += 1;
    else
      oneHour +=1;
  }
  
  void sortCancelled (Flight flight) {
    if (flight.cancelled == 1)
      cancelled += 1;
    else
      notCancelled += 1;
  }
  
  void sortDiverted (Flight flight) {
    if (flight.diverted == 1)
      diverted += 1;
    else
      notDiverted += 1;
  }
  
  void sortDate (Flight flight) {
    // checking for day because all flights are in the same month
    
    String date = flight.date;
    String[] sepDate = date.split("/");
    
    if (sepDate[1] <= 8)
      firstWeek += 1;
    if (sepDate[1] > 8 && <= 16)
      secondWeek += 1;
    if (sepDate[1] > 16 && <= 24)
      thirdWeek += 1;
    else
      fourthWeek += 1;
  }
  
  void sortDistance (Flight flight) {
    if (flight.distance <= 500)
      lessThan500 += 1;
    if (flight.distance > 500 && flight.distance <= 1000)
      lessThan1000 += 1;
    if (flight.distance > 1000 && flight.distance <= 2000)
      lessThan2000 += 1;
    else
      greatherThan2000 += 1;
  }
  
  
}
