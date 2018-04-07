abstract class Node {
  // 1. Attributes
  PVector position;
  float size;

  // 2. Constructors
  // 2.1. Default
  Node() {
    setPosition(random(0, width), random(0, height));
    setSize(random(30,120));
  }
  
  // 2.2. Other
  Node(PVector p, float s) {
    setPosition(p);
    setSize(s);
  }

  // 3. Methods
  
  // 3.1. Abstract

  abstract void display();
  
  abstract boolean pick(int x, int y);
  
  // 3.2. Setters

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
  
  // 3.3. Getters

  PVector position() {
    return position;
  }
  
  float size() {
    return size;
  }
}
