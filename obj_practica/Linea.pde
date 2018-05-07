abstract class Linea {
  Nodo inc,fin;
  Linea(Nodo N1, Nodo N2){
  inc=N1;
  fin=N2;
  }
  abstract void dibujar();
}
