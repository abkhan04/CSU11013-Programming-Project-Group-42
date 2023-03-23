// added by J.Nash 21/03
/*
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
    int lessThan500;
    int lessThan1000;
    int lessThan2000;
    int greaterThan2000;
    
    // variables for sorting when flights arrive
    int arrMorning;
    int arrAfternoon;
    int arrEvening;
    
    // variables for sorting when flights depart
    int depMorning;
    int depAfternoon;
    int depEvening;
    
 // used for bar graph and pie chart   
  void sortLateness (Flight flight) {
    int arrTime = Integer.parseInt(flight.arrTime);
    int schArrTime = Integer.parseInt(flight.schArrTime);
    int lateness = arrTime - schArrTime;
    if (lateness < 0)
      early += 1;
    if (lateness >= 0 && lateness <30)
      lessThan30 += 1;
    if (lateness >= 30 && lateness <60)
      moreThan30 += 1;
    else
      oneHour +=1;
      
    barChart.setValueAxisLabel("");
    barChart.setCategoryAxisLabel("lateness");
    bc.setBarLabels(new String[] {"early", "less than 30 minutes", "more than 30 minutes", "more than 1 hour"});
  }
  
  void sortCancelled (Flight flight) {
    if (flight.cancelled == 1)
      cancelled += 1;
    else
      notCancelled += 1;
      
    barChart.setValueAxisLabel("");
    barChart.setCategoryAxisLabel("status - cancelled");
    bc.setBarLabels(new String[] {"cancelled", "not cancelled"});
  }
  
  void sortDiverted (Flight flight) {
    if (flight.diverted == 1)
      diverted += 1;
    else
      notDiverted += 1;
      
    barChart.setValueAxisLabel("minutes");
    barChart.setCategoryAxisLabel("status - diverted");
    bc.setBarLabels(new String[] {"diverted", "not diverted"});
  }
  
  void sortDate (Flight flight) {
    // checking for day because all flights are in the same month
    
    String date = flight.flightDate;
    String[] sepDate = date.split("/");
    int temp = Integer.parseInt(sepDate[1]);
    
    if (temp <= 8)
      firstWeek += 1;
    if (temp > 8 && temp <= 16)
      secondWeek += 1;
    if (temp > 16 && temp <= 24)
      thirdWeek += 1;
    else
      fourthWeek += 1;
      
    barChart.setValueAxisLabel("minutes");
    barChart.setCategoryAxisLabel("week");
    bc.setBarLabels(new String[] {"first week", "second week", "third week", "fourth week"});
  }
  
  void sortDistance (Flight flight) {
    int distance = Integer.parseInt(flight.distance);
    if (distance <= 500)
      lessThan500 += 1;
    if (distance > 500 && distance <= 1000)
      lessThan1000 += 1;
    if (distance > 1000 && distance <= 2000)
      lessThan2000 += 1;
    else
      greaterThan2000 += 1;
      
    barChart.setValueAxisLabel("");
    barChart.setCategoryAxisLabel("distance (miles)");
    bc.setBarLabels(new String[] {"less than 500", "less than 1000", "more than 1000", "more than 2000"});
  }
  
  void sortArrivalTime (Flight flight) {
    int arrTime = Integer.parseInt(flight.arrTime);
    if (arrTime < 1200)
      arrMorning += 1;
    if (arrTime >= 1200 && arrTime < 1800)
      arrAfternoon += 1;
    else
      arrEvening += 1;
      
    barChart.setValueAxisLabel("minutes");
    barChart.setCategoryAxisLabel("arrival time");
    bc.setBarLabels(new String[] {"morning", "afternoon", "evening"});
  }
  
  void sortDepartureTime (Flight flight) {
    int depTime = Integer.parseInt(flight.depTime);
    if (depTime <1200)
      depMorning += 1;
    if (depTime >= 1200 && depTime < 1800)
      depAfternoon += 1;
    else
      depEvening += 1;
      
    barChart.setValueAxisLabel("minutes");
    barChart.setCategoryAxisLabel("departure time");
    bc.setBarLabels(new String[] {"morning", "afternoon", "evening"});
  }
  
  
}
*/
