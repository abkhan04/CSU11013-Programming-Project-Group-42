# CSU11013-Programming-Project-Group-42
CSU11013 Programming Project Group 42

Abdullah Khan
Conor Kavanagh
Julia Nash
Kajetan Wajszczuk

## Outline of our design

Upon starting up our program, the User is greeted to a loading screen as data is
loaded. Once this has been completed, the User is shown the main page which
contains the program title and DoT logo. The user is prompted to press “Start” to
progress through the program.
After this, the user is prompted to input a list of parameters to specify what exactly
they wish to view from the overall data. They can select a data range for this data,
specify a specific arrival or departure airport, set a maximum and/or minimum
distance for the flight, and choose to include or ignore any cancelled or diverted
flights.
After specifying the data, the user then selects “Next” and is greeted by the
visualisation page. Here the user can select 5 different ways of portraying their data,
all of which specify in different relevant areas; they can see the overal number of
flights that occurred through a bar chart, the trend of how late flights were in the line
graph, a map of all airports in the continental US and the total amount of flights that
occurred on it (or if they specified a specific airport, they will see where that airport is
located, all flights that departed from it, and a reference to how many flights departed
the entire state as a whole), a piechart showing the proportions of total flights each
airport took up in relation to the data range, and what airport was the busiest/quietest
during this time, and finally a table which provides a User Friendly way to view each
flight that occurred, including it’s time, arrival and departure airports, distance and
time.
A back button is located at the bottom left, which allows the user to toggle between
all of these visualisation options and even change the parameters they had
previously inputted.

## Project Features

We first made sure our project would meet the minimum requirements; Having
features that would allow flights associated with a particular airport, flights within a
certain date range and flights sorted by lateness to be available, all on multiple
screens with graphical outputs, however we had no intention in stopping there.
The parameters we offered the user also included an optional departure and arrival
airport, max and minimum distances and the option to include cancelled or diverted
flights.
We decided on 5 important graphical outputs that would each serve a different
purpose:
● Our Bar Chart showed the total amount of flights in a given day. This total
could be influenced by the date range, show all flights departing from a
specific airport, all flights arriving to a specific airport, all flights that flew
between two specific airports, or all flights in general that occurred over that
day. Diverted and Cancelled flights could be included or excluded, and a
distance max/min could be set.
● Our Line Graph was implemented to show a trend of flight lateness. Over the
selected time period, all flights (or to/from selected airports) that were early,
on-time, under 30 minutes late, or over 30 minutes late would be represented,
with the same parameters as our bar chart.
● Our Map was implemented to show a trend of flights that depart from airports
all across the United States. It had two options:
○ If no departure airport was selected, every single airport across the US
would be represented by a red circle. The total number of flights in the
given range would be shown.
○ If a certain airport was inputted, then only this airport would be
highlighted on the map, and the total number of flights from that airport
in the given range would be shown, as well as the total number of
flights from that airport’s state for comparison.
● Our Pie Chart represented the proportion of flights that took off from each
airport in comparison to every other airport. Alongside this, the user was also
informed about what airport was the busiest, with how many flights took off,
and what airport was the quietest (Airports with no flights were not counted).
● Our Table provided the user with a much more friendly and easy to read
version of the previously provided CSV file. It was laid out in a page format
with 7 flights provided on each page. The day and date were clearly visible as
the title with information of the departure and arrival time, city and airport all
provided. The flight length and distance were also shown to the user.

## Problems Encountered

Many of us had a problem with merge conflicts when attempting to commit work.
There were several cases of work being lost when a new commit overrode the last
work.We were all new to using Git, and so none of us had any idea how to use it
properly and efficiently. We overcame this as our experience grew, with team
members knowing to pull work before pushing their own, and having everyone work
on separate areas inside our project. Initially, everyone branched away from main to
work on their own areas, however this proved to bring more issues than it was worth,
and so we streamlined this process and had everyone commit to the main.
As a team, we also had to find solutions to optimise our program since our program
would take way too long to load data from the larger files. We achieved this by taking
out blocks of code and combing through to find any duplication and instructions that
could be optimised or simply removed.
