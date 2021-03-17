class Room {
  float xpos=0, ypos=0, sideLength=0, numberOfEntries=0;
  boolean flag=false; //是否进入过该room
  boolean upWall=true, downWall=true, leftWall=true, rightWall=true;
  boolean ynWalk=false;//是否走过改room
  float speed=1;//行走的速度,其实改了也不起作用。
  void init(float x, float y, float side, float weight) {
    stroke(0);
    fill(255);
    strokeWeight(weight);
    xpos=x;
    ypos=y;
    sideLength=side;
    rect(x, y, side, side);
    upWall=true;
    downWall=true;
    leftWall=true; 
    rightWall=true;
    flag=false;
    ynWalk=false;
  }
  //砸墙
  void breakWall(String side, int weight) {
    strokeWeight(weight+1);
    stroke(255, 255, 255);
    switch(side) {
    case "UP":
      {
        line(xpos+weight, ypos, xpos+sideLength-weight, ypos);
        markWallDoesNotExist("UP");
        break;
      }
    case "DOWN":
      {
        line(xpos+weight, ypos+sideLength, xpos+sideLength-weight, ypos+sideLength);
        markWallDoesNotExist("DOWN");
        break;
      }
    case "LEFT":
      {
        line(xpos, ypos+weight, xpos, ypos+sideLength-weight);
        markWallDoesNotExist("LEFT");
        break;
      }
    case "RIGHT":
      {
        line(xpos+sideLength, ypos+weight, xpos+sideLength, ypos+sideLength-weight);
        markWallDoesNotExist("RIGHT");
        break;
      }
    }
    //line(xpos, ypos, xpos+sideLength, ypos);
  }
  //行走路线
  void walkLine(String side, int weight, int lineColour) {
    float x=xpos+sideLength/2, y=ypos+sideLength/2;//中心点坐标
    strokeWeight(weight);
    stroke(0, 0, 255);
    switch(side) {
    case "UP":
      {
        for (float i=0; i<sideLength; i+=speed) {
          point(x, y-i);
        }
        ynWalk=true;
        break;
      }
    case "DOWN":
      {
        for (float i=0; i<sideLength; i+=speed) {
          point(x, y+i);
        }
        ynWalk=true;
        break;
      }
    case "LEFT":
      {
        for (float i=0; i<sideLength; i+=speed) {
          point(x-i, y);
        }

        ynWalk=true;
        break;
      }
    case "RIGHT":
      {
        for (float i=0; i<sideLength; i+=speed) {
          point(x+i, y);
        }
        ynWalk=true;
        break;
      }
    }
  }
  //返回的时候清零
  void backWalkLine(String side, int weight) {
    float x=xpos+sideLength/2, y=ypos+sideLength/2;//中心点坐标
    stroke(255);
    strokeWeight(weight);
    switch(side) {
    case "UP":
      {
        for (float i=0; i<sideLength; i+=speed) {
          point(x, y-i);
        }
        ynWalk=false;
        break;
      }
    case "DOWN":
      {
        for (float i=0; i<sideLength; i+=speed) {
          point(x, y+i);
        }
        ynWalk=false;
        break;
      }
    case "LEFT":
      {
        for (float i=0; i<sideLength; i+=speed) {
          point(x-i, y);
        }
        ynWalk=false;
        break;
      }
    case "RIGHT":
      {
        for (float i=0; i<sideLength; i+=speed) {
          point(x+i, y);
        }
        ynWalk=false;
        break;
      }
    }
  }
  //标记墙不存在
  void markWall(String side) {
    switch(side) {
    case "UP":
      {
        upWall=false;
        break;
      }
    case "DOWN":
      {
        downWall=false;
        break;
      }
    case "LEFT":
      {
        leftWall=false;
        break;
      }
    case "RIGHT":
      {
        rightWall=false;
        break;
      }
    }
  }
  //判断墙是否存在
  //如果存在返回true，如果不存在返回flase；
  boolean judgmentWall(String side) {
    switch(side) {
    case "UP":
      {
        if (upWall) {
          return true;
        } else {
          return false;
        }
      }
    case "DOWN":
      {
        if (downWall) {
          return true;
        } else {
          return false;
        }
      }
    case "LEFT":
      {
        if (leftWall) {
          return true;
        } else {
          return false;
        }
      }
    case "RIGHT":
      {
        if (rightWall) {
          return true;
        } else {
          return false;
        }
      }
    }
    return true;
  }


  //标记进入该room
  void inside() {
    flag=true;
    numberOfEntries++;
    //stroke(255, 0, 0);
    //rectMode(CENTER);
    //fill(125);
    //rect(xpos+sideLength/2, ypos+sideLength/2, 5, 5 );
  }
  //返回是否进入了该room
  boolean ynJoin() {
    return flag;
  }
  //返回是否走过该room
  boolean ynWalk() {
    return ynWalk;
  }
  //起点和终点的设置
  void siteOutset(String path, int weight) {
    strokeWeight(weight+1);
    stroke(255, 255, 255);
    textSize(sideLength/2);
    fill(255, 0, 0);
    switch(path) {
    case "UP":
      {
        line(xpos+weight, ypos, xpos+sideLength-weight, ypos);
        text("起点", xpos, ypos-sideLength);
        upWall=true;
        break;
      }
    case "DOWN":
      {
        line(xpos+weight, ypos+sideLength, xpos+sideLength-weight, ypos+sideLength);
        text("起点", xpos, ypos+sideLength);
        downWall=true;
        break;
      }
    case "LEFT":
      {
        line(xpos, ypos+weight, xpos, ypos+sideLength-weight);
        text("起点", xpos-sideLength, ypos);
        leftWall=true;
        break;
      }
    case "RIGHT":
      {
        line(xpos+sideLength, ypos+weight, xpos+sideLength, ypos+sideLength-weight);
        text("起点", xpos+sideLength, ypos);
        rightWall=true;
        break;
      }
    }
  }
  void siteEnd(String path, int weight) {
    textSize(sideLength/2);
    fill(255, 0, 0);
    switch(path) {
    case "UP":
      {
        line(xpos+weight, ypos, xpos+sideLength-weight, ypos);
        text("终点", xpos, ypos+sideLength);
        break;
      }
    case "DOWN":
      {
        line(xpos+weight, ypos+sideLength, xpos+sideLength-weight, ypos+sideLength);
        text("终点", xpos, ypos-sideLength);
        break;
      }
    case "LEFT":
      {
        line(xpos, ypos+weight, xpos, ypos+sideLength-weight);
        text("终点", xpos-sideLength, ypos);
        break;
      }
    case "RIGHT":
      {
        line(xpos+sideLength, ypos+weight, xpos+sideLength, ypos+sideLength-weight);
        text("终点", xpos+sideLength, ypos+sideLength/2);
        break;
      }
    }
  }
}
