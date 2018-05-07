Grafo[] levels; //<>//
String[]CSV={"nivel1.csv","new.csv", "nivel2.csv", "nivel3.csv" };
int total=3, node_tipe, menu=0, N1, N2, creacion=0, columnas;
PFont font;
PImage grid;
int nivel=1, contador, nodo1, nodo2, perder, aux;
float[]dibujar=new float[4];
Table nivelc;
int columnasc, creacionc=0, posiciones_dibujar, nodo1c, nodo2c;
float[]dibujarc=new float[4];

void setup() {
  grid = loadImage("grid.png");
  size(500, 500);
  background(240);
  levels = new Grafo[4]; 
  nivelc=new Table();
  size(500, 500);
  nivelc.addRow();
  nivelc.addRow();
  nivelc.addRow();
}

void draw() {
  if (menu==0) { 
    font=loadFont("snap40.vlw");
    textFont(font);
    background(200, 255, 255);
    fill(150, 0, 70);
    textSize(35);
    textAlign(CENTER, CENTER);
    text("Grafos Eulerianos", 250, 100);
    text("Creador de Niveles -  presione c", 250, 250);
    text("Jugar Niveles Predeterminados - presione i", 250, 320);
    fill(0,0,255);
     text("Para regresar al menu presione -m-", 250, 400);
    //rect(100,230,300,50);
    if (keyPressed==true&&key=='i') {
      menu++;
      background(240);
    }
    if (keyPressed==true&&key=='c') {
      menu=4;
      background(240);
    }
  }

  if ( menu==1) {
    font=loadFont("snap40.vlw");
    textFont(font);
    fill(255, 0, 0);
    textSize(35);
    textAlign(CENTER, CENTER);
    text(" BIENVENIDO", 250, 20);
    textSize(30);
    text("Seleccione el tipo de nodo que desea:", 250, 80);
    fill(0, 0, 255);
    ellipse(100, 250, 100, 100);
    fill(255);
    rectMode(CENTER);
    rect(250, 250, 100, 100);
    fill(100, 150, 150);
    triangle(400, 200, 350, 300, 450, 300);
    fill(255,0,0);
    text("El segundo nivel es hecho con el creador", 250, 400);

  }


  if (menu==2) {
    font=loadFont("snap40.vlw");
    textFont(font);
    background(240);
    fill(255, 0, 0);
    textSize(35);
    textAlign(CENTER, CENTER);
    //text("bienvenido", 400, 250);
    text(" Para comenzar presione i", 250, 200);
    text("Si en algun momento desea reiniciar, presione r", 250, 250);
    if (keyPressed==true&&key=='i') {
      menu++;
      background(240);
    }
  }

  if (menu==3) {
    levels[nivel-1].dibujar();
    levels[nivel-1].ganar_perder(CSV[nivel-1]);
  }
  if (menu==4) {
    font=loadFont("snap40.vlw");
    textFont(font);
    //background(200, 255, 255);
    background(grid);
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(150, 0, 70);
    text("Bienvenido al Creador de Niveles", 250, 200);
    text("Para comenzar presione i", 250, 275);
    if (keyPressed==true&&key=='i') {
      menu++;
      //background(200, 255, 255);
      background(grid);
      font=loadFont("snap40.vlw");
      textFont(font);
      textAlign(CENTER, CENTER);
      textSize(25);
      fill(150, 0, 70);
      text("Haga click para crear Nodos - Al finalizar presione s", 250, 25);
    }
  }
  if (menu==5) {
    if (keyPressed==true&&key=='s') {
      font=loadFont("snap40.vlw");
      textFont(font);
      textAlign(CENTER, CENTER);
      textSize(25);
      fill(150, 0, 70);
      text("Para hacer lineas haga click entre nodos - Finalizar con l", 250, 50);
      creacionc++;
      for (int i=0; i<nivelc.getColumnCount(); i++) {
        println(nivelc.getFloat(0, i));
        println(nivelc.getFloat(2, i));
      }
      for (int i=0; i<=nivelc.getColumnCount(); i++) {
        nivelc.addRow();
      }

      delay(1000);
    }
    if (keyPressed==true&&key=='l') {
      font=loadFont("snap40.vlw");
      textFont(font);
      background(200, 255, 255);
      textAlign(CENTER, CENTER);
      textSize(25);
      fill(150, 0, 70);
      text("SU NIVEL HA SIDO CREADO CON ÉXITO", 250, 200);
      text("Para jugarlo presione m, Luego i en el menú principal", 250, 250);
      creacionc=7;//totearla
      for (int f=4; f<nivelc.getRowCount(); f++) {
        for (int c=0; c<nivelc.getColumnCount(); c++) {
          if (nivelc.getFloat(f, c)!=1) {
            nivelc.setFloat(f, c, 0);
          }
        }
      }
      for (int i=4; i<nivelc.getRowCount(); i++) {
        nivelc.setFloat(i, (i-4), 0);
      }


      saveTable(nivelc, "data/new.csv");
    }
  }
  if (keyPressed==true&&key=='m') {
    menu=0;
    background(240);
  }
}

void mouseClicked() {

  // Seleccion Nodo //

  if (menu==5) { 
    asignacion_dibujar();
    switch(creacionc) {
    case 1:
      creacionc++;
      break;
    case 2:
      creacionc=1;
      break;
    }
  }

  if (menu==1) {
    if ((mouseX>=50)&&(mouseX<=150)&&(mouseY>=200)&&(mouseY<=300)) {
      node_tipe=0;

      menu++;
    }
    if ((mouseX>=200)&&(mouseX<=300)&&(mouseY>=200)&&(mouseY<=300)) {
      node_tipe=1;
      menu++;
    }
    if ((mouseX>=350)&&(mouseX<=450)&&(mouseY>=200)&&(mouseY<=300)) {
      node_tipe=2;
      menu++;
    }
    for (int i = 0; i < levels.length; i++) {
      levels[i] = new Grafo(node_tipe, 0, CSV[i]);
    }
  }
  if (menu==3) {
    levels[nivel-1].jugar();
  }
}

void asignacion_dibujar() {
  if (creacionc==0) {
    nivelc.addColumn();
    fill(0, 0, 255);
    nivelc.setInt (0, columnasc, mouseX);
    nivelc.setInt(2, columnasc, mouseY);

    ellipse(nivelc.getInt(0, columnasc), nivelc.getInt(2, columnasc), 30, 30);
    columnasc++;
  }
  if (creacionc==1) {
    for (int a=0; a<nivelc.getColumnCount(); a++) {
      if ((mouseX>=(nivelc.getInt(0, a)-15))&&(mouseX<=(nivelc.getInt(0, a)+15))&&(mouseY>=(nivelc.getInt(2, a)-15))&&(mouseY<=(nivelc.getInt(2, a)+15))) {
        dibujarc[0]=nivelc.getInt(0, a);
        dibujarc[1]=nivelc.getInt(2, a);
        nodo1c=a;
      }
    }
  }
  if (creacionc==2) {
    for (int a=0; a<nivelc.getColumnCount(); a++) {
      if ((mouseX>=(nivelc.getInt(0, a)-15))&&(mouseX<=(nivelc.getInt(0, a)+15))&&(mouseY>=(nivelc.getInt(2, a)-15))&&(mouseY<=(nivelc.getInt(2, a)+15))) {
        dibujarc[2]=nivelc.getInt(0, a);
        dibujarc[3]=nivelc.getInt(2, a);
        nodo2c=a;
        stroke(255, 0, 0);
        strokeWeight(5);
        line(dibujarc[0], dibujarc[1], dibujarc[2], dibujarc[3]);
        nivelc.setInt((nodo1c+4), nodo2c, 1);
        nivelc.setInt((nodo2c+4), nodo1c, 1);
      }
    }
  }
}