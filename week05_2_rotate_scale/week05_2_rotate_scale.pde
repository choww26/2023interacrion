void setup(){
  size(400,400, P3D); //Processing的3D功能
}
void draw(){
  background(#FFFFF2);
  pushMatrix(); //備份矩陣
    translate(mouseX, mouseY);
    rotateY(radians(mouseX)); //對Y軸轉動 (X座標轉成radians)
    fill(0,255,0); //綠色的面
    box(100); //3D的盒子、方塊
    
    noFill(); //面不要填色
    scale(2); //放大兩倍
    box(100); //因為scale(2);所以會放大
   popMatrix(); //還原矩陣
}
