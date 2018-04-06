package temp;

import processing.core.PApplet;

public class SubTyping extends PApplet {
  Sequence sequence;
  boolean padovan; // false by default, so we begin with Fibonacci

  // Java access modifiers are: public, protected, default (no modifier) and private
  // see and study: https://docs.oracle.com/javase/tutorial/java/javaOO/accesscontrol.html

  public void settings() {
    size(720, 640);
  }

  public void setup() {
    size(720, 640);
    colorMode(HSB, 360, 100, 100);
    // We cannot initialize an 'abstract object' but 'concrete' ones:
    // (note that we pass the this SubTyping instance reference)
    sequence = new Fibonacci(this);
  }

  public void draw() {
    background(0);
    // Object use:
    sequence.setHeight(mouseY);
    sequence.display();
  }

  public void keyPressed() {
    padovan = !padovan;
    // both Fibonacci and Padovan object instances
    // may be assigned to the superclass sequence object:
    sequence = padovan ? new Padovan(this) : new Fibonacci(this);
  }

  public static void main(String args[]) {
    PApplet.main(new String[]{"temp.SubTyping"});
  }
}
