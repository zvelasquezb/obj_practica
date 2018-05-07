abstract class Nodo {
  PVector loc;
  Nodo(int x, int y) {
    loc=new PVector(x, y);
  }
  abstract void dibujar();
}
