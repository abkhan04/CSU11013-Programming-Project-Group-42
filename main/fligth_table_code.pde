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
  int[] headerWidths = new int[18];
  String startDate = "01/01/2022  00:00";
  String endDate = "01/02/2022";
  int ints = 0;
  PFont font;

  void draw() {
    textFont(font);
    background(255);
    surface.setSize(1200, 600);
    textAlign(LEFT, TOP);
    textSize(12);

    // headers
    int x = 30;
    int y = 50;
    for (int i = 0; i < table.getColumnCount(); i++) {
      String header = table.getColumnTitle(i);
      int headerWidth = (int)textWidth(header) + 10;
      headerWidths[i] = headerWidth;
      headerWidth -= 10;
      if (sortColumn == i) {
        fill(255);
        rect(x - 5, y - 5, headerWidth + 10, rowHeight - 10);
        fill(0);
        text(header, x, y);
      } else {
        fill(0);
        textSize(12);
        text(header, x, y);
      }
      x += textWidth(header) + 10;
      /*
      switch (i) {
        case 0:
          x += 90;
          y -= 45;
          break;
        case 1:
          x += 30;
          y += 15;
          break;
        case 2:
          x += 20;
          y += 15;
          break;
        case 3:
          x += 30;
          y += 15;
          break;
        case 4:
          x += 140;
          y -= 30;
          break;
        case 5:
          x += 30;
          y += 15;
          break;
        case 6:
          x += 35;
          y += 15;
          break;
        case 7:
          x += 40;
          break;
        case 8:
          x += 140;
          y -= 30;
          break;
        case 9:
          x += 50;
          y += 15;
          break;
        case 10:
          x += 50;
          y += 15;
          break;
        case 11:
          x += 50;
          y += 15;
          break;
        case 12:
          x += 50;
          y += 15;
          break;
        case 13:
          x += 50;
          y += 15;
          break;
        case 14:
          x += 50;
          y += 15;
          break;
        case 15:
          x += 20;
          y += 15;
          break;
        case 16:
          x += 20;
          y += 15;
          break;
        case 17:
          x += 125;
          y += 15;
          break;
        }
        */
    }

    // rows
    textSize(16);
    x = 30;
    y += rowHeight;
    int startRow = currentPage * visibleRows;
    int endRow = min(startRow + visibleRows, table.getRowCount());

    for (int i = startRow; i < endRow; i++) {
      TableRow row = table.getRow(i);
      for (int j = 0; j < table.getColumnCount(); j++) {
        String data = row.getString(j).replace(" 00:00", "");
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
          x += 20;
          break;
        case 3:
          x += 30;
          break;
        case 4:
          x += 140;
          break;
        case 5:
          x += 30;
          break;
        case 6:
          x += 35;
          break;
        case 7:
          x += 40;
          break;
        case 8:
          x += 140;
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
    text("Prev", 100, height - 55);
    text("Next", width - 125, height - 55);
    textAlign(LEFT, TOP);
    textSize(12);
    text("Page " + (currentPage + 1) + " of " + totalPages, 50, height - 110);
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
      currentPage = max(currentPage + 1, 0);
    }

    if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 0) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 0;
        sort = true;
        table.sort(0);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 1) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 1;
        sort = true;
        table.sort(1);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 2) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 2;
        sort = true;
        table.sort(2);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 3) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 3;
        sort = true;
        table.sort(3);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 4) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 4;
        sort = true;
        table.sort(4);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 5) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 5;
        sort = true;
        table.sort(5);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 6) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 6;
        sort = true;
        table.sort(6);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 7) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 7;
        sort = true;
        table.sort(7);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 8) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 8;
        sort = true;
        table.sort(8);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 9) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 9;
        sort = true;
        table.sort(9);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 10) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 10;
        sort = true;
        table.sort(10);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 11) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 11;
        sort = true;
        table.sort(11);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 12) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 12;
        sort = true;
        table.sort(12);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 13) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 13;
        sort = true;
        table.sort(13);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 14) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 14;
        sort = true;
        table.sort(14);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 15) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 15;
        sort = true;
        table.sort(15);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 16) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 16;
        sort = true;
        table.sort(16);
      }
    } else if (mouseX >= 10 && mouseX <= sumOfHeaderWidths(headerWidths, 17) + 20 && mouseY >= 50 && mouseY <= 60) {
      if (sort) {
        sortColumn = -1;
        sort = false;
      } else {
        sortColumn = 17;
        sort = true;
        table.sort(17);
      }
    }
  }
}
