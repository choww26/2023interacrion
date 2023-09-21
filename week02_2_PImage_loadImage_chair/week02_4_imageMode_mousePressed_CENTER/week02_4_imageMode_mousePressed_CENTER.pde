PImage img, imgBox;
void setup(){
  img = loadImage("cinderella.png");
  imgBox = loadImage("box.png");
  size(1000,1000);
}
void draw(){
  imageMode(CENTER);
  if(mousePressed){
    image(imgBox, mouseX,mouseY);
  }
  else{
    image(img, 500,500);
  }
}
