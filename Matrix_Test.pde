int x = 120, y = 80;
int offset = 50;
int space = 10;
int big = 8;
color bg = color(100);

Mtx yeet;

void setup() {
  size(1800, 900);
  colorMode(HSB, 255, 255, 255);
  background(bg);
  //stroke(255);
  noStroke();
  rectMode(CENTER);

  yeet = new Mtx(x, y, space, offset, big);
  

  yeet.show();
  yeet.colorPick();
  yeet.instructions();
  
}

void draw() {
  if(keyPressed){
   if(key == 'r'){
     background(bg);
     yeet.instructions();
    yeet.reset(); 
   }
  }

  yeet.update();
  
  
println(yeet.mouseCellX + "   " + yeet.mouseCellY);


 
}

void mouseReleased(){
 yeet.release(); 
}
