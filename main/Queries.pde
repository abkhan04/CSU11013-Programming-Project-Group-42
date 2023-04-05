// A.Khan Added Queries 30/03
// A.Khan Added filterCancelled and filterDiverted 31/03
// A.Khan Fixed issue with countFlightDates with larger datasets 05/04

import java.util.Date;
import java.util.Calendar;
import java.text.SimpleDateFormat;

ArrayList<Flight> dateRange(ArrayList<Flight> flights, String startDate, String endDate)
{
  try
  {
    ArrayList<Flight> newFlights = new ArrayList<Flight>();
    
    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy"); 
    Date sDate = sdf.parse(startDate);
    Date eDate = sdf.parse(endDate);
  
    for (Flight f : flights)
    {
      Date fDate = sdf.parse(f.flightDate);
      
      if ((sDate.compareTo(fDate) <= 0) && (eDate.compareTo(fDate) >= 0)) 
      {
        newFlights.add(f);
      }
    }
    
    return newFlights;
  }
  catch (Exception e)
  {
    return new ArrayList<Flight>();
  }
}

ArrayList<Flight> departure(ArrayList<Flight> flights, String departureAirport)
{
  ArrayList<Flight> newFlights = new ArrayList<Flight>();
  for (Flight f : flights) if (f.origin.equals(departureAirport)) newFlights.add(f);
  return newFlights;
}

ArrayList<Flight> arrival(ArrayList<Flight> flights, String arrivalAirport)
{
  ArrayList<Flight> newFlights = new ArrayList<Flight>();
  for (Flight f : flights) if (f.dest.equals(arrivalAirport)) newFlights.add(f);  
  return newFlights;
}

ArrayList<Flight> distanceRange(ArrayList<Flight> flights, int minDist, int maxDist)
{
  ArrayList<Flight> newFlights = new ArrayList<Flight>();
  for (Flight f : flights) if ((f.distance >= minDist) && (f.distance <= maxDist)) newFlights.add(f);
  return newFlights;
}

ArrayList<Flight> filterCancelled(ArrayList<Flight> flights)
{
  ArrayList<Flight> newFlights = new ArrayList<Flight>();
  for (Flight f : flights) if (f.cancelled == 0) newFlights.add(f);
  return newFlights;
}

ArrayList<Flight> filterDiverted(ArrayList<Flight> flights)
{
  ArrayList<Flight> newFlights = new ArrayList<Flight>();
  for (Flight f : flights) if (f.diverted == 0) newFlights.add(f);
  return newFlights;
}

String[] getDates(String startDate, String endDate)
{
  try
  {
    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
    Date sDate = sdf.parse(startDate);
    Date eDate = sdf.parse(endDate);
    
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(sDate);
    
    Calendar endCalendar = Calendar.getInstance();
    endCalendar.setTime(eDate);
    endCalendar.add(Calendar.DATE, 1);
    
    ArrayList<String> dates = new ArrayList<String>();
    
    while (calendar.before(endCalendar))
    {
      Date date = calendar.getTime();
      String strDate = sdf.format(date);
      dates.add(strDate);
      calendar.add(Calendar.DATE, 1);
    }
    
    String[] strDates = new String[dates.size()];
    strDates = dates.toArray(strDates);
    
    return strDates;
  }
  catch (Exception e)
  {
    return new String[1];
  }
}

float[] countFlightDates(ArrayList<Flight> flights, String startDate, String endDate)
{
  String[] dates = getDates(startDate, endDate); //<>//
  float[] fligthsPerDay = new float[dates.length];
  
  for (int i = 0; i < flights.size(); i++)
  {
    for (int j = 0; j < dates.length; j++)
    {
      String date = flights.get(i).flightDate;
      String[] otherDateList = date.split("/");
      String otherDate = 0 + otherDateList[0] + "/" + 0 + otherDateList[1] + "/" + otherDateList[2];
      if ((date.equals(dates[j])) || (otherDate.equals(dates[j])))  //<>//
      {
        fligthsPerDay[j]++;
        break;
      }
    }
  }
  
  return fligthsPerDay;
}
