class Grafo {
  Nodo[]nodos;
  Linea[]lineas; 
  int numero_de_lineas=0, posiciones_dibujar=0,auxdoble=0 ;
  Table tabla ;
 


  Grafo(int node_tipe, int line_tipe, String nivel) {
    tabla =loadTable(nivel);
    nodos= new Nodo[tabla.getColumnCount()];

    for (int a=4; a<tabla.getRowCount(); a++) {
      for (int b=0; b<tabla.getColumnCount(); b++) {
        if (tabla.getInt(a, b)==1) {
          numero_de_lineas+=1; //<>//
        }
        if(tabla.getInt(a, b)==2){
        
       numero_de_lineas+=1;
    auxdoble++;
      }
     
      print(auxdoble);
      }
    }
    lineas= new Linea[  numero_de_lineas];
 
    //Crea arreglo de Nodos
    if (node_tipe==0) {
      for (int i=0; i<nodos.length; i++) {

        nodos[i]= new Circulo (tabla.getInt(0, i), tabla.getInt(2, i));
      }
    }
    if (node_tipe==1) {
      for (int i=0; i<nodos.length; i++) {

        nodos[i]= new Rectangulo(tabla.getInt(0, i), tabla.getInt(2, i));
      }
    }
    if (node_tipe==2) {
      for (int i=0; i<nodos.length; i++) {

        nodos[i]= new Triangle (tabla.getInt(0, i), tabla.getInt(2, i));
      }
    }


    //crea arreglo de lineas
    if (line_tipe==0) {
      int aux=0;
      for (int a=0; a<tabla.getRowCount(); a++) {
        for (int b=0; b<tabla.getColumnCount(); b++) {
          if ((tabla.getInt(a, b)==1)) {
            lineas[aux]=new Straight(nodos[a-4], nodos[b]);
            aux++;
          }
          if ((tabla.getInt(a, b)==2)) {
            lineas[aux]=new Dotted(nodos[a-4], nodos[b]);
            //aux=aux+2;
          aux++;
        }
        }
      }
    }
    if (line_tipe==1) {
      int aux=0;
      for (int a=4; a<tabla.getRowCount(); a++) {
        for (int b=0; b<tabla.getColumnCount(); b++) {
          if ((tabla.getInt(a, b)==1)) {
            lineas[aux]=new Dotted(nodos[a-4], nodos[b]);
            aux++;
          }
        }
      }
    }
  }

  // Método dibujar

  void dibujar() {
    strokeWeight(7);//dibuja lineas guias
    stroke(0, 1);

    for (int i=0; (i<numero_de_lineas); i++) {
      lineas[i].dibujar(); //<>//
    }
    for (int i=0; i<nodos.length; i++) {
      nodos[i].dibujar();
    }
  }

  void ganar_perder(String csv) {
    if (contador==(numero_de_lineas/2)+auxdoble/2) {
      background(240);
      delay(200); 
      fill(255,0,0);
      textSize(40);//tamaño del texto
      textAlign(CENTER, CENTER);//centralizar texto
      text("Felicitaciones, ha superado el nivel", 255, 200);
      text("Para el siguiente nivel presione s", 250, 250);

      if (keyPressed==true&&key=='s') {
        if (nivel<=(CSV.length-1)) {
          background(240);
          posiciones_dibujar=0;
          contador=0;
          perder= 0;
          nivel++;
          println(nivel);
          tabla=loadTable(csv);
        } else {
          background(240);
          posiciones_dibujar=0;
          contador=0;
          perder=0;
          nivel=1;
          
          tabla=loadTable(csv);
        }
      }
    }
    if (perder==1) {
      background(240);
      delay(200);
      fill(255,0,0);
      textSize(40);
      textAlign(CENTER, CENTER);
      text("Ha perdido", 255, 200);
      text(" Reiniciar nivel con r", 250, 250);
      tabla=loadTable(csv);
    }
    if (keyPressed==true&&key=='r') { 
      background(240);
      posiciones_dibujar=0;
      contador=0;
      perder=0;
      tabla=loadTable(csv);
    }
  }

  void jugar() {
    stroke(0, 255, 0);

    if (posiciones_dibujar==0) {
      for (int nodo1=0; nodo1<nodos.length; nodo1++) {
        if ((mouseX>=(nodos[nodo1].loc.x-20))&&(mouseX<=(nodos[nodo1].loc.x+20))&&(mouseY>=(nodos[nodo1].loc.y-20))&&(mouseY<=(nodos[nodo1].loc.y+20))) {
          dibujar[0]=nodos[nodo1].loc.x;
          dibujar[1]=nodos[nodo1].loc.y;
          nodo2=nodo1;
          posiciones_dibujar++;
        }
      }
    } else {

      for (int nodo1=0; nodo1<nodos.length; nodo1++) {//podria haber error por el switch
        if ((mouseX>=(nodos[nodo1].loc.x-20))&&(mouseX<=(nodos[nodo1].loc.x+20))&&(mouseY>=(nodos[nodo1].loc.y-20))&&(mouseY<=(nodos[nodo1].loc.y+20)) ) {
          dibujar[2]=nodos[nodo1].loc.x;
          dibujar[3]=nodos[nodo1].loc.y;
          switch(tabla.getInt((nodo1+4), nodo2)) {
          case 1:
            for (int a=0; a<lineas.length; a++) {
              if (((dibujar[0]==lineas[a].inc.loc.x)&&(dibujar[1]==lineas[a].inc.loc.y)&&(dibujar[2]==lineas[a].fin.loc.x)&&(dibujar[3]==lineas[a].fin.loc.y))||((dibujar[0]==lineas[a].fin.loc.x)&&(dibujar[1]==lineas[a].fin.loc.y)&&(dibujar[2]==lineas[a].inc.loc.y)&&(dibujar[3]==lineas[a].inc.loc.y))) {
                stroke(0, 255, 0);
                strokeWeight(7);
                lineas[a].dibujar();
              }
            }
            tabla.setInt((nodo1+4), nodo2, 7);
            tabla.setInt((nodo2+4), nodo1, 7);
            dibujar[0]=dibujar[2];
            dibujar[1]=dibujar[3];
            nodo2=nodo1;
            contador++;
            break;
            case 2:
             for (int a=0; a<lineas.length; a++) {
              if (((dibujar[0]==lineas[a].inc.loc.x)&&(dibujar[1]==lineas[a].inc.loc.y)&&(dibujar[2]==lineas[a].fin.loc.x)&&(dibujar[3]==lineas[a].fin.loc.y))||((dibujar[0]==lineas[a].fin.loc.x)&&(dibujar[1]==lineas[a].fin.loc.y)&&(dibujar[2]==lineas[a].inc.loc.y)&&(dibujar[3]==lineas[a].inc.loc.y))) {
                stroke(255, 0, 255);
                strokeWeight(7);
                lineas[a].dibujar();
              }
            } 
            tabla.setInt((nodo1+4), nodo2, 1);
            tabla.setInt((nodo2+4), nodo1, 1);
            dibujar[0]=dibujar[2];
            dibujar[1]=dibujar[3];
            nodo2=nodo1;
            contador++;
            break;
          case 7:
            perder=1;
            break;
            
          }
        }
      }
    }
  }
}