package temp;

import processing.core.PApplet;
import processing.core.PVector;

abstract class Node {
  // we need the PApplet reference to use its methods
  PApplet pApplet;

  // 1. Attributes
  PVector position;
  float size;

  // 2. Constructors
  // 2.1. Default
  Node(PApplet p) {
    pApplet = p;
    setPosition(pApplet.random(0, pApplet.width), pApplet.random(0, pApplet.height));
    setSize(pApplet.random(30,120));
  }

  // 2.2. Other
  Node(PApplet p, PVector v, float s) {
    pApplet = p;
    setPosition(v);
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