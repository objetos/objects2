package temp;

import processing.core.PApplet;

abstract class Sequence {
  // we need the PApplet reference to use its methods
  PApplet pApplet;

  // Attributes

  int hue;
  int yPos;

  // Constructors

  Sequence(PApplet applet) {
    pApplet = applet;
    setHue(120);
    setHeight(pApplet.height / 2);
  }

  // Methods

  // Abstract methods require abstract classes
  abstract int compute(int n);

  void setHeight(int h) {
    yPos = h;
  }

  int height() {
    return yPos;
  }

  void setHue(int h) {
    hue = h;
  }

  int hue() {
    return hue;
  }

  // this function is common among different
  // Sequence subtypes, so we moved it here
  void display(int terms) {
    int square_width = pApplet.width / terms;
    for (int i = 0; i < terms; i++) {
      pApplet.fill(hue, 100, pApplet.map(compute(i + 1), 0, compute(terms), 0, 100));
      pApplet.rect(i * square_width, height(), square_width, 50);
    }
  }

  // Method overloading
  void display() {
    display(5);
  }
}