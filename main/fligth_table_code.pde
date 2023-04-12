// KW created flightTable class 23/03

class FlightTable {

  Table table;
  Table filteredTable;
  int x;
  int y;
  int visibleRows;
  int currentPage = 0;
  int totalPages;
  PFont font;
  boolean filteredByDate = false;
  boolean filteredByDepArr = false;
  boolean filteredByDistance = false;
  boolean filteredByCancelled = false;
  boolean filteredByDiverted = false;

  void filterOutDiverted() {
    Table tempTable = table;
  label:
    for (int i = 0; i < tempTable.getRowCount(); i++) {
      if (table.getString(i, "DIVERTED").contains("1")) {
        tempTable.removeRow(i);
        continue label;
      }
    }
    filteredTable = tempTable.copy();
  }

  void filterOutCancelled() {
    Table tempTable = table;
  label:
    for (int i = 0; i < tempTable.getRowCount(); i++) {
      if (table.getString(i, "CANCELLED").contains("1")) {
        tempTable.removeRow(i);
        continue label;
      }
    }
    filteredTable = tempTable.copy();
  }

  void filterByDistance(String minString, String maxString) {
    if (minString == "" && maxString == "") {
      return;
    } else if (minString == "") {
      minString = "0";
    } else if (maxString == "") {
      maxString = "999999";
    }
    Table tempTable = table;
    int min = Integer.parseInt(minString);
    int max = Integer.parseInt(maxString);
  label:
    for (int i = 0; i < tempTable.getRowCount(); i++) {
      if (tempTable.getInt(i, "DISTANCE") < min || tempTable.getInt(i, "DISTANCE") > max) {
        tempTable.removeRow(i);
        continue label;
      }
    }
    filteredTable = tempTable.copy();
  }

  void filterByDepArr(String dep, String arr) {
    if (dep == "" && arr == "") {
      return;
    }
    Table tempTable = table;
  label:
    for (int i = 0; i < tempTable.getRowCount(); i++) {
      if (!table.getString(i, "ORIGIN").contains(dep)) {
        tempTable.removeRow(i);
        continue label;
      }
      if (!table.getString(i, "DEST").contains(arr)) {
        tempTable.removeRow(i);
        continue label;
      }
    }
    filteredTable = tempTable.copy();
  }

  void filterByDate(String startDate, String endDate) {
    if (startDate == "" && endDate == "") {
      return;
    } else if (startDate == "") {
      startDate = "01/01/2022";
    } else if (endDate == "") {
      endDate = "01/31/2022";
    }
    Table tempTable = table;
    int start = ((startDate.substring(2, 6).charAt(1) - '0') * 10) + (startDate.substring(2, 6).charAt(2) - '0');
    int end = ((endDate.substring(2, 6).charAt(1) - '0') * 10) + (endDate.substring(2, 6).charAt(2) - '0');
  label:
    for (int i = 0; i < tempTable.getRowCount(); i++) {
      TableRow row = tempTable.getRow(i);
      String data = row.getString("FL_DATE").replace(" 00:00", "");
      String check;
      if (start > 1) {
        for (int k = start - 1; k >= 0; k--) {
          if (k < 10) {
            check = "/" + "0" + k + "/";
          } else {
            check = "/" + k + "/";
          }
          if (data.contains(check)) {
            tempTable.removeRow(i);
            continue label;
          }
        }
      }
      for (int k = end + 1; k <= 31; k++) {
        if (k < 10) {
          check = "/" + "0" + k + "/";
        } else {
          check = "/" + k + "/";
        }
        if (data.contains(check)) {
          tempTable.removeRow(i);
          continue label;
        }
      }

      filteredTable = tempTable.copy();
      filtered = true;
    }
  }

  void draw() {
    textFont(font);
    smooth();

    //background(255);
    textAlign(LEFT, TOP);

    // banners
    y = 22;
    for (int i = 0; i < 7; i++) {
      fill(0, 130, 130);
      rect(25, y + (i * 102), width - 50, 97, 10);
    }
    y += 25;
    for (int i = 0; i < 7; i++) {
      fill(255);
      rect(27, y + (i * 102), width - 54, 70, 10);
    }

    // rows
    y += -107;
    int startRow = currentPage * visibleRows;
    int endRow = min(startRow + visibleRows, filteredTable.getRowCount());
    for (int i = startRow; i < endRow; i++) {
      TableRow row = filteredTable.getRow(i);
      x += 10;
      for (int j = 0; j < filteredTable.getColumnCount(); j++) {
        fill(0);
        String data = row.getString(j);
        if (j == 0) {
          data = data.substring(3, 5);
          x = 33;
          y += 102;
          if (data.charAt(0) == '0') {
            data = data.substring(1, 2);
          }
          switch (data) {
          case "1":
          case "21":
          case "31":
            data += "st";
            break;
          case "2":
          case "22":
            data += "nd";
            break;
          case "3":
          case "23":
            data += "rd";
            break;
          default:
            data += "th";
          }
          switch (data) {
          case "1st":
          case "8th":
          case "15th":
          case "22nd":
          case "29th":
            data = "Sat " + data;
            break;
          case "2nd":
          case "9th":
          case "16th":
          case "23rd":
          case "30th":
            data = "Sun " + data;
            break;
          case "3rd":
          case "10th":
          case "17th":
          case "24th":
          case "31st":
            data = "Mon " + data;
            break;
          case "4th":
          case "11th":
          case "18th":
          case "25th":
            data = "Tue " + data;
          case "5th":
          case "12th":
          case "19th":
          case "26th":
            data = "Wed " + data;
          case "6th":
          case "13th":
          case "20th":
          case "27th":
            data = "Thu " + data;
            break;
          case "7th":
          case "14th":
          case "21st":
          case "28th":
            data = "Fri " + data;
            break;
          }
          data += " Jan";
          textAlign(LEFT);
          textSize(20);
          fill(255);
          text(data, x, y);
        } else {
          fill(0);
          switch (j) {
          case 1: // dep airport
            textAlign(LEFT);
            textSize(20);
            text(data, x, y + 72);
            break;
          case 2: // dep city
            textAlign(LEFT);
            textSize(20);
            text(data, x, y + 24);
            break;
          case 3: // arr airport
            textAlign(RIGHT);
            textSize(20);
            text(data, width - x, y + 72);
            break;
          case 4: // arr city
            textAlign(RIGHT);
            textSize(20);
            text(data, width - x, y + 24);
            break;
          case 5: // dep time
            if (Integer.parseInt(data) > 999) {
              data = data.substring(0, 2) + ":" + data.substring(2, 4);
            } else {
              data = "0" + data.substring(0, 1) + ":" + data.substring(1);
            }
            textAlign(LEFT);
            textSize(20);
            text(data, x, y + 48);
            break;
          case 6: // arr time
            if (Integer.parseInt(data) > 999) {
              data = data.substring(0, 2) + ":" + data.substring(2, 4);
            } else {
              data = "0" + data.substring(0, 1) + ":" + data.substring(1);
            }
            textAlign(RIGHT);
            textSize(20);
            text(data, width - x, y + 48);
            break;
          case 7: // cancelled
            if (showCancelled && data == "1") {
              textAlign(CENTER);
              fill(255, 30, 52);
              textSize(20);
              text("CANCELLED", width / 2, y + 48);
            }
            break;
          case 8: // diverted
            if (showDiverted && data == "1") {
              textAlign(CENTER);
              textSize(20);
              text("DIVERTED", width / 2, y + 48);
            }
            break;
          case 9: //distance
            String distance = data;
            int durationInt = max(Integer.parseInt(filteredTable.getString(i, 6)), Integer.parseInt(filteredTable.getString(i, 5)))
              - min(Integer.parseInt(filteredTable.getString(i, 6)), Integer.parseInt(filteredTable.getString(i, 5)));
            data = Integer.toString(durationInt);
            if (durationInt > 999) {
              data = data.substring(0, 2) + "h" + data.substring(2, 4) + "m";
            } else {
              data = data.substring(0, 1) + "h" + data.substring(1) + "m";
            }
            fill(0);
            stroke(0);
            strokeWeight(1);
            line(190, y + 49, width - 190, y + 49);
            strokeWeight(1);
            triangle(width - 190, y + 44, width - 190, y + 54, width - 180, y + 49);
            textAlign(CENTER);
            textSize(14);
            text(data, width / 2, y + 48);
            textSize(12);
            text(distance + "mi", width / 2, y + 60);
            break;
          }
        }
      }
    }

    // page buttons
    fill(255);
    shapeMode(CENTER);
    rect(width - 60, height - 50, 50, 30);
    rect(width - 120, height - 50, 50, 30);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
    textAlign(CENTER);
    text("<", width - 95, height - 30);
    textSize(16);
    textAlign(CENTER);
    text(">", width - 35, height - 30);
    textAlign(LEFT, TOP);
    totalPages = ceil(filteredTable.getRowCount() / (float) visibleRows);
    textSize(12);
    text((currentPage + 1) + " of " + totalPages, width - 80, height - 15);
    textAlign(CENTER);
  }

  void mousePressed() {
    // next or previous page
    if (mouseX >= width - 120 && mouseX <= width - 50 && mouseY >= 750 && mouseY <= 780) {
      currentPage = max(currentPage - 1, 0);
    }
    if (mouseX >= width - 60 && mouseX <= width - 10 && mouseY >= 750 && mouseY <= 780) {
      currentPage = min(currentPage + 1, totalPages);
    }
  }
}
