Circle[] circles;
Rectangle[] rectangles;

void setup() {
  size(720, 640);
  circles = new Circle[15];
  for (int i = 0; i < circles.length; i++)
    circles[i] = new Circle();
  rectangles = new Rectangle[15];
  for (int i = 0; i < rectangles.length; i++)
    rectangles[i] = new Rectangle();
}

void draw() {
  background(0, 255, 255);
  // Object use:
  for (int i = 0; i < circles.length; i++)
    circles[i].display();
  for (int i = 0; i < rectangles.length; i++)
    rectangles[i].display();
}
