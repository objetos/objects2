/*
Para cambiar el 'nivel' presione cualquier tecla
*/

Graph[] levels;
// total, current por defecto vale 0
// ver: https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html
int total, current;

void setup() {
  size(720, 640);
  // numero total de niveles
  total = 5;
  levels = new Graph[total];
  for (int i = 0; i < levels.length; i++)
    levels[i] = new Graph();
}

void draw() {
  background(0, 255, 255);
  levels[current].display();
}

void keyPressed() {
  current = current < total-1 ? current+1 : 0;
}
