package temp;

import processing.core.PApplet;

public class SubTyping extends PApplet {
  Node[] nodes;

  // Java access modifiers are: public, protected, default (no modifier) and private
  // see and study: https://docs.oracle.com/javase/tutorial/java/javaOO/accesscontrol.html

  public void settings() {
    size(720, 640);
  }

  public void setup() {
    nodes = new Node[30];
    for (int i = 0; i < nodes.length; i++)
      nodes[i] = i<15 ? new Circle(this) : new Rectangle(this);
  }

  public void draw() {
    background(0, 255, 255);
    // Object use:
    for (int i = 0; i < nodes.length; i++)
      nodes[i].display();
  }

  public static void main(String args[]) {
    PApplet.main(new String[]{"temp.SubTyping"});
  }
}
