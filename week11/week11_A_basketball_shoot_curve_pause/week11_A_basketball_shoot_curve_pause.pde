PImage imgRack;
void setup(){
  size(300,300);
  imgRack = loadImage("rack.jpg");
}
boolean gameOver = false;
void keyPressed(){
  gameOver = true; 
}
void draw(){
  background(255);
  image(imgRack, 0, 0, 300, 300);
  if(flying){
    if(!gameOver){//if(!keyPressed)// 遊戲結束暫停動作
      x += vx; //沒有gameOver才能動
      y += vy;
      vy += 0.98; // gravity
    }
  }else{
    x = mouseX;
    y = mouseY;
    if(mousePressed){
      fill(255); ellipse(posX, posY, 20,20);
      line(posX,posY, x, y);
    }
  }
  fill(#FFA652); ellipse(x, y, 20, 20);
}
float posX = -100, posY = -100;
float x, y, vx, vy;
boolean flying = false;
void mousePressed(){
  x = posX = mouseX;
  y = posY = mouseY;
  flying = false;
}
void mouseReleased(){
  vx = posX - mouseX;
  vy = posY - mouseY;
  flying = true;
}
