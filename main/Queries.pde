// A.Khan Added Queries 30/03
// A.Khan Added filterCancelled and filterDiverted 31/03
// A.Khan Fixed issue with countFlightDates with larger datasets 05/04
// A.Khan Added getStartDate and getEndDate queries 06/04
// A.Khan Fixed dates bug in countFlightDates 12/04
// A.Khan Added countLateness 13/04

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

String getStartDate(ArrayList<Flight> flights)
{
  try
  {
    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
    Date sDate = sdf.parse(flights.get(0).flightDate);
    
    for (Flight f : flights)
    {
      Date fDate = sdf.parse(f.flightDate);
      
      if (fDate.compareTo(sDate) < 0)
      {
        sDate = fDate;
      }
    }
    
    return sdf.format(sDate);
  }
  catch (Exception e)
  {
    return "";
  }
}

String getEndDate(ArrayList<Flight> flights)
{
  try
  {
    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
    Date eDate = sdf.parse(flights.get(0).flightDate);
    
    for (Flight f : flights)
    {
      Date fDate = sdf.parse(f.flightDate);
      
      if (fDate.compareTo(eDate) > 0)
      {
        eDate = fDate;
      }
    }
    
    return sdf.format(eDate);
  }
  catch (Exception e)
  {
    return "";
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

String[] getDepAirports(ArrayList<Flight> flights)
{
  ArrayList<String> airports = new ArrayList<String>();
  
  for (Flight f : flights)
  {
    if (airports.contains(f.origin) == false)
    {
      airports.add(f.origin);
    }
  }
  
  String[] strAirports = new String[airports.size()];
  strAirports = airports.toArray(strAirports);
  
  return strAirports;
}

String[] getArrAirports(ArrayList<Flight> flights)
{
  ArrayList<String> airports = new ArrayList<String>(); //<>//
  
  for (Flight f : flights)
  {
    if (airports.contains(f.dest) == false)
    {
      airports.add(f.dest);
    }
  }
  
  String[] strAirports = new String[airports.size()]; //<>//
  strAirports = airports.toArray(strAirports);
  
  return strAirports;
}

float[] countFlightDates(ArrayList<Flight> flights, String startDate, String endDate)
{
  try
  {
    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
    String[] datesStr = getDates(startDate, endDate);
    float[] flightsPerDay = new float[datesStr.length];
    Date[] dates = new Date[datesStr.length];
    
    for (int i = 0; i < datesStr.length; i++)
    {
      dates[i] = sdf.parse(datesStr[i]);
    }   
    
    for (Flight f : flights)
    {
      for (int i = 0; i < dates.length; i++)
      {
        Date fDate = sdf.parse(f.flightDate);
        if ((dates[i].compareTo(fDate) == 0)) 
        {
          flightsPerDay[i]++;
          break;
        }
      }
    }
    
    return flightsPerDay;
  }
  catch (Exception e)
  {
    String[] dates = getDates(startDate, endDate);
    float[] flightsPerDay = new float[dates.length];
    
    return flightsPerDay;
  }
}

float[] countDepArr(ArrayList<Flight> flights)
{
  String[] airports = getArrAirports(flights);
  float[] flightsPerAirport = new float[airports.length];
  
  for (Flight f : flights)
  {
    for (int j = 0; j < airports.length; j++)
    {
      if (f.dest.equals(airports[j]))
      {
        flightsPerAirport[j]++;
      }
    }
  }
  
  return flightsPerAirport;
}

float[] countArrDep(ArrayList<Flight> flights)
{
  String[] airports = getDepAirports(flights);
  float[] flightsPerAirport = new float[airports.length];
  
  for (Flight f : flights)
  {
    for (int j = 0; j < airports.length; j++)
    {
      if (f.origin.equals(airports[j]))
      {
        flightsPerAirport[j]++;
      }
    }
  }
  
  return flightsPerAirport;
}

float[] countLateness(ArrayList<Flight> flights)
{
  try
  {
    SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
    Calendar cal = Calendar.getInstance();
    float[] lateFlights = new float[4];
    
    for (Flight f : flights)
    {
      if (f.schArrTime != null && f.arrTime != null)
      {
        Date schFTime = sdf.parse(f.schArrTime);
        Date fTime = sdf.parse(f.arrTime);
        cal.setTime(schFTime);
        cal.add(Calendar.MINUTE, 30);
        Date halfHour = cal.getTime();
        
        if (fTime.compareTo(schFTime) == -1)
        {
          lateFlights[0]++;
        }
        else if (fTime.compareTo(schFTime) == 0)
        {
          lateFlights[1]++;
        }
        else if (fTime.compareTo(halfHour) == -1)
        {
          lateFlights[2]++;
        }
        else
        {
          lateFlights[3]++;
        }
      }
    }
    
    return lateFlights;
  }
  catch (Exception e)
  {
    return new float[4];
  }
}
