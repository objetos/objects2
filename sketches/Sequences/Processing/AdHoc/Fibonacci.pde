class Fibonacci extends Sequence {
  Fibonacci() {
    setHue(0);
  }

  @Override
  int compute(int n) {
    if (n == 1)
      return 0;
    if (n == 2)
      return 1;
    if ( n > 2)
      return compute(n-2) + compute(n-1);
    return -1;
  }
}