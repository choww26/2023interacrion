void setup(){
  size(400,400); 
}

int [][] card = new int[8][11]; //卡片數量
color [] C = {#FF5555, #FFAA00, #55AA55, #5555FF}; //陣列準備四個顏色

void draw(){
  background(255);
  for(int i=0; i<8; i++){
    for(int j=0; j<11; j++){
      fill(C[i%4]); // 用列數取顏色
      rect(j*30, i*50, 32, 50); //卡片大小
    }
  }
}
