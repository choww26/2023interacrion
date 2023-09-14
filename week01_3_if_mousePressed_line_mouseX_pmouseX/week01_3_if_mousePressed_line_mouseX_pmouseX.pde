//互動模式Interactive Mode (Active Mode)
void setup(){ //設定1次
  size(500,500);
  background(255);//white
}
void draw(){ //每秒畫60次
  if(mousePressed){
    line(mouseX, mouseY, pmouseX, pmouseY);
  }//畫從(滑鼠座標到,之前滑鼠座標)的線
}
