class Circulo extends Nodo {
  int radio;
  Circulo(int x, int y) {
    super(x,y);
  }
  void dibujar() {
    ellipse(loc.x,loc.y,40,40);
  }
}
