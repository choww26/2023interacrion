PImage img; //變數要在外面宣告 
void setup(){
  img = loadImage("chair.jpg");
  size(600,600);
}
void draw(){
  image(img, mouseX,mouseY, 300, 300);
}
