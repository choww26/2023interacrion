size(400,400);
//noStroke();
colorMode(HSB, 400); //色相最大值400
for(int i=0; i<400; i++){
  for(int j =0; j<400; j++){
    stroke(i, 400, 400); //最濃
    point(i,j);
  }
}
