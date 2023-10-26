void setup(){
  size(400,400);
  background(255);
}
void draw(){
  if(mousePressed) line(mouseX, mouseY, pmouseX, pmouseY); // 畫線
}
void mouseReleased(){
  background(255);  // 放開滑鼠就把畫面清乾淨
}
