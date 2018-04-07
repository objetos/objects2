package temp;

import processing.core.PApplet;

import static processing.core.PApplet.sq;

class Circle extends Node {
  Circle(PApplet p) {
    super(p);
  }

  @Override
  void display() {
    pApplet.pushStyle();
    pApplet.strokeWeight(5);
    pApplet.stroke(255, 0, 255);
    pApplet.fill(0, 255, 0);
    if (pick(pApplet.mouseX, pApplet.mouseY)) {
      pApplet.stroke(0, 255, 0);
      pApplet.fill(255, 0, 255);
    }
    pApplet.ellipse(position.x, position.y, size, size);
    pApplet.popStyle();
  }

  @Override
  boolean pick(int x, int y) {
    return pApplet.sqrt(pApplet.sq(x-position().x) + pApplet.sq(y-position().y)) <= size()/2;
  }
}
