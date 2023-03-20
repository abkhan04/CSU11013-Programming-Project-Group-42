// added by Julia Nash 20/3

import java.util.*;
public class sorting {
	ArrayList <Flight> flights;
	public void sortFlightsBy(flightSorter.Order sortingBy) {
		flightSorter comparator = new flightSorter();
		  comparator.setSortingBy(sortingBy);
		  Collections.sort(flights, comparator);
		}
}
