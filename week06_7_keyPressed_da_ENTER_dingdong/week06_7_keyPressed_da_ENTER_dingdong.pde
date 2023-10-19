import processing.sound.*; //Sketch->Library打開
SoundFile da, dingdong, ouch; 

void setup(){
  size(850,400);
  textSize(50);
  da = new SoundFile(this, "da.mp3");
  dingdong = new SoundFile(this, "dingdong.mp3");
  ouch = new SoundFile(this, "ouch.mp3");
}
String line = "";
void draw(){
  background(0);
  text("Input: " + line, 50,100);
}
void keyPressed(){
  if(key >= 'A' && key <= 'Z') { line += key; da.play();}
  if(key >= 'a' && key <= 'z') { line += key; da.play();}
  if(key == BACKSPACE && line.length()>0) {
    line = line.substring( 0, line.length()-1);
    ouch.play();
  }
  if(key == ENTER){
    dingdong.play();
  }
}
