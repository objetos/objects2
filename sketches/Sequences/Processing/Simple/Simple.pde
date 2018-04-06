// Object declaration
Fibonacci fSeq;
Padovan pSeq;
int term = 12;

void setup() {
  size(720,640);
  colorMode(HSB, 360, 100, 100);
  // Object instantiation
  fSeq = new Fibonacci();
  pSeq = new Padovan();
}

void draw() {
  background(0);
  // Object use:
  fSeq.setHeight(mouseY);
  fSeq.display(5);
}

void keyPressed() {
  // Object use:
  println(term + " term Fibonacci value is: " + fSeq.compute(term));
  println(term + " term Padovan value is: " + pSeq.compute(term));
}
