Node[] nodes;

void setup() {
  size(720, 640);
  nodes = new Node[2];
  for (int i = 0; i < nodes.length; i++)
    nodes[i] = i<15 ? new Circle(): new Rectangle();
}

void draw() {
  background(0);
  // Object use:
  for (int i = 0; i < nodes.length; i++)
    nodes[i].display();
}
