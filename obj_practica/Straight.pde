class Straight extends Linea {

  Straight(Nodo N1, Nodo N2) {
    super(N1,N2);
  }
  void dibujar() {
    line(inc.loc.x,inc.loc.y,fin.loc.x,fin.loc.y);
  }
}
