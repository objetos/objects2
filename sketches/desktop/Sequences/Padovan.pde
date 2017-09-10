class Padovan extends Sequence {
  Padovan() {
    setHue(180);
  }

  @Override
  int compute(int n) {
    if (n == 1 || n == 2 || n == 3)
      return 1;
    if ( n > 3)
      return compute(n-2) + compute(n-3);
    return -1;
  }
}