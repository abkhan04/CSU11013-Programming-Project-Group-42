// KW created flightTable class 23/03

class FlightTable {

  Table table;
  Table filteredTable;
  int rowHeight = 30;
  int visibleRows;
  int currentPage = 0;
  int totalPages;
  int sortColumn = -1;
  boolean sort = false;
  boolean sorted = false;
  boolean filter = true;
  boolean filtered = false;
  int[] headerWidths = new int[18];
  String startDate = "01/01/2022";
  String endDate = "01/05/2022";
  int ints = 0;
  PFont font;
  boolean necessaryData = false;

  void filterTableByDate(String startDate, String endDate) {
    Table tempTable = table;
    int start = ((startDate.substring(2, 6).charAt(1) - '0') * 10) + (startDate.substring(2, 6).charAt(2) - '0');
    int end = ((endDate.substring(2, 6).charAt(1) - '0') * 10) + (endDate.substring(2, 6).charAt(2) - '0');
  label:
    for (int i = 0; i < tempTable.getRowCount(); i++) {
      TableRow row = filteredTable.getRow(i);
      for (int j = 0; j < filteredTable.getColumnCount(); j++) {
        String data = row.getString(j).replace(" 00:00", "");
        String check;
        for (int k = start; k <= end; k++) {
          if (k < 10) {
            check = "/" + "0" + k + "/";
          } else {
            check = "/" + k + "/";
          }
          if (data.contains(check)) {
            filteredTable.removeRow(i);
            continue label;
          }
        }

        filteredTable = tempTable;
        filtered = true;
      }
    }
  }

  void draw() {
    textFont(font);
    background(255);
    surface.setSize(800, 600);
    textAlign(LEFT, TOP);

    filterTableByDate(startDate, endDate);

    // headers
    int x = 30;
    int y = 50;
    for (int i = 0; i < filteredTable.getColumnCount(); i++) {
      String header = filteredTable.getColumnTitle(i);
      if (header.equalsIgnoreCase("FL_DATE")) {
        header = "Date";
      }
      if (header.equalsIgnoreCase("ORIGIN")) {
        header = "Dep Airport";
      }
      if (header.equalsIgnoreCase("ORIGIN_CITY_NAME")) {
        header = "Dep City";
      }
      if (header.equalsIgnoreCase("DEST")) {
        header = "Des Airport";
      }
      if (header.equalsIgnoreCase("DEST_CITY_NAME")) {
        header = "Des City";
      }
      if (header.equalsIgnoreCase("CRS_DEP_TIME")) {
        header = "Departed";
      }
      if (header.equalsIgnoreCase("CRS_ARR_TIME")) {
        header = "Arrived";
      }
      if (header.equalsIgnoreCase("CANCELLED")) {
        header = "Cancelled";
      }
      if (header.equalsIgnoreCase("DIVERTED")) {
        header = "Diverted";
      }
      if (header.equalsIgnoreCase("DISTANCE")) {
        header = "Distance";
      }
      int headerWidth = (int)textWidth(header) + 10;
      headerWidths[i] = headerWidth;
      headerWidth -= 10;
      if (sortColumn == i) {
        fill(255);
        rect(x - 5, y - 5, headerWidth - 10, rowHeight - 10);
        fill(0);
        textSize(22);
        text(header, x, y);
      } else {
        fill(0);
        textSize(22);
        text(header, x, y);
      }
      x += textWidth(header) + 10;
    }

    // rows
    x = 30;
    y += rowHeight;
    int startRow = currentPage * visibleRows;
    int endRow = min(startRow + visibleRows, filteredTable.getRowCount());

  label:
    for (int i = startRow; i < endRow; i++) {
      TableRow row = filteredTable.getRow(i);
      for (int j = 0; j < filteredTable.getColumnCount(); j++) {
        String data = row.getString(j).replace(" 00:00", "");
        if (data.contains("/01")) {
          filteredTable.removeRow(i);
          continue label;
        }
        textSize(18);
        text(data, x, y);
        x += 10;
        switch (j) {
        case 0:
          x += 90;
          break;
        case 1:
          x += 30;
          break;
        case 2:
          x += 200;
          break;
        case 3:
          x += 30;
          break;
        case 4:
          x += 110;
          break;
        case 5:
          x += 40;
          break;
        case 6:
          x += 45;
          break;
        case 7:
          x += 30;
          break;
        case 8:
          x += 30;
          break;
        case 9:
          x += 50;
          break;
        case 10:
          x += 50;
          break;
        case 11:
          x += 50;
          break;
        case 12:
          x += 50;
          break;
        case 13:
          x += 50;
          break;
        case 14:
          x += 50;
          break;
        case 15:
          x += 20;
          break;
        case 16:
          x += 20;
          break;
        case 17:
          x += 125;
          break;
        }
      }
      x = 30;
      y += rowHeight;
    }

    // page buttons
    fill(255);
    rect(50, height - 80, 100, 50);
    rect(width - 150, height - 80, 100, 50);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(18);
    text("Prev", 100, height - 55);
    textSize(18);
    text("Next", width - 125, height - 55);
    textAlign(LEFT, TOP);
    totalPages = ceil(table.getRowCount() / (float) flightTable.visibleRows);
    textSize(18);
    text("Page " + (currentPage + 1) + " of " + totalPages, 650, height - 110);
    textSize(18);
    text("Number of flights: " + filteredTable.getRowCount(), 50, height - 110);
  }


  int sumOfHeaderWidths(int[] array, int j) {
    int sum = 0;
    for (int i = 0; i <= j; i++) {
      sum += array[i];
    }
    return sum;
  }

  void mousePressed() {
    // next or previous page
    if (mouseX >= 50 && mouseX <= 150 && mouseY >= height - 80 && mouseY <= height - 30) {
      currentPage = max(currentPage - 1, 0);
    }
    if (mouseX >= width - 150 && mouseX <= width - 50 && mouseY >= height - 80 && mouseY <= height -30) {
      if (currentPage < totalPages - 1) {
        currentPage = max(currentPage + 1, 0);
      }
    }

    if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 0) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 0;
        sort = true;
        filteredTable.sort(0);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 1) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 1;
        sort = true;
        filteredTable.sort(1);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 2) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 2;
        sort = true;
        filteredTable.sort(2);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 3) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 3;
        sort = true;
        filteredTable.sort(3);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 4) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 4;
        sort = true;
        filteredTable.sort(4);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 5) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 5;
        sort = true;
        filteredTable.sort(5);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 6) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 6;
        sort = true;
        filteredTable.sort(6);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 7) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 7;
        sort = true;
        filteredTable.sort(7);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 8) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 8;
        sort = true;
        filteredTable.sort(8);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 9) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 9;
        sort = true;
        filteredTable.sort(9);
      }
    }
  }
}
