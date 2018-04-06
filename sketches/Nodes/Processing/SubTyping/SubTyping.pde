Node node;
boolean rectangle; // false by default, so we begin with a circle

void setup() {
  size(720, 640);
  colorMode(HSB, 360, 100, 100);
  // We cannot initialize an 'abstract object'
  // only 'concrete' ones:
  node = new Circle();
}

void draw() {
  background(0);
  // Object use:
  node.setHeight(mouseY);
  node.display();
}

void keyPressed() {
  rectangle = !rectangle;
  // both Rectangle and Circle objects may be assigned
  // to the superclass Node object:
  node = rectangle ? new Rectangle() : new Circle();
}
