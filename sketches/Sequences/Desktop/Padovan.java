package temp;

import processing.core.PApplet;

class Padovan extends Sequence {
  PApplet applet;

  Padovan(PApplet applet) {
    super(applet);
    setHue(180);
  }

  // we leave the default access modifier

  @Override
  int compute(int n) {
    if (n == 1 || n == 2 || n == 3)
      return 1;
    if (n > 3)
      return compute(n - 2) + compute(n - 3);
    return -1;
  }
}