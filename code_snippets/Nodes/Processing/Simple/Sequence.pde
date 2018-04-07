class Sequence {
  color hue;
  int yPos;
  
  Sequence() {
    setHue(120);
    setHeight(height/2);
  }
  
  void setHeight(int h) {
    yPos = h;
  }
  
  int height() {
    return yPos;
  }
  
  void setHue(color h) {
    hue = h;
  }
  
  color hue() {
    return hue;
  }
}
