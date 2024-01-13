import processing.sound.*;
PImage[] diffHair = new PImage[4]; PImage[] hair = new PImage[4]; PImage[] hairB = new PImage[4]; PImage[] hairC = new PImage[4]; PImage[] hairG = new PImage[4]; 
int ci = -1, pi;
PImage[] accc = new PImage[5];//PImage[] Ani;
PImage[] body = new PImage[6]; 
PImage[] framee = new PImage[4];
PImage bg0, bg1, bg2, home; //,gli;
color []C = {#000000, #d74444, #f89b45, #4aa9ee, #614431 };
color []P = {#000000, #004f9e, #a4897c, #f2f080}; //hair
SoundFile bgMusic, poka;   //Gif gli;

void setup(){
  size(1400,1200);   strokeWeight(4);   frameRate(1000);   textSize(50);
  bgMusic=new SoundFile( this, "music.mp3"); bgMusic.loop(); poka=new SoundFile(this, "poka.mp3"); 
  for(int i=0; i<4; i++){framee[i]=loadImage("frame"+ i +".png");diffHair[i]=hair[i] = loadImage("hair"+ i +".png"); hairB[i] = loadImage("hairB"+ i +".png");hairC[i] = loadImage("hairC"+ i +".png");hairG[i] = loadImage("hairG"+ i +".png");}
  for(int i=0; i<5; i++) {body[i] = loadImage("body"+ i +".png"); accc[i] = loadImage("acc"+i+".png");}
  bg0 = loadImage("bg0.png"); bg1 = loadImage("bg1.jpg"); bg2 = loadImage("bg2.png"); home = loadImage("home.png");
  //gli = new Gif(this,"glitter0.gif"); gli.loop(); //Ani = Gif.getPImages(this, "glitter0.gif");
}
int hw=0, ear=0, i=0, state = 0; // 0 -> start 1 -> game;
float ew = 0.0;
boolean head=false, eyes=false, hairr=false, dress=false,acc=false;
boolean hairTrue=false, bodyTrue=false,accTrue=false, eyeC=false, hairrC=false, frameTrue=false, saving = false;;
int headCount = 0, eyesCount = 0, currentHair = 0, currentBody = 0, currentF = 0,currentAcc = 4;
boolean testMouse(float x, float y, float w, float h){
  return mouseX>x && mouseX<y && mouseY>w && mouseY<h;
}
   // int []hair = new hair, []shirt = new shirt;  //float a = 0; //void eye(){  //  a=atan2(mouseY - 752, mouseX - 510);}
void draw(){
  if(state == 0){
    background(bg0);
  }
  if(state == 1 || state==2){
    if(state!=2)background(bg1);
    if(state!=1)background(bg2);
    ellipseMode(CENTER);rectMode(CENTER);imageMode(CENTER);
    fill(#F5E4D7); //膚色
    stroke(#F0CDBD); //膚色邊
    beginShape(); //neck
      ellipse(700,621, 49,30);
      triangle(675,620 ,700,530, 725,620);
      noStroke();ellipse(700,620, 49,30);
    endShape();
    beginShape(); //head & ears
      stroke(#F0CAB8); ellipse(568+ear,500, 25,32); ellipse(832-ear,500, 25,32);  ellipse( 700, 480, 250+hw ,240);    
    endShape();
    pushMatrix();
      translate(0,-10);
      beginShape(); //left eye
        fill(255); noStroke();
        ellipse(648, 510, 45+ew,48+ew); //eye //眼球跟著滑鼠動 (變數)
        strokeWeight(1);stroke(150); fill(C[i]);ellipse(648,510, 25+ew,28+ew);
        noStroke();fill(#F5E4D7);quad(620,500, 670, 503, 670, 483, 620, 480);
        strokeWeight(3);stroke(0); line(622-ew/2,500-ew/2.6, 670+ew/2, 503-ew/2.5); //eyelash           // vertex(678, 500);vertex(675, 503);vertex(672, 506);vertex(669, 509);vertex(666, 510);vertex(663, 511);vertex(660, 511); //vertex(657, 511);vertex(654, 510);vertex(651, 509);vertex(648, 505);vertex(644, 502);vertex(642, 500);
      endShape();
      beginShape(); //right eye
        fill(255); noStroke();
        ellipse(752, 510, 45+ew,48+ew); //eye
        strokeWeight(1);stroke(150);fill(C[i]);ellipse( 752,510, 25+ew,28+ew);//noStroke(); fill(0);ellipse(752+13*cos(a),510+13+sin(a), 25+ew,28+ew);
        noStroke();fill(#F5E4D7);quad(727,503, 774, 500, 774, 480, 727, 483);
        strokeWeight(3);stroke(0); line(728,503-ew/2.6, 776+ew/2, 500-ew/2.5); //eyelash
      endShape();
    popMatrix();  
    beginShape(); //nose
      fill(255); //noStroke();
      line(700, 520, 697,525);
    endShape();
    beginShape(); //mouth
      strokeWeight(2);
      fill(255); 
      line(703, 550, 697,550);
    endShape();
    
    if(state!=2){
    // button
      strokeWeight(4); stroke(#B4789A);
      fill(#DB688B);ellipse(200,145, 150,150); // headButton up -55
        if(testMouse(105 , 295 , 50 ,240))ellipse(200,145, 160,160); fill(255); text("HEAD", 144,160);
      fill(#DB688B); ellipse(200,370 ,150,150); // eyesButton -80
        if(testMouse(105 , 295 , 275 ,465))ellipse(200,370 ,160,160); fill(255); text("EYES", 147,380);
      fill(#DB688B); ellipse(200,595 ,150,150); // hairButton -105
        if(testMouse(105 , 295 , 500 ,690))ellipse(200,595 ,160,160); fill(255); text("HAIR", 146,610);
      fill(#DB688B); ellipse(200,845 ,150,150); // dressButton -105
        if(testMouse(105 , 295 , 725 ,915))ellipse(200,845 ,160,160); fill(255); text("DRESS", 134,865);
      fill(#DB688B); ellipse(200,1070 ,150,150); // accButton -105
        if(testMouse(105 , 295 , 950 ,1140))ellipse(200,1070 ,160,160); fill(255); text("ACC", 155,1090);
      stroke(#da789A);fill(#eb837e); ellipse(1130,1070 ,150,150); // doneButton
        if(testMouse(1025 , 1225 , 950 ,1140))ellipse(1130,1070 ,160,160); fill(255); text("DONE", 1067,1090);
      // buttonc color 
      stroke(#B4789A);
      if(eyes){for(int i=0; i<5; i++){fill(C[i]);rect(1130, 170+i*80, 80, 70); }}
      if(hairr){for(int i=0; i<4; i++){fill(P[i]);rect(1130, 170+i*80, 80, 70); }}
      image(home, 1300, 100, 100,100);   
  }        
    if(hairTrue){ image(diffHair[currentHair], 740, 621, 612+hw,830);}
    if(currentBody==0)image(body[0], 699, 790, 312*4/5-3, 491*4/5);
    if(bodyTrue){ image(body[currentBody], 699, 790, 312*4/5-3, 491*4/5);}
    if(accTrue){
      if(currentAcc == 0)image(accc[0],760,425,122/1.2,87/1.2);
      if(currentAcc == 1)image(accc[1],760,425,155/2,150/2);
      if(currentAcc == 2)image(accc[2],692,450,594/1.7,432/1.7);
      if(currentAcc == 3)image(accc[3],645,420,215/1.8,175/1.8);
      if(currentAcc == 4)image(accc[4],100,100,100,100);
  }
    
    
    if(state==2){
      hairr=false; eyes= false; head=false; dress=false;acc=false;
      image(framee[currentF], 700, 600, 740,1069);
      //image(gli, 700,600, 1300,1100); //image(Ani[(int)(Ani.length/(float)(width)*mouseX)], 700, 600);
      if(saving==false){fill(#DB688B); stroke(#B4789A); ellipse(200,950 ,150,150); // backButton
      if(testMouse(105 , 295 , 880 ,1020))ellipse(200,950 ,160,160);
      fill(255); text("BACK", 140,965);}
    }
  }
}
int p = 1;
void keyPressed() {
  if (keyCode == RIGHT && head && headCount<4) {hw+=2.5; headCount++; ear-=1.5;}
  if (keyCode == LEFT && head && headCount>-5) {hw-=2.5; headCount--; ear+=1.5;} 
  if (keyCode == RIGHT && eyes && eyesCount<5) {ew+=1.0; eyesCount++;}
  if (keyCode == LEFT && eyes && eyesCount>-3) {ew-=1.0; eyesCount--;}
  if (keyCode == RIGHT && hairr ) {currentHair = (currentHair + 1) % 4; hairTrue = true; }
  if (keyCode == LEFT && hairr ) { currentHair = (currentHair -1+4) % 4; hairTrue = true;}
  if (keyCode == RIGHT && dress ) {currentBody = (currentBody + 1) % 5; bodyTrue = true; }
  if (keyCode == LEFT && dress ) { currentBody = (currentBody -1+5) % 5; bodyTrue = true;}
  if (keyCode == RIGHT && acc ) {currentAcc = (currentAcc + 1) % 5; accTrue = true; }
  if (keyCode == LEFT && acc ) { currentAcc = (currentAcc -1+5) % 5; accTrue = true;}
  if(state==2){
    if (keyCode == RIGHT ) {currentF = (currentF + 1) % 4; frameTrue = true; }
    if (keyCode == LEFT ) { currentF = (currentF -1+4) % 4; frameTrue = true;}
  }
  if(key == 's' || key == 'S'){saving=true; draw();saveFrame("photo"+ p +".png"); p++; saving=false;}
}

void mousePressed(){
  poka.play();
  if(state == 0 && !testMouse(1020 , 1200 , 850 ,990)) state = 1;
  
  if(state==1){
    if( testMouse(100 , 300 , 45 ,245)){head= true; eyes=false; hairr=false; dress=false; eyeC=false;acc=false;}
    if( testMouse(100 , 300 , 270 ,470)){ eyes= true; head=false; hairr=false; dress=false; acc=false;}    
    if(eyes)if(testMouse(1090 , 1170 , 135 ,205)||testMouse(1090 , 1170 , 210 ,280)||testMouse(1090 , 1170 , 285 ,355)||testMouse(1090 , 1170 , 360 ,430)||testMouse(1090 , 1170 , 435 ,505))
      {eyeC = true; hairrC =false; ci=0;}  
    if(hairrC==false && eyeC){
      for(int j=0; j<5; j++){
        if(testMouse(1090 , 1170 , 135+j*75 ,205+j*75)&& eyeC && hairrC==false) if(ci == 0) i=j;//pi=j;
    }}
    if( testMouse(100 , 300 , 495 ,695)){
      hairr=true; eyes= false; head=false; dress=false; acc=false; ci=1;}
    if(hairr)if(testMouse(1090 , 1170 , 135 ,205)||testMouse(1090 , 1170 , 210 ,280)||testMouse(1090 , 1170 , 285 ,355)||testMouse(1090 , 1170 , 360 ,430))
    {hairrC = true; ci=1; eyeC = false;}//eyeC = false;}
    if(eyeC == false && hairrC){
      for(int j=0; j<4; j++){
        if(testMouse(1090 , 1170 , 135+j*75 ,205+j*75)&& hairrC && eyeC==false){   
          if(ci == 1){if(j==0)diffHair=hair; if(j==1)diffHair=hairB; if(j==2)diffHair=hairC; if(j==3)diffHair=hairG;}
    }}}
    if(testMouse(100 , 300 , 745 ,885)){dress=true; hairr=false; eyes= false; head=false; eyeC=false;acc=false;}
    if(testMouse(100 , 300 , 955 ,1145)){acc=true;dress=false; hairr=false; eyes= false; head=false; eyeC=false;}
    if(testMouse(1025 , 1215 , 1000 ,1150)){state=2;}
    if(testMouse(1250 , 1350 , 50 ,145)){state=0;}
  }if(state==2)if(mouseX>100 && mouseX<300 && mouseY>850 && mouseY<990)state=1;
}
//void mouseDragged(){
  //testMouse(0,0,0,0);
      //accX = mouseX- img.width/2; accY = mouseY - img.height/2;
//}
