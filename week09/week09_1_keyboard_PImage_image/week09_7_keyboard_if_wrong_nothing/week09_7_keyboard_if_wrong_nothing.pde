PImage img;
int [][] pos={{91,490},{247,525},{178,525},{160,489},{151,456},{194,489},{230,488},{261,490},{322,455},{298,489},{331,489},{368,490},{314,524},{281,524},{357,453},{390,454},{85,456},{185,456},{127,489},{219,457},{288,457},{212,523},{117,456},{143,523},{253,457},{109,522}};
void setup(){
  size(800,600);
  img = loadImage("keyboard.png");
  rectMode(CENTER); // 中心點畫四邊形
}
void draw(){
  background(#FFFFF2); //淡黃
  image(img, 0, 600-266);
  fill(255,0,0, 128);//半透明
  rect(mouseX,mouseY, 28,30, 5); //圓角
  
  fill(0,255,0, 128);
  for(int i=0; i<26;i++){
    if(typing.charAt(ID)-'a' == i)rect(pos[i][0], pos[i][1],28,30,5);
    if(pressed[i])rect(pos[i][0], pos[i][1],28,30,5); // 在pos(x,y)顯示綠色半透明
  } //如有按下再印
  fill(0); //黑字
  textSize(50); //50號字
  text(typing, 50, 50); //要打的
  fill(255,0,0); //紅色
  text(typed+typing.charAt(ID), 50, 100); //現在要打的字,typing.charAt(0)
  fill(0); //黑色
  text(typed, 50, 100);//已經打好的
}
String typing = "printfprintfprintf";
String typed = ""; //一開始打了0個字
int ID = 0; //第幾個字母要被打
boolean [] pressed = new boolean[26]; // Java的陣列宣告都是0或false
void keyPressed(){
  if(key>='a'&&key<='z' && key==typing.charAt(ID)){ //正確才印
    pressed[key-'a']=true; //有按下
    typed += key;
    ID ++ ;
  }else{
    background(255,0,0); //閃一下紅色背景
  }
}
void keyReleased(){
  if(key>='a'&&key<='z')pressed[key-'a']=false; //沒有按下
}
