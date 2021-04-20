class Button {
  // Member Variables
  int x, y, w, h;
  String val;
  color c1, c2;
  boolean hover, isNumber;

  // Constructor 
  Button(int tempX, int tempY, int tempW, int tempH, String tempVal, boolean isNumber) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    val = tempVal;
    c1 = #4C70C6;
    c2 = #97B0ED;
    hover = false;
    this.isNumber = isNumber;
  }

  // Method for Display
  void display() {
    if (isNumber == true) {
      if (hover) {
        fill(c2);
      } else {
        fill(c1);
      }
      rect(x, y, w, h, 8);
      fill(0);
      textAlign(CENTER);
      textSize(14);
      text(val, x+w/2, y+h/2);
    } else if(val.equals("C")) {
      
    } else { // format a non-number button
      if (hover) {
        fill(c2);
      } else {
        fill(c1);
      }
      ellipseMode(CORNER); 
      ellipse(x, y, w, h);
      fill(0);
      textAlign(CENTER);
      textSize(14);
      text(val, x+w/2, y+h/2);
    }
  }

  // Methos for mouse interaction
  void hover() {
    hover = mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h;
  }
}
