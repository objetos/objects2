abstract class Node { 
  abstract int compute(int n);

  color hue;
  int yPos;

  Node() {
    setHue(120);
    setHeight(height/2);
  }

  void setHeight(int h) {
    yPos = h;
  }

  int height() {
    return yPos;
  }

  void setHue(color h) {
    hue = h;
  }

  color hue() {
    return hue;
  }

  // this function is common among different
  // Sequence subtypes, so we moved it here
  void display(int terms) {
    int square_width = width / terms;
    for (int i = 0; i < terms; i++) {
      fill(hue, 100, map(compute(i+1), 0, compute(terms), 0, 100));
      rect(i*square_width, height(), square_width, 50);
    }
  }

  // Method overloading
  void display() {
    display(5);
  }
}
