class Dot {

  int x, y, size;
  color fillCol;
  int alright;
  
  Dot(int tempX, int tempY, int tempS){
    x = tempX;
    y = tempY;
    size = tempS;
    fillCol = color(0);
    //stroke(0);
    alright = 3;
  }
  
  void show(){
    fill(fillCol);
   ellipse(x, y, size, size); 


  }
  

}
