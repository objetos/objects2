class Node {
  // 1. Attributes
  PVector position;
  float size;

  // 2. Constructors
  // 2.1. Default
  Node() {
    setPosition(new PVector(random(0, width), random(0, height)));
    setSize(random(30,120));
  }

  // 3. Methods
  
  // 3.1. Setters

  void setPosition(PVector pos) {
    position = pos;
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
