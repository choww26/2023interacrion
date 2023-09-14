//互動模式Interactive Mode (Active Mode)
void setup(){ //設定1次
  size(500,500);
  background(200,200,0);
}
void draw(){ //每秒畫60次
  ellipse(mouseX, mouseY, 8, 8);
}
