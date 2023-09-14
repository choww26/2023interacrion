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
int w=1;
void keyPressed(){
  if(key=='0') stroke(0,0,0);//black
  if(key=='1') stroke(255,0,0);//red
  if(key=='2') stroke(0,255,0);//green
  if(key=='3') stroke(0,0,255);//blue
  if(key=='s'|| key=='S') save("output.png");//if按下S存檔成output.png
  if(key=='+') strokeWeight(++w);//筆觸加大
  if(key=='-') strokeWeight(--w);
  println(w);
}
