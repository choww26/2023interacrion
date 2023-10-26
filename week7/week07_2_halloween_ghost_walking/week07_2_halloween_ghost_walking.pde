void setup(){
  size(400,400);
  background(255);
}
float ghostX = 400, ghostY = 20;
void draw(){
  ellipse(200,200, 15,15);
  if(mousePressed) line(mouseX, mouseY, pmouseX, pmouseY); // 畫線
  ellipse(ghostX, ghostY, 15,15);
  float dx = 200-ghostX,  dy = 200-ghostY,  len = sqrt(dx*dx+dy*dy);
  ghostX += dx/len/3;
  ghostY += dy/len/3;
}
void mouseReleased(){
  background(255);  // 放開滑鼠就把畫面清乾淨
}
