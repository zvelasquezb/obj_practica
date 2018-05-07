class Rectangulo extends Nodo {
 int base;
 
 Rectangulo(int x,int y){
 super(x,y);
 }
 void dibujar(){
 rect(loc.x,loc.y,40,40);
 }
}
