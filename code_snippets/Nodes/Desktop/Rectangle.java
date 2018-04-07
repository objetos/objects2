package temp;

import processing.core.PApplet;
import processing.core.PConstants;

class Rectangle extends Node implements PConstants {
  Rectangle(PApplet p) {
    super(p);
  }

  @Override
  void display() {
    pApplet.pushStyle();
    // PConstants defines the CENTER constant
    pApplet.rectMode(CENTER);
    pApplet.strokeWeight(5);
    pApplet.stroke(0, 0, 255);
    pApplet.fill(255, 255, 0);
    if (pick(pApplet.mouseX, pApplet.mouseY)) {
      pApplet.stroke(255, 255, 0);
      pApplet.fill(0, 0, 255);
    }
    pApplet.rect(position.x, position.y, size, size);
    pApplet.popStyle();
  }

  @Override
  boolean pick(int x, int y) {
    return pApplet.abs(x-position().x) <= size()/2 && pApplet.abs(y-position().y) <= size()/2;
  }
}
