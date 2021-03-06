void setup() {
  
  //setting
  size(640, 480);
  background(255);
  rectMode(CENTER);
  ellipseMode(CENTER);

  //head
  ellipse(320, 100, 80, 80);//down edge (320, 140)
  bezier(300, 120, 310, 135, 330, 135, 340, 120);//(x1,y1,cx1,cy1,cx2,xy2,x1,y2)  Y 125~145

  //eyse
  fill(0);
  ellipse(300, 95, 20, 40);//down edge (300, 105)
  ellipse(340, 95, 20, 40);

  //body
  fill(189);
  stroke(189);
  rect(320, 200, 60, 100);
  stroke(189);
  ellipse(320, 250, 60, 30);

  //hand
  stroke(0);
  line(290, 175, 240, 100);
  line(290, 176, 240, 101);
  line(290, 177, 240, 102);
  line(350, 175, 400, 225);
  line(350, 176, 400, 226);
  line(350, 177, 400, 227);

  //legs
  fill(189);
  stroke(189);
  triangle(305, 270, 280, 300, 310, 300);
  triangle(335, 270, 330, 300, 360, 300);
}
