package temp;

import processing.core.PApplet;

class Fibonacci extends Sequence {
  PApplet applet;

  Fibonacci(PApplet applet) {
    super(applet);
    setHue(0);
  }

  // we can augment the default access modifier,
  // but never reduce it.

  @Override
  public int compute(int n) {
    if (n == 1)
      return 0;
    if (n == 2)
      return 1;
    if (n > 2)
      return compute(n - 2) + compute(n - 1);
    return -1;
  }
}