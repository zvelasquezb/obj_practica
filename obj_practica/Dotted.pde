class Dotted extends Linea {
  float steps=15;
  Dotted(Nodo N1,Nodo N2) {
    super(N1,N2);
  }
  void dibujar() {
    for (int i=0; i<=steps; i++) {
      float x=lerp(inc.loc.x, fin.loc.x, i/steps);
      float y=lerp(inc.loc.y, fin.loc.y, i/steps);
      ellipse(x, y, 2, 2);
    }
  }
}
