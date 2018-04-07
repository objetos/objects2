abstract class Node {
  // Attributes
  PVector position;
  float size;

  // Constructors
  // default
  Node() {
    setPosition(random(0, width), random(0, height));
    setSize(random(30,80));
  }
  
  Node(PVector p, float s) {
    setPosition(p);
    setSize(s);
  }

  // Methods

  abstract void display();
  
  abstract boolean pick(int x, int y);

  void setPosition(PVector pos) {
    position = pos;
  }

  void setPosition(float x, float y) {
    position = new PVector(x, y);
  }

  PVector position() {
    return position;
  }
  
  void setSize(float s) {
    size = s;
  }
  
  float size() {
    return size;
  }
}
