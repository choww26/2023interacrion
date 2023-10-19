import processing.sound.*; //Sketch->Library打開
//https://processing.org/reference/libraries/sound/index.html
SoundFile file; //
void setup(){
  size(300,300);
  file = new SoundFile(this, "Capybara.mp3");
  file.play();
}
void draw(){
  
}
