Sequence sequence;
boolean padovan; // false by default, so we begin with Fibonacci

void setup() {
  size(720, 640);
  colorMode(HSB, 360, 100, 100);
  // We cannot initialize an 'abstract object'
  // only 'concrete' ones:
  sequence = new Fibonacci();
}

void draw() {
  background(0);
  // Object use:
  sequence.setHeight(mouseY);
  sequence.display();
}

void keyPressed() {
  padovan = !padovan;
  // both Fibonacci and Padovan object instances
  // may be assigned to the superclass sequence object:
  sequence = padovan ? new Padovan() : new Fibonacci();
}