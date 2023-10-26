ArrayList<PVector> pt = new ArrayList<PVector>();
void setup(){
  size(400,400);
  background(255);
}
float ghostX = 400, ghostY = 20;
void mouseDragged(){ //滑鼠拖曳
  pt.add( new PVector(mouseX, mouseY));
}
void draw(){
  background(255);
  fill(255);
  ellipse(200,200, 50,30);
  ellipse(190,200, 15,15);
  ellipse(210,200, 15,15);
  fill(0);
  ellipse(190,200, 5,5);
  ellipse(210,200, 5,5);
  //if(mousePressed) line(mouseX, mouseY, pmouseX, pmouseY); // 畫線
  for(int i=0; i<pt.size()-1; i++){
    PVector p = pt.get(i),  p2 = pt.get(i+1);
    line(p.x, p.y, p2.x, p2.y); //ellipse(p.x, p.y, 3, 3);
  }
  
  ellipse(ghostX, ghostY, 15,15);
  float dx = 200-ghostX,  dy = 200-ghostY,  len = sqrt(dx*dx+dy*dy);
  ghostX += dx/len/3;
  ghostY += dy/len/3;
}
void mouseReleased(){
  //background(255);  // 放開滑鼠就把畫面清乾淨
  for(int i=pt.size()-1; i>=0; i--){  //要用倒過來的loop
    pt.remove(i);
  }
}
