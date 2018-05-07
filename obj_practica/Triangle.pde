class Triangle extends Nodo {
  int h;
  Triangle(int x, int y) {
    super(x, y);
  }
  void dibujar() {
    triangle(loc.x-20, loc.y+20, loc.x, loc.y-20, loc.x+20, loc.y+20);
  }
}
