void setup(){
  size(400,400); 
  myShuffle();
}
void myShuffle(){
  for(int i=0; i<8; i++){
    for(int j=0; j<11; j++){
      cardC[i*11+j] = C[i%4];
      cardN[i*11+j] = j;
    }
  }
  for(int i=0; i<10000; i++){
    int a = int(random(88)), b =int(random(88));
    int temp = cardN[a];
    cardN[a] = cardN[b];
    cardN[b] = temp;
    temp = cardC[a];
    cardC[a] = cardC[b];
    cardC[b] = temp;  
  }
}
//int [][] card = new int[8][11]; //卡片數量
int [] cardN = new int[88]; // card number
int [] cardC = new int[88]; // card color
color [] C = {#FF5555, #FFAA00, #55AA55, #5555FF}; //陣列準備四個顏色

void draw(){
  background(255);
  for(int i=0; i<8; i++){
    for(int j=0; j<11; j++){
      //drawCard(j*32, i*50, C[i%4], j); 
      drawCard(j*32, i*50, cardC[i*11+j], cardN[i*11+j]); 
    }
  } 
}
void drawCard(int x, int y, color c, int n){
  stroke(128); //gray stroke 灰邊框
  fill(255); //白背景
  rect(x, y, 32, 50, 7);
  noStroke();
  fill(c);
  rect(x+3, y+3, 32-5, 50-5, 4);
  
  pushMatrix();
  fill(255);
  translate(x+16, y+25);
  rotate(radians(45)); //轉橢圓的角度
  ellipse(0, 0, 20, 30);
  popMatrix();
  
  textAlign(CENTER,CENTER);
  textSize(9);
  text( n, x+7, y+6); // n 根據j改變卡片號碼
  
  textSize(20);
  fill(c);
  text( n, x+16, y+22);
}
