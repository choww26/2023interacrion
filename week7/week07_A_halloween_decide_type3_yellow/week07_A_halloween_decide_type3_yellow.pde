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
  strokeWeight(2); // 鬼和主角的粗細
  stroke(0); // 鬼和主角不要被畫線影響顏色
  ellipse(ghostX, ghostY, 15,15);
  triangle(180, 190, 183, 175, 190, 185);
  triangle(190, 185, 180, 190, 183, 175);
  ellipse(200,200, 50,30); ellipse(190,200, 15,15); ellipse(210,200, 15,15);
  line(195,210, 205, 210);
  fill(0);
  ellipse(190,200, 5,5); ellipse(210,200, 5,5);
  strokeWeight(4);
  
  float dpx=0, dpy=0;
  float rightdown = 0, green_rightup = 0; //右上右下
  float rightup = 0, yellow_rightdown = 0; //右上右下
  boolean green_part1 = false, green_ok=false;
  boolean yellow_part1 = false, yellow_ok=false;
  for(int i=0; i<pt.size()-1; i++){
    PVector p = pt.get(i),  p2 = pt.get(i+1);
    dpx += abs(p2.x - p.x); //累積x的移動量
    dpy += abs(p2.y - p.y); //累積y的移動量
    if( p2.x - p.x > 0 && p2.y -p.y > 0) rightdown+=sqrt(dpx*dpx +dpy*dpy);
    if(green_part1 && p2.x -p.x >0 && p2.y - p.y < 0) green_rightup +=sqrt(dpx*dpx +dpy*dpy);
    if( p2.x - p.x > 0 && p2.y -p.y < 0) rightup+=sqrt(dpx*dpx +dpy*dpy);
    if(yellow_part1 && p2.x -p.x > 0 && p2.y - p.y > 0) yellow_rightdown +=sqrt(dpx*dpx +dpy*dpy);
    // ellipse(p.x, p.y, 10, 10);
    if(green_part1==false && rightdown>150)green_part1 = true;
    else if(green_part1==true && green_rightup>150)green_ok = true;
    if(yellow_part1==false && rightup>150)yellow_part1 = true;
    else if(yellow_part1==true && yellow_rightdown>150)yellow_ok = true;
}
  println(rightdown);
  if(dpx>100 && dpy<40) stroke(255,0,0); // 橫線就紅色
  else if(dpx<40 && dpy>100) stroke(0,0,255); // 直線就藍色
  else if( green_ok ) stroke(0,255,0); // 前半段往右下
  else if( yellow_ok ) stroke(255,255,0); // 前半段往右下
  else stroke(0); //不是就黑色
  for(int i=0; i<pt.size()-1; i++){
    PVector p = pt.get(i),  p2 = pt.get(i+1);
    line(p.x, p.y, p2.x, p2.y); //ellipse(p.x, p.y, 3, 3);
  }
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
