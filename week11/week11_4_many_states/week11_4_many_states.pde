int state = 0;
void setup(){
  size(400,400);
}
void draw(){
  if(state==0){ //第0關
    background(255);
  }else if(state==1){ //第1關
    background(255,0,0);
  }else if(state==2){ //第2關
    background(0,0,255);
    
  }
}
