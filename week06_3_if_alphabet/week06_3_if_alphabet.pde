void setup(){
  size(850,400);
  textSize(50);
}
String line = "Input: ";
void draw(){
  text(line, 50,100);
}
void keyPressed(){
  if(key >= 'A' && key <= 'Z') line +=key;
  if(key >= 'a' && key <= 'z') line += key;
}
