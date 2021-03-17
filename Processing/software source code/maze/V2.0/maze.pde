//设置迷宫的行数，列数，墙的“厚度”，房间边长（墙的长度）
int rowNum=5, colNum=5, wallWeight=5, sideLength=50;
int tempRowNum=2, tempColNum=2, tempWallWeight=5, tempSideLength=50;
//迷宫左上角座标
int upperLeftCornerX=0, upperLeftCornerY=0;
//设置迷宫起点坐标
int outsetX=0, outsetY=0;
//设置迷宫终点坐标
int endX=rowNum-1, endY=colNum-1;
//“砸墙”的起点
int row=0, col=0;
int page=0;//0开始界面，1设置界面，2迷宫界面，3sweetHomeGo,4关于
int textSizeDivisor=20;
int walkLineWeight=5;
Room[][] room=new Room[150][150];
boolean isFlag=false, startFlag=false;
//版本号
String verson="V2.0";

void setup() {
  PFont myFont;
  myFont= createFont("宋体", 32);
  textFont(myFont);
  size(displayWidth, displayHeight);
  background(255);
  menu();
}

void draw() {

  if (!startFlag) {
    if (ynBreakWall(row, col)) {//从（0，0）开始判断是否砸墙
      breakWall();
    } else if (randomSend()) {//走到死路后随机传送到一个进入过且周围有没进入过的房间的房间
      breakWall();
    }
  }
}


void keyPressed() {
  //loop();
  if (page==2&&(row!=rowNum-1||col!=colNum-1)&&startFlag) {
    whereToGo();
  }
}
void mousePressed() {
  //开始界面
  if (page==0) {
    menuSelect();
  }
  //设置界面
  if (page==1) {
    siteCondirm_Return();
    siteRow();
    siteCol();
    siteWallWeight();
    siteSideLength();
  }
  //迷宫界面
  if (page==2) {
    mazeOptions();
  }
  //岁月鸿沟界面
  if (page==3) {
    sweetHomeGoOptions();
  }
  //关于界面
  if (page==4) {
    aboutOptions();
  }
}
void startDrawMaze() {
  background(255);
  endX=rowNum-1;
  endY=colNum-1;
  //迷宫左上角座标
  upperLeftCornerX=width/20; 
  upperLeftCornerY=height/20;
  init(upperLeftCornerX, upperLeftCornerY, sideLength, wallWeight);
  siteOutset(outsetX, outsetY, endX, endY);
  mazeDraw();
  startFlag=false;
  //loop();
}
//保存
boolean saveMaze() {
  String timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"+nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2)  +"-"+ "row."+rowNum+"col."+colNum; 
  saveFrame(timestamp+"-"+".png");
  return true;
}
//全局初始化
void init(int x, int y, int side, float weight) {
  //创建对象
  for (int rowCount=0; rowCount<rowNum; rowCount++) {
    for (int colCount=0; colCount<colNum; colCount++) {
      room[rowCount][colCount]=new Room();
    }
  }
  //开始初始化对象
  for (int rowCount=0; rowCount<rowNum; rowCount++) {
    for (int colCount=0; colCount<colNum; colCount++) {
      room[rowCount][colCount].init(x+colCount*side, y+rowCount*side, side, weight);
    }
  }
}

//砸墙
void breakWall() {
  //noLoop();
  int wall=0;
  switch(breakWhichWall(row, col))
  {
  case 0: 
    break;
  case 1:
    {
      room[row][col].breakWall("UP", wallWeight);
      row--;
      break;
    }
  case 10:
    {
      room[row][col].breakWall("DOWN", wallWeight);
      row++;
      break;
    }
  case 100:
    {
      room[row][col].breakWall("LEFT", wallWeight);
      col--;
      break;
    }
  case 1000:
    {
      room[row][col].breakWall("RIGHT", wallWeight);
      col++;
      break;
    }
  case 11:
    {
      wall=(int)random(2);
      switch(wall) {
      case 0:
        {
          room[row][col].breakWall("UP", wallWeight);
          row--;
          break;
        }
      case 1:
        { 
          room[row][col].breakWall("DOWN", wallWeight);
          row++;
          break;
        }
      }
      break;
    }
  case 101:
    { 
      wall=(int)random(2);
      switch(wall) {
      case 0:
        {
          room[row][col].breakWall("UP", wallWeight);
          row--;
          break;
        }
      case 1:
        { 
          room[row][col].breakWall("LEFT", wallWeight);
          col--;
          break;
        }
      }
      break;
    }
  case 1001:
    { 
      wall=(int)random(2);
      switch(wall) {
      case 0:
        {
          room[row][col].breakWall("UP", wallWeight);
          row--;
          break;
        }
      case 1:
        { 
          room[row][col].breakWall("RIGHT", wallWeight);
          col++;
          break;
        }
      }
      break;
    }
  case 110:
    { 
      wall=(int)random(2);
      switch(wall) {
      case 0:
        {
          room[row][col].breakWall("LEFT", wallWeight);
          col--;
          break;
        }
      case 1:
        { 
          room[row][col].breakWall("DOWN", wallWeight);
          row++;
          break;
        }
      }
      break;
    }
  case 1010:
    { 
      wall=(int)random(2);

      switch(wall) {
      case 0:
        {
          room[row][col].breakWall("RIGHT", wallWeight);
          col++;
          break;
        }
      case 1:
        { 
          room[row][col].breakWall("DOWN", wallWeight);
          row++;
          break;
        }
      }
      break;
    }
  case 1100:
    { 
      wall=(int)random(2);
      switch(wall) {
      case 0:
        {
          room[row][col].breakWall("LEFT", wallWeight);
          col--;
          break;
        }
      case 1:
        { 
          room[row][col].breakWall("RIGHT", wallWeight);
          col++;
          break;
        }
      }
      break;
    }
  case 111:
    { 
      wall=(int)random(3);
      switch(wall) {
      case 0:
        {
          room[row][col].breakWall("UP", wallWeight);
          row--;
          break;
        }
      case 1:
        { 
          room[row][col].breakWall("DOWN", wallWeight);
          row++;
          break;
        }
      case 2:
        { 
          room[row][col].breakWall("LEFT", wallWeight);
          col--;
          break;
        }
      }
      break;
    }
  case 1101: 
    {
      wall=(int)random(3);
      switch(wall) {
      case 0:
        {
          room[row][col].breakWall("UP", wallWeight);
          row--;
          break;
        }
      case 1:
        { 
          room[row][col].breakWall("LEFT", wallWeight);
          col--;
          break;
        }
      case 2:
        { 
          room[row][col].breakWall("RIGHT", wallWeight);
          col++;
          break;
        }
      }
      break;
    }
  case 1011:
    {
      wall=(int)random(3);
      switch(wall) {
      case 0:
        {
          room[row][col].breakWall("UP", wallWeight);
          row--;
          break;
        }
      case 1:
        {
          room[row][col].breakWall("DOWN", wallWeight);
          row++;
          break;
        }
      case 2:
        { 
          room[row][col].breakWall("RIGHT", wallWeight);
          col++;
          break;
        }
      }
      break;
    }
  case 1110:
    { 
      wall=(int)random(3);
      switch(wall) {
      case 0:
        {
          room[row][col].breakWall("DOWN", wallWeight);
          row++;
          break;
        }
      case 1:
        { 
          room[row][col].breakWall("LEFT", wallWeight);
          col--;
          break;
        }
      case 2:
        { 
          room[row][col].breakWall("RIGHT", wallWeight);
          col++;
          break;
        }
      }
      break;
    }
  case 1111:
    { 
      wall=(int)random(4);
      switch(wall) {
      case 0:
        {
          room[row][col].breakWall("UP", wallWeight);
          row--;
          break;
        }
      case 1:
        { 
          room[row][col].breakWall("DOWN", wallWeight);
          row++;
          break;
        }
      case 2:
        {
          room[row][col].breakWall("LEFT", wallWeight);
          col--;
          break;
        }
      case 3:
        { 
          room[row][col].breakWall("RIGHT", wallWeight);
          col++;
          break;
        }
      }
      break;
    }
  default :
    {
      break;
    }
  }
}

//判断该room是否砸墙
//上!room[row-1][col].ynJoin()  下!room[row+1][col].ynJoin()   左!room[row][col-1].ynJoin()   右!room[row][col+1].ynJoin()
boolean ynBreakWall(int row, int col) {
  boolean flag=false;
  if (!room[row][col].ynJoin()) {
    if ((row>0)&&(row<rowNum-1)&&(col>0)&&(col<colNum-1)&&((!room[row-1][col].ynJoin())||(!room[row+1][col].ynJoin())||(!room[row][col-1].ynJoin())||(!room[row][col+1].ynJoin()))) {//中间
      flag=true;
    } 
    if ((row==0)&&col!=0&&col!=colNum-1&&(!room[row+1][col].ynJoin()||!room[row][col-1].ynJoin()||!room[row][col+1].ynJoin())) {//上边一排
      flag=true;
    } 
    if ((row==rowNum-1)&&col>0&&col<colNum-1&&(!room[row-1][col].ynJoin()||!room[row][col-1].ynJoin()||!room[row][col+1].ynJoin())) {//下边一排
      flag=true;
    } 
    if ((col==0)&&row<rowNum-1&&row>0&&(!room[row][col+1].ynJoin()||!room[row-1][col].ynJoin()||!room[row+1][col].ynJoin())) {//左边一列
      flag=true;
    } 
    if ((col==colNum-1)&&row>0&&row<rowNum-1&&(!room[row][col-1].ynJoin()||!room[row-1][col].ynJoin()||!room[row+1][col].ynJoin() )) {//右边一列
      flag=true;
    } 
    if ((row==0)&&(col==0)&&((!room[row][col+1].ynJoin())||(!room[row+1][col].ynJoin()))) {//左上角
      flag=true;
    } 
    if ((row==0)&&(col==colNum-1)&&((!room[row][col-1].ynJoin())||(!room[row+1][col].ynJoin()))) {//右上角
      flag=true;
    } 
    if ((row==rowNum-1)&&(col==0)&&((!room[row-1][col].ynJoin())||(!room[row][col+1].ynJoin()))) {//左下角
      flag=true;
    } 
    if ((row==rowNum-1)&&(col==colNum-1)&&((!room[row-1][col].ynJoin())||(!room[row][col-1].ynJoin()))) {//右下角
      flag=true;
    }
  }
  //标记进入过该room
  room[row][col].inside();
  return flag;
}
//判断该room应该砸哪个墙
int breakWhichWall(int row, int col) {
  int side=0;
  if ((row>0)&&(row<rowNum-1)&&(col>0)&&(col<colNum-1)) {//中间
    if (!room[row-1][col].ynJoin()) {//上面房间没去过
      side+=1;
    }
    if (!room[row+1][col].ynJoin()) {//下
      side+=10;
    }
    if (!room[row][col-1].ynJoin()) {//左
      side+=100;
    }
    if (!room[row][col+1].ynJoin()) {//右
      side+=1000;
    }
  } else {
    if ((row==0)&&col>0&&col<colNum-1) {//上边一排
      if (!room[row+1][col].ynJoin()) {//下
        side+=10;
      }
      if (!room[row][col-1].ynJoin()) {//左
        side+=100;
      }
      if (!room[row][col+1].ynJoin()) {//右
        side+=1000;
      }
    } 
    if ((row==rowNum-1)&&col>0&&col<colNum-1) {//下边一排
      if (!room[row-1][col].ynJoin()) {//上面房间没去过
        side+=1;
      }
      if (!room[row][col-1].ynJoin()) {//左
        side+=100;
      }
      if (!room[row][col+1].ynJoin()) {//右
        side+=1000;
      }
    } 
    if ((col==0)&&row<rowNum-1&&row>0) {//左边一列
      if (!room[row-1][col].ynJoin()) {//上面房间没去过
        side+=1;
      }
      if (!room[row+1][col].ynJoin()) {//下
        side+=10;
      }
      if (!room[row][col+1].ynJoin()) {//右
        side+=1000;
      }
    } 
    if ((col==colNum-1)&&row>0&&row<rowNum-1) {//右边一列
      if (!room[row-1][col].ynJoin()) {//上面房间没去过
        side+=1;
      }
      if (!room[row+1][col].ynJoin()) {//下
        side+=10;
      }
      if (!room[row][col-1].ynJoin()) {//左
        side+=100;
      }
    } 
    if ((row==0)&&(col==0)) {//左上角
      if (!room[row][col+1].ynJoin()) {
        side+=1000;
      }
      if (!room[row+1][col].ynJoin()) {
        side+=10;
      }
    } 
    if ((row==0)&&(col==colNum-1)) {//右上角
      if (!room[row][col-1].ynJoin()) {
        side+=100;
      }
      if (!room[row+1][col].ynJoin()) {
        side+=10;
      }
    } 
    if ((row==rowNum-1)&&(col==0)) {//左下角
      if (!room[row-1][col].ynJoin()) {
        side+=1;
      }
      if (!room[row][col+1].ynJoin()) {
        side+=1000;
      }
    } 
    if ((row==rowNum-1)&&(col==colNum-1)) {//右下角
      if (!room[row-1][col].ynJoin()) {
        side+=1;
      }
      if (!room[row][col-1].ynJoin()) {
        side+=100;
      }
    }
  }
  return side;
}

//随机传送到房间
boolean randomSend() {
  boolean flag=false;
  while (!flag) {
    row=(int)random(rowNum);
    col=(int)random(colNum);
    if (stopProgram()) {
      break;
    }
    if (room[row][col].ynJoin()) {
      if ((row>0)&&(row<rowNum-1)&&(col>0)&&(col<colNum-1)&&((!room[row-1][col].ynJoin())||(!room[row+1][col].ynJoin())||(!room[row][col-1].ynJoin())||(!room[row][col+1].ynJoin()))) {//中间
        flag=true;
        break;
      }  
      if ((row==0)&&col!=0&&col!=colNum-1&&(!room[row+1][col].ynJoin()||!room[row][col-1].ynJoin()||!room[row][col+1].ynJoin())) {//上边一排
        flag=true;
        break;
      } 
      if ((row==rowNum-1)&&col>0&&col<colNum-1&&(!room[row-1][col].ynJoin()||!room[row][col-1].ynJoin()||!room[row][col+1].ynJoin())) {//下边一排
        flag=true;
        break;
      } 
      if ((col==0)&&row<rowNum-1&&row>0&&(!room[row][col+1].ynJoin()||!room[row-1][col].ynJoin()||!room[row+1][col].ynJoin())) {//左边一列
        flag=true;
        break;
      } 
      if ((col==colNum-1)&&row>0&&row<rowNum-1&&(!room[row][col-1].ynJoin()||!room[row-1][col].ynJoin()||!room[row+1][col].ynJoin() )) {//右边一列
        flag=true;
        break;
      } 
      if ((row==0)&&(col==0)&&((!room[row][col+1].ynJoin())||(!room[row+1][col].ynJoin()))) {//左上角
        flag=true;
        break;
      } 
      if ((row==0)&&(col==colNum-1)&&((!room[row][col-1].ynJoin())||(!room[row+1][col].ynJoin()))) {//右上角
        flag=true;
        break;
      } 
      if ((row==rowNum-1)&&(col==0)&&((!room[row-1][col].ynJoin())||(!room[row][col+1].ynJoin()))) {//左下角
        flag=true;
        break;
      } 
      if ((row==rowNum-1)&&(col==colNum-1)&&((!room[row-1][col].ynJoin())||(!room[row][col-1].ynJoin()))) {//右下角
        flag=true;
        break;
      }
    }
  }

  return flag;
}

/*
区域代号
 0     1      2
 
 3     4      5
 
 6     7      8
 */
//判断传过来的房间在哪个区域
int judgmentArea(int row, int col) {
  if ((row==0)&&(col==0)) {//左上角
    return 0;
  } 
  if ((row==0)&&col>0&&col<colNum-1) {//上边一排
    return 1;
  } 
  if ((row==0)&&(col==colNum-1)) {//右上角
    return 2;
  } 
  if ((col==0)&&row<rowNum-1&&row>0) {//左边一列
    return 3;
  } 
  if ((row>0)&&(row<rowNum-1)&&(col>0)&&(col<colNum-1)) {//中间
    return 4;
  }
  if ((col==colNum-1)&&row>0&&row<rowNum-1) {//右边一列
    return 5;
  } 
  if ((row==rowNum-1)&&(col==0)) {//左下角
    return 6;
  } 
  if ((row==rowNum-1)&&col>0&&col<colNum-1) {//下边一排
    return 7;
  } 
  if ((row==rowNum-1)&&(col==colNum-1)) {//右下角
    return 8;
  }
  return -1;
} 
//标记墙不存在
void markWallDoesNotExist(String side) {
  switch(judgmentArea(row, col)) {
  case 0:
    {
      switch(side) {
      case "DOWN":
        {
          room[row][col].markWall("DOWN");
          room[row+1][col].markWall("UP");
          break;
        }
      case "RIGHT":
        {
          room[row][col].markWall("RIGHT");
          room[row][col+1].markWall("LEFT");
          break;
        }
      }
      break;
    }
  case 1:
    {
      switch(side) {
      case "DOWN":
        {
          room[row][col].markWall("DOWN");
          room[row+1][col].markWall("UP");
          break;
        }
      case "LEFT":
        {
          room[row][col].markWall("LEFT");
          room[row][col-1].markWall("RIGHT");
          break;
        }
      case "RIGHT":
        {
          room[row][col].markWall("RIGHT");
          room[row][col+1].markWall("LEFT");
          break;
        }
      }
      break;
    }
  case 2:
    {
      switch(side) {
      case "DOWN":
        {
          room[row][col].markWall("DOWN");
          room[row+1][col].markWall("UP");
          break;
        }
      case "LEFT":
        {
          room[row][col].markWall("LEFT");
          room[row][col-1].markWall("RIGHT");
          break;
        }
      }
      break;
    }
  case 3:
    {
      switch(side) {
      case "UP":
        {
          room[row][col].markWall("UP");
          room[row-1][col].markWall("DOWN");
          break;
        }
      case "DOWN":
        {
          room[row][col].markWall("DOWN");
          room[row+1][col].markWall("UP");
          break;
        }
      case "RIGHT":
        {
          room[row][col].markWall("RIGHT");
          room[row][col+1].markWall("LEFT");
          break;
        }
      }
      break;
    }
  case 4:
    {
      switch(side) { 
      case "UP":
        {
          room[row][col].markWall("UP");
          room[row-1][col].markWall("DOWN");
          break;
        }
      case "DOWN":
        {
          room[row][col].markWall("DOWN");
          room[row+1][col].markWall("UP");
          break;
        }
      case "LEFT":
        {
          room[row][col].markWall("LEFT");
          room[row][col-1].markWall("RIGHT");
          break;
        }
      case "RIGHT":
        {
          room[row][col].markWall("RIGHT");
          room[row][col+1].markWall("LEFT");
          break;
        }
      }
      break;
    }
  case 5:
    {
      switch(side) {
      case "UP":
        {
          room[row][col].markWall("UP");
          room[row-1][col].markWall("DOWN");
          break;
        }
      case "DOWN":
        {
          room[row][col].markWall("DOWN");
          room[row+1][col].markWall("UP");
          break;
        }
      case "LEFT":
        {
          room[row][col].markWall("LEFT");
          room[row][col-1].markWall("RIGHT");
          break;
        }
      }
      break;
    }
  case 6:
    {
      switch(side) {
      case "UP":
        {
          room[row][col].markWall("UP");
          room[row-1][col].markWall("DOWN");
          break;
        }
      case "RIGHT":
        {
          room[row][col].markWall("RIGHT");
          room[row][col+1].markWall("LEFT");
          break;
        }
      }
      break;
    }
  case 7:
    {
      switch(side) {
      case "UP":
        {
          room[row][col].markWall("UP");
          room[row-1][col].markWall("DOWN");
          break;
        }
      case "LEFT":
        {
          room[row][col].markWall("LEFT");
          room[row][col-1].markWall("RIGHT");
          break;
        }
      case "RIGHT":
        {
          room[row][col].markWall("RIGHT");
          room[row][col+1].markWall("LEFT");
          break;
        }
      }
      break;
    }
  case 8:
    {
      switch(side) {
      case "UP":
        {
          room[row][col].markWall("UP");
          room[row-1][col].markWall("DOWN");
          break;
        }
      case "LEFT":
        {
          room[row][col].markWall("LEFT");
          room[row][col-1].markWall("RIGHT");
          break;
        }
      }
      break;
    }
  }
}
//设置起点和终点
void siteOutset(int outsetX, int outsetY, int endX, int endY) {


  if ((outsetX>0)&&(outsetX<rowNum-1)&&(outsetY>0)&&(outsetY<colNum-1));//中间

  if ((outsetX==0)&&outsetY>0&&outsetY<colNum-1) {//上边一排
    room[outsetX][outsetY].siteOutset("UP", wallWeight);
  } else
    if ((outsetX==rowNum-1)&&(outsetY>0)&&(outsetY<colNum-1)) {//下边一排
      room[outsetX][outsetY].siteOutset("DOWN", wallWeight);
    } else
      if ((outsetY==0)&&outsetX<=rowNum-1&&outsetX>=0) {//左边一列
        room[outsetX][outsetY].siteOutset("LEFT", wallWeight);
      } else
        if ((outsetY==colNum-1)&&outsetX>=0&&outsetX<=rowNum-1) {//右边一列
          room[outsetX][outsetY].siteOutset("RIGHT", wallWeight);
        } 



  if ((endX==0)&&endY>0&&endY<colNum-1) {//上边一排
    room[endX][endY].siteEnd("UP", wallWeight);
  } else
    if ((endX==rowNum-1)&&(endY>0)&&(endY<colNum-1)) {//下边一排
      room[endX][endY].siteEnd("DOWN", wallWeight);
    } else
      if ((endY==0)&&endX<=rowNum-1&&endX>=0) {//左边一列
        room[endX][endY].siteEnd("LEFT", wallWeight);
      } else
        if ((endY==colNum-1)&&endX>=0&&endX<=rowNum-1) {//右边一列
          room[endX][endY].siteEnd("RIGHT", wallWeight);
        }
}
void win() {
  PFont myFont;
  int tSize=width/6;
  myFont= createFont("OCR A Extended", 32);
  textFont(myFont);
  textSize(tSize);
  if (row==rowNum-1&&col==colNum-1) {
    fill(250, 138, 8, 100);
    text("YOU WIN", width/6, height/2);
  }
  myFont= createFont("宋体", 32);
  textFont(myFont);
}
//停止程序，当所有房间走过后。
boolean stopProgram() {
  int rowCount=0, colCount=0;
  for (rowCount=0; rowCount<rowNum; rowCount++) {
    for (colCount=0; colCount<colNum; colCount++) {
      //print(room[rowCount][colCount].ynJoin()+"("+rowCount+","+colCount+")");
      if (!room[rowCount][colCount].ynJoin()) {//如果有任何一个房间没进入，则不停止
        isFlag=false;
        break;
      } else if (room[rowCount][colCount].ynJoin()) {//如果所有房间都进入，则停止
        isFlag=true;
      }
    }
    if (rowCount<rowNum&&colCount<colNum) {
      if (!room[rowCount][colCount].ynJoin()) {//如果有任何一个房间没进入，则不停止
        isFlag=false;
        break;
      }
    }
  }

  if (isFlag) {
    //noLoop();
    row=0;
    col=0;
    startFlag=true;
    return true;
  }
  return false;
}