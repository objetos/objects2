class Node {
  // 1. Attributes
  PVector position;
  float size;

  // 2. Constructors
  // 2.1. Default calls second constructor
  Node() {
    this(random(0, width), random(0, height), random(30, 120));
  }

  // 2.2. Other
  Node(float x, float y, float s) {
    setPosition(x, y);
    setSize(s);
  }

  // 3. Methods

  // 3.1. Setters

  void setPosition(PVector pos) {
    position = pos;
  }

  // method overloading
  void setPosition(float x, float y) {
    // call original version on the correct type
    setPosition(new PVector(x, y));
  }

  void setSize(float s) {
    size = s;
  }

  // 3.2. Getters

  PVector position() {
    return position;
  }

  float size() {
    return size;
  }
}
