class Rectangle extends Node {
  @Override
  void display() {
    pushStyle();
    fill(0,255,0);
    if(pick(mouseX, mouseY))
      fill(255,0,0);
    ellipse(position.x, position.y, size, size);
    popStyle();
  }
  
  @Override
  boolean pick(int x, int y) {
    float distance = sqrt(sq(position().x - x)-sq(position().y - y));
    return distance <= size();
  }
}
