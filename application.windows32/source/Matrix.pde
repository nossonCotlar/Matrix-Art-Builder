class Mtx {

  Dot[][] dots;
  int mouseCellX, mouseCellY;
  int space, offset, big;
  int sizeX, sizeY;
  int brushSize;
  float fillH, fillS, fillB, oH, oS, oB;
  color fillCol = color(0, 255, 255), otherCol = color(0);

  Mtx(int t1, int t2, int tSpace, int tOffset, int tBig) {
    dots = new Dot[t1][t2];

    //noStroke();

    space = tSpace;
    offset = tOffset;
    big = tBig;
    sizeX = t1;
    sizeY = t2;
    brushSize = 2;

    fillH = hue(fillCol);
    fillS = saturation(fillCol);
    fillB = brightness(fillCol);
    oH = hue(otherCol);
    oS = saturation(otherCol);
    oB = brightness(otherCol);

    textSize(50);

    for (int i = 0; i < t1; i++) {
      for (int j = 0; j < t2; j++) {

        dots[i][j] = new Dot(i * space + offset, j * space + offset, big);
      }
    }
  }


  void update() {
    if (keyPressed) {
      updateSize();
      colorStuff();
      colorPick();
    }

    if (mousePressed) {
      setCell();
      put();
      colorStuff();
    }
  }

  void show() {
    for (int i = 0; i < sizeX; i++) {
      for (int j = 0; j < sizeY; j++) {
        dots[i][j].show();
      }
    }
  }

  void setCell() {
    mouseCellX = round((mouseX - offset) / float(space)); 
    mouseCellY = round((mouseY - offset) / float(space));
  }

  void put() {
    if (mouseCellX >= brushSize - 1 && mouseCellX < sizeX - brushSize + 1 && mouseCellY >= brushSize  - 1 && mouseCellY < sizeY - brushSize + 1) {
      
      for(int i = 0; i < brushSize; i++){
        dots[mouseCellX + i][mouseCellY].fillCol = fillCol;
        dots[mouseCellX + i][mouseCellY].show();
        
        dots[mouseCellX + i][mouseCellY + i].fillCol = fillCol;
        dots[mouseCellX + i][mouseCellY + i].show();
        
        dots[mouseCellX - i][mouseCellY].fillCol = fillCol;
        dots[mouseCellX - i][mouseCellY].show();
        
         dots[mouseCellX - i][mouseCellY - i].fillCol = fillCol;
        dots[mouseCellX - i][mouseCellY - i].show();
        
      dots[mouseCellX][mouseCellY + i].fillCol = fillCol;
        dots[mouseCellX][mouseCellY + i].show();
        
        dots[mouseCellX - i][mouseCellY + i].fillCol = fillCol;
        dots[mouseCellX - i][mouseCellY + i].show();
        
        
        dots[mouseCellX][mouseCellY - i].fillCol = fillCol;
        dots[mouseCellX][mouseCellY - i].show();
        
        dots[mouseCellX + i][mouseCellY - i].fillCol = fillCol;
        dots[mouseCellX + i][mouseCellY - i].show();
      }
      
      
    }
  }

  void colorPick() {
    switch (key) {
    case 'h':
      fillH += 1;
      if (fillH > 255) {
        fillH = 0;
      }
      break;
      case 'g':
      fillH -= 1;
      if (fillH < 0) {
        fillH = 255;
      }
      break;
    case 'a':
      fillS -= 1;
      if (fillS < 0) {
        fillS = 0;
      }
      break;
      case 's':
      fillS += 1;
      if (fillS > 255) {
        fillS = 255;
      }
      break;
      case 'b':
      fillB += 1;
      if (fillB > 255) {
        fillB = 255;
      }
      break;
    case 'v':
      fillB -= 1;
      if (fillB < 0) {
        fillB = 0;
      }
      break;
    case 'c':
      fillH = 0; 
      fillS = 255; 
      fillB = 255;
      oH = 0;
      oS = 0;
      oB = 0;
      otherCol = 0;
      break;
    case 'z':
      swapCol();
      delay(70);
      break;
    default: 
      break;
    }

    fillCol = color(fillH, fillS, fillB);
    
    
    colorStuff();
  }

  void colorStuff() {
    fillCol = color(fillH, fillS, fillB);

    fill(fillCol);
    pushStyle();
    pushStyle();
    fill(0);
    
    text("Hold:", space * sizeX + offset + 20, offset + 50);
    textSize(35);
    text("'H' for Hue   ('G' to decrease)", space * sizeX + offset + 20, offset + 100);
    text("'S' for Saturation   ('A' to decrease)", space * sizeX + offset + 20, offset + 135);
    text("'B' for Brightness   ('V' to decrease)", space * sizeX + offset + 20, offset + 170);
    popStyle();
    
    stroke(0);
    strokeWeight(5);
    rect(space * sizeX + offset + 70, offset + 350, 100, 250);
    
    pushStyle();
    strokeWeight(2);
    ellipse(space * sizeX + offset + 330, offset + 350, brushSize * big * 2, brushSize * big * 2);
    
    popStyle();

    popStyle();

    pushStyle();
    stroke(0);
    strokeWeight(5);
    fill(otherCol);
    rect(space * sizeX + offset + 200, offset + 350, 100, 250);

    popStyle();
  }


  void reset() {
    for (int i = 0; i < sizeX; i++) {
      for (int j = 0; j < sizeY; j++) {
        dots[i][j].fillCol = color(0);
      }
    }
    show();
  }

  void instructions() {
    pushStyle();
    fill(0);
    text("Press:", space * sizeX + offset + 10, offset + 600);
    textSize(30);
    text("'C' to reset colors", space * sizeX + offset + 10, offset + 650);
    text("'R' to reset painting", space * sizeX + offset + 10, offset + 685);
    text("'Z' to switch current color", space * sizeX + offset + 10, offset + 720);
    text("'N'/'M' to increase/decrease brush", space * sizeX + offset + 10, offset + 755);
    popStyle();
  }

  void swapCol() {
    color temp;
    temp = fillCol;
    fillCol = otherCol;
    otherCol = temp;

    fillH = hue(fillCol);
    fillS = saturation(fillCol);
    fillB = brightness(fillCol);
  }

  void release() {
    background(bg);
    show();
    instructions();
    colorStuff();
  }
  
  void updateSize(){
   if (key == 'n'){
    brushSize--;
    delay(100);
   }
   if (key == 'm'){
    brushSize++;
    delay(100);
   }
   if(brushSize < 1){
   brushSize = 1;
   }
   if(brushSize > 6){
   brushSize = 6;
   }
   colorStuff();
  }
}
