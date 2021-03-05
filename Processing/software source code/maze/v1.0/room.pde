class Room {
  float xpos=0, ypos=0, sideLength=0, numberOfEntries=0;
  boolean flag=false; //是否进入过该room
  void init(float x, float y, float side, float weight) {
    stroke(0);
    fill(255);
    strokeWeight(weight);
    xpos=x;
    ypos=y;
    sideLength=side;
    rect(x, y, side, side);
    fill(255, 0, 0);
  }
  void breakWall(String side, int weight) {

    strokeWeight(weight+1);
    stroke(255, 255, 255);
    switch(side) {
    case "UP":
      {
        line(xpos+weight, ypos, xpos+sideLength-weight, ypos);
        break;
      }
    case "DOWN":
      {
        line(xpos+weight, ypos+sideLength, xpos+sideLength-weight, ypos+sideLength);
        break;
      }
    case "LEFT":
      {
        line(xpos, ypos+weight, xpos, ypos+sideLength-weight);
        break;
      }
    case "RIGHT":
      {
        line(xpos+sideLength, ypos+weight, xpos+sideLength, ypos+sideLength-weight);
        break;
      }
    }
    //line(xpos, ypos, xpos+sideLength, ypos);
  }
  //进入该room
  void inside() {
    flag=true;
    numberOfEntries++;
    //stroke(255, 0, 0);
    //rectMode(CENTER);
    //fill(125);
    //rect(xpos+sideLength/2, ypos+sideLength/2, 5, 5 );
  }
  //是否进入了该room
  boolean ynJoin() {
    return flag;
  }
  void siteOutset(String path) {
    textSize(sideLength/2);
    switch(path) {
    case "UP":
      {
        text("起点", xpos, ypos-sideLength);
        break;
      }
    case "DOWN":
      {
        text("起点", xpos, ypos+sideLength);
        break;
      }
    case "LEFT":
      {
        text("起点", xpos-sideLength, ypos);
        break;
      }
    case "RIGHT":
      {
        text("起点", xpos+sideLength, ypos);
        break;
      }
   
    }
  }
  void siteEnd(String path) {
    textSize(sideLength/2);
    switch(path) {
    case "UP":
      {
        text("终点", xpos, ypos+sideLength);
        break;
      }
    case "DOWN":
      {
        text("终点", xpos, ypos-sideLength);
        break;
      }
    case "LEFT":
      {
        text("终点", xpos-sideLength, ypos);
        break;
      }
    case "RIGHT":
      {
        text("终点", xpos+sideLength, ypos+sideLength/2);
        break;
      }
   
    }
  }
}
