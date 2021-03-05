import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class maze extends PApplet {


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

Room[][] room=new Room[150][150];
//int[][] joinRoom=new int[150][150];
boolean isFlag=false, startFlag=true;

public void setup() {
  PFont myFont;
  myFont= createFont("宋体", 32);
  textFont(myFont);
  
  background(255);
  menu();
}

public void draw() {

  if (!startFlag) {
    if (ynBreakWall(row, col)) {//从（0，0）开始判断是否砸墙
      breakWall();
    } else if (randomSend()) {//走到死路后随机传送到一个进入过且周围有没进入过的房间的房间
      breakWall();
    }
  }  //noLoop();
}


public void keyPressed() {
}
public void mousePressed() {
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
public void startDrawMaze() {
  int tSize=height/80;
  background(255);
  endX=rowNum-1;
  endY=colNum-1;
  //迷宫左上角座标
  upperLeftCornerX=width/20; 
  upperLeftCornerY=height/20;
  init(upperLeftCornerX, upperLeftCornerY, sideLength, wallWeight);
  siteOutset(outsetX, outsetY, endX, endY);
  textSize(tSize);
  fill(0);
  text("返回", width/1.02f, height/1.05f, 2*tSize+1, tSize+1);
  tSize=height/40;
  textSize(tSize);
  text("保存", width/4, height/100, 2*tSize+1, tSize+1);
  text("重建", width/4*2, height/100, 2*tSize+1, tSize+1);
  text("设置", width/4*3, height/100, 2*tSize+1, tSize+1);
  startFlag=false;
  loop();
}

public boolean saveMaze() {
  String timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"+nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2)  +"-"+ "row."+rowNum+"col."+colNum; 
  saveFrame(timestamp+"-"+".png");
  return true;
}
//全局初始化
public void init(int x, int y, int side, float weight) {
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
  //初始化数组
  //for (int rowCount=0; rowCount<rowNum; rowCount++) {
  //  for (int colCount=0; colCount<colNum; colCount++) {
  //    joinRoom[rowCount][colCount]=-1;
  //  }
  //}
}

//砸墙
public void breakWall() {
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
public boolean ynBreakWall(int row, int col) {
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
public int breakWhichWall(int row, int col) {
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
public boolean randomSend() {
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

public boolean stopProgram() {
  int rowCount=0, colCount=0;
  for (rowCount=0; rowCount<rowNum; rowCount++) {
    for (colCount=0; colCount<colNum; colCount++) {
      print(room[rowCount][colCount].ynJoin()+"("+rowCount+","+colCount+")");
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
    startFlag=true;
    return true;
  }
  return false;
}

public void siteOutset(int outsetX, int outsetY, int endX, int endY) {


  if ((outsetX>0)&&(outsetX<rowNum-1)&&(outsetY>0)&&(outsetY<colNum-1));//中间

  if ((outsetX==0)&&outsetY>0&&outsetY<colNum-1) {//上边一排
    room[outsetX][outsetY].siteOutset("UP");
    room[outsetX][outsetY].breakWall("UP", wallWeight);
  } else
    if ((outsetX==rowNum-1)&&(outsetY>0)&&(outsetY<colNum-1)) {//下边一排
      room[outsetX][outsetY].siteOutset("DOWN");
      room[outsetX][outsetY].breakWall("DOWN", wallWeight);
    } else
      if ((outsetY==0)&&outsetX<=rowNum-1&&outsetX>=0) {//左边一列
        room[outsetX][outsetY].siteOutset("LEFT");
        room[outsetX][outsetY].breakWall("LEFT", wallWeight);
      } else
        if ((outsetY==colNum-1)&&outsetX>=0&&outsetX<=rowNum-1) {//右边一列
          room[outsetX][outsetY].siteOutset("RIGHT");
          room[outsetX][outsetY].breakWall("RIGHT", wallWeight);
        } 



  if ((endX==0)&&endY>0&&endY<colNum-1) {//上边一排
    room[endX][endY].siteEnd("UP");
    room[endX][endY].breakWall("UP", wallWeight);
  } else
    if ((endX==rowNum-1)&&(endY>0)&&(endY<colNum-1)) {//下边一排
      room[endX][endY].siteEnd("DOWN");
      room[endX][endY].breakWall("DOWN", wallWeight);
    } else
      if ((endY==0)&&endX<=rowNum-1&&endX>=0) {//左边一列
        room[endX][endY].siteEnd("LEFT");
        room[endX][endY].breakWall("LEFT", wallWeight);
      } else
        if ((endY==colNum-1)&&endX>=0&&endX<=rowNum-1) {//右边一列
          room[endX][endY].siteEnd("RIGHT");
          room[endX][endY].breakWall("RIGHT", wallWeight);
        }
}
public void menu() {
  int tSize = height / 15;
  background(44, 98, 173, 0);
  textSize(tSize);
  fill(250, 138, 8);
  startFlag = true;
  text("开始", width / 2 - 100, height / 3, 2 * tSize + 1, tSize + 1);
  tSize = height / 20;
  textSize(tSize);
  text("设置", width / 1.1f, height / 1.2f, 2 * tSize + 1, tSize + 1);
  text("关于", width/1.1f, height/1.1f, 2*tSize+1, tSize+1);
  tSize = height / 50;
  textSize(tSize);
  text("岁月鸿沟", width/1.07f, height/100, 4*tSize+1, tSize+1);
}

public void about() {
  //int high=height/100,speed=1;
  background(46, 84, 151);
  int tSize=height/80;
  textSize(tSize);
  text("返回", width/1.02f, height/1.05f, 2*tSize+1, tSize+1);
  tSize=height/20;
  textSize(tSize);
  fill(255);
  text("SWEET HOME,GO!", width/1000-tSize/6, height/100, tSize-1, 20*tSize+1);
  text("岁", width/1.02f,height/100 , tSize+1, 100*tSize+1);
  text("月", width/1.02f, height/100*25, tSize+1, 100*tSize+1);
  text("鸿", width/1.02f, height/100*50, tSize+1, 100*tSize+1);
  text("沟", width/1.02f, height/100*75, tSize+1, 100*tSize+1);
  text("《N个迷宫的诞生》", width/2-9*tSize/2, height/3);
  tSize=height/40;
  textSize(tSize);
  text("使用语言：Processing", width/3, height/3+height/20);
  text("版本：1.0",width/3,height/2.4f);
  text("",width/3,height/2.25f);
  text("",width/3,height/2.12f);
  text("",width/3,height/2.01f);
  text("",width/3,height/1.91f);
  text("",width/3,height/1.82f);
  }
public void aboutOptions() {
  int tSize=height/80;
  if (mouseButton==LEFT&&mouseX>=width/1.02f&&mouseY>=height/1.05f&&mouseX<=width/1.02f+2*tSize+1&&mouseY<=height/1.05f+tSize+1) {
    startFlag=true;
    page=0;
    menu();
  }
}
public void sweetHomeGo() {
  int tSize=height/30;
  background(46, 84, 151);
  textSize(tSize);
  text("越过岁月鸿沟就是Sweet Home,Go了？是的，不过是另一个岁月鸿沟，英语的。", width/100, height/2.5f-tSize/2);
  text("——惘闻", width/1.1f, height/2);
  tSize=height/80;
  textSize(tSize);
  text("返回", width/1.02f, height/1.05f, 2*tSize+1, tSize+1);
}

public void site() {
  int tSize = height / 30;
  startFlag = true;
  background(255);
  textSize(tSize);
  fill(0);
  text("行数", width / 30, height / 30, 2 * tSize + 1, 1 * tSize + 1);
  text("列数", width / 9, height / 30, 2 * tSize + 1, tSize + 1);
  text("墙宽", width / 5.5f, height / 30, 2 * tSize + 1, tSize + 1);
  text("房间边长", width / 4, height / 30, 4 * tSize + 1, tSize + 1);
  tSize = height / 20;
  textSize(tSize);
  text("确定", width / 1.2f, height / 1.1f, 2 * tSize + 1, tSize + 1);
  text("返回", width / 1.1f, height / 1.1f, 2 * tSize + 1, tSize + 1);
  text("开始", width / 1.15f, height / 1.3f, 2 * tSize + 1, tSize + 1);
  //row
  tSize = height / 45;
  textSize(tSize);
  text("2", width / 30, height / 15, tSize + 1, tSize + 1);
  text("3", width / 30, height / 11.5f, tSize + 1, tSize + 1);
  text("4", width / 30, height / 9.4f, tSize + 1, tSize + 1);
  text("5", width / 30, height / 8, tSize + 1, tSize + 1);
  text("6", width / 30, height / 7, tSize + 1, tSize + 1);
  text("7", width / 30, height / 6.2f, tSize + 1, tSize + 1);
  text("8", width / 30, height / 5.6f, tSize + 1, tSize + 1);
  text("9", width / 30, height / 5.1f, tSize + 1, tSize + 1);
  text("10", width / 30, height / 4.7f, 2 * tSize + 1, tSize + 1);
  text("11", width / 30, height / 4.3f, 2 * tSize + 1, tSize + 1);
  text("12", width / 30, height / 4, 2 * tSize + 1, tSize + 1);
  text("13", width / 30, height / 3.72f, 2 * tSize + 1, tSize + 1);
  text("14", width / 30, height / 3.5f, 2 * tSize + 1, tSize + 1);
  text("15", width / 30, height / 3.3f, 2 * tSize + 1, tSize + 1);
  text("16", width / 30, height / 3.1f, 2 * tSize + 1, tSize + 1);
  text("17", width / 30, height / 2.95f, 2 * tSize + 1, tSize + 1);
  text("18", width / 30, height / 2.8f, 2 * tSize + 1, tSize + 1);
  text("19", width / 30, height / 2.68f, 2 * tSize + 1, tSize + 1);
  text("20", width / 30, height / 2.56f, 2 * tSize + 1, tSize + 1);
  text("21", width / 30, height / 2.44f, 2 * tSize + 1, tSize + 1);
  text("22", width / 30, height / 2.34f, 2 * tSize + 1, tSize + 1);
  text("23", width / 30, height / 2.25f, 2 * tSize + 1, tSize + 1);
  text("24", width / 30, height / 2.17f, 2 * tSize + 1, tSize + 1);
  text("25", width / 30, height / 2.09f, 2 * tSize + 1, tSize + 1);
  text("26", width / 30, height / 2.02f, 2 * tSize + 1, tSize + 1);
  text("27", width / 30, height / 1.958f, 2 * tSize + 1, tSize + 1);
  text("28", width / 30, height / 1.9f, 2 * tSize + 1, tSize + 1);
  text("29", width / 30, height / 1.84f, 2 * tSize + 1, tSize + 1);
  text("30", width / 30, height / 1.78f, 2 * tSize + 1, tSize + 1);
  text("31", width / 30, height / 1.72f, 2 * tSize + 1, tSize + 1);
  text("32", width / 30, height / 1.67f, 2 * tSize + 1, tSize + 1);
  text("33", width / 30, height / 1.62f, 2 * tSize + 1, tSize + 1);
  text("34", width / 30, height / 1.57f, 2 * tSize + 1, tSize + 1);
  text("35", width / 30, height / 1.52f, 2 * tSize + 1, tSize + 1);
  text("36", width / 30, height / 1.48f, 2 * tSize + 1, tSize + 1);
  text("37", width / 30, height / 1.44f, 2 * tSize + 1, tSize + 1);
  text("38", width / 30, height / 1.40f, 2 * tSize + 1, tSize + 1);
  text("39", width / 30, height / 1.36f, 2 * tSize + 1, tSize + 1);
  text("40", width / 30, height / 1.33f, 2 * tSize + 1, tSize + 1);
  text("50", width / 30, height / 1.30f, 2 * tSize + 1, tSize + 1);
  text("60", width / 30, height / 1.27f, 2 * tSize + 1, tSize + 1);
  text("70", width / 30, height / 1.24f, 2 * tSize + 1, tSize + 1);
  text("90", width / 30, height / 1.21f, 2 * tSize + 1, tSize + 1);
  text("100", width / 30, height / 1.18f, 2 * tSize + 1, tSize + 1);
  text("125", width / 30, height / 1.15f, 2 * tSize + 1, tSize + 1);
  text("150", width / 30, height / 1.125f, 2 * tSize + 1, tSize + 1);
  fill(255, 0, 0);
  text("数字变为红色表明你选择了这个数。请勿选择过大的数，可能导致迷宫大小超出屏幕显示区域。点击确定使设置生效！！！", width / 40, height / 1.05f);
  //col
  fill(0);
  text("2", width / 9, height / 15, tSize + 1, tSize + 1);
  text("3", width / 9, height / 11.5f, tSize + 1, tSize + 1);
  text("4", width / 9, height / 9.4f, tSize + 1, tSize + 1);
  text("5", width / 9, height / 8, tSize + 1, tSize + 1);
  text("6", width / 9, height / 7, tSize + 1, tSize + 1);
  text("7", width / 9, height / 6.2f, tSize + 1, tSize + 1);
  text("8", width / 9, height / 5.6f, tSize + 1, tSize + 1);
  text("9", width / 9, height / 5.1f, tSize + 1, tSize + 1);
  text("10", width / 9, height / 4.7f, 2 * tSize + 1, tSize + 1);
  text("11", width / 9, height / 4.3f, 2 * tSize + 1, tSize + 1);
  text("12", width / 9, height / 4, 2 * tSize + 1, tSize + 1);
  text("13", width / 9, height / 3.72f, 2 * tSize + 1, tSize + 1);
  text("14", width / 9, height / 3.5f, 2 * tSize + 1, tSize + 1);
  text("15", width / 9, height / 3.3f, 2 * tSize + 1, tSize + 1);
  text("16", width / 9, height / 3.1f, 2 * tSize + 1, tSize + 1);
  text("17", width / 9, height / 2.95f, 2 * tSize + 1, tSize + 1);
  text("18", width / 9, height / 2.8f, 2 * tSize + 1, tSize + 1);
  text("19", width / 9, height / 2.68f, 2 * tSize + 1, tSize + 1);
  text("20", width / 9, height / 2.56f, 2 * tSize + 1, tSize + 1);
  text("21", width / 9, height / 2.44f, 2 * tSize + 1, tSize + 1);
  text("22", width / 9, height / 2.34f, 2 * tSize + 1, tSize + 1);
  text("23", width / 9, height / 2.25f, 2 * tSize + 1, tSize + 1);
  text("24", width / 9, height / 2.17f, 2 * tSize + 1, tSize + 1);
  text("25", width / 9, height / 2.09f, 2 * tSize + 1, tSize + 1);
  text("26", width / 9, height / 2.02f, 2 * tSize + 1, tSize + 1);
  text("27", width / 9, height / 1.958f, 2 * tSize + 1, tSize + 1);
  text("28", width / 9, height / 1.9f, 2 * tSize + 1, tSize + 1);
  text("29", width / 9, height / 1.84f, 2 * tSize + 1, tSize + 1);
  text("30", width / 9, height / 1.78f, 2 * tSize + 1, tSize + 1);
  text("31", width / 9, height / 1.72f, 2 * tSize + 1, tSize + 1);
  text("32", width / 9, height / 1.67f, 2 * tSize + 1, tSize + 1);
  text("33", width / 9, height / 1.62f, 2 * tSize + 1, tSize + 1);
  text("34", width / 9, height / 1.57f, 2 * tSize + 1, tSize + 1);
  text("35", width / 9, height / 1.52f, 2 * tSize + 1, tSize + 1);
  text("36", width / 9, height / 1.48f, 2 * tSize + 1, tSize + 1);
  text("37", width / 9, height / 1.44f, 2 * tSize + 1, tSize + 1);
  text("38", width / 9, height / 1.40f, 2 * tSize + 1, tSize + 1);
  text("39", width / 9, height / 1.36f, 2 * tSize + 1, tSize + 1);
  text("40", width / 9, height / 1.33f, 2 * tSize + 1, tSize + 1);
  text("50", width / 9, height / 1.30f, 2 * tSize + 1, tSize + 1);
  text("60", width / 9, height / 1.27f, 2 * tSize + 1, tSize + 1);
  text("70", width / 9, height / 1.24f, 2 * tSize + 1, tSize + 1);
  text("90", width / 9, height / 1.21f, 2 * tSize + 1, tSize + 1);
  text("100", width / 9, height / 1.18f, 2 * tSize + 1, tSize + 1);
  text("125", width / 9, height / 1.15f, 2 * tSize + 1, tSize + 1);
  text("150", width / 9, height / 1.125f, 2 * tSize + 1, tSize + 1);
  //wall
  text("1", width / 5.5f, height / 15, tSize + 1, tSize + 1);
  text("2", width / 5.5f, height / 11.5f, tSize + 1, tSize + 1);
  text("3", width / 5.5f, height / 9.4f, tSize + 1, tSize + 1);
  text("4", width / 5.5f, height / 8, tSize + 1, tSize + 1);
  text("5", width / 5.5f, height / 7, tSize + 1, tSize + 1);
  text("6", width / 5.5f, height / 6.2f, tSize + 1, tSize + 1);
  text("7", width / 5.5f, height / 5.6f, tSize + 1, tSize + 1);
  text("8", width / 5.5f, height / 5.1f, tSize + 1, tSize + 1);
  text("9", width / 5.5f, height / 4.7f, 2 * tSize + 1, tSize + 1);
  text("10", width / 5.5f, height / 4.3f, 2 * tSize + 1, tSize + 1);
  //site
  text("5", width /4, height / 15, tSize + 1, tSize + 1);
  text("6", width /4, height / 11.5f, tSize + 1, tSize + 1);
  text("7", width /4, height / 9.4f, tSize + 1, tSize + 1);
  text("8", width /4, height / 8, tSize + 1, tSize + 1);
  text("9", width /4, height / 7, tSize + 1, tSize + 1);
  text("10", width /4, height / 6.2f, tSize + 1, tSize + 1);
  text("20", width /4, height / 5.6f, tSize + 1, tSize + 1);
  text("30", width /4, height / 5.1f, tSize + 1, tSize + 1);
  text("40", width /4, height / 4.7f, 2 * tSize + 1, tSize + 1);
  text("50", width /4, height / 4.3f, 2 * tSize + 1, tSize + 1);
  text("60", width /4, height / 4, 2 * tSize + 1, tSize + 1);
  text("70", width /4, height / 3.72f, 2 * tSize + 1, tSize + 1);
  text("80", width /4, height / 3.5f, 2 * tSize + 1, tSize + 1);
  text("90", width /4, height / 3.3f, 2 * tSize + 1, tSize + 1);
  text("100", width /4, height / 3.1f, 3 * tSize + 1, tSize + 1);
  text("110", width /4, height / 2.95f, 3 * tSize + 1, tSize + 1);
  text("120", width /4, height / 2.8f, 3 * tSize + 1, tSize + 1);
  text("130", width /4, height / 2.68f, 3 * tSize + 1, tSize + 1);
  text("140", width /4, height / 2.56f, 3 * tSize + 1, tSize + 1);
  text("150", width /4, height / 2.44f, 3 * tSize + 1, tSize + 1);
}
//菜单选项检测
public void menuSelect() {
  int tSize = height / 15;
  //开始
  if (mouseButton == LEFT && mouseX >= width / 2 - 100 && mouseY >= height / 3 && (mouseX <= width / 2 - 100 + (2 * tSize + 1)) && (mouseY<= height / 3 + tSize + 1)) {
    page = 2;
    startDrawMaze();
  }
  tSize = height / 20;
  //设置
  if (mouseButton == LEFT && mouseX >= width / 1.1f && mouseY >= height / 1.2f && mouseX <= width / 1.1f + (2 * tSize + 1) && mouseY<= height / 1.2f + tSize + 1) {
    page = 1;
    site();
  }
  //关于
  if (mouseButton == LEFT && mouseX >= width / 1.1f && mouseY >= height / 1.1f && mouseX <= width / 1.1f + (2 * tSize + 1) && mouseY<= height / 1.1f + tSize + 1) {
    page=4;
    about();
  }
  tSize = height / 50;
  if (mouseButton == LEFT && mouseX >= width / 1.07f && mouseY >= height / 100 && mouseX <= width / 1.07f + (4 * tSize + 1) && mouseY<= height / 100 + tSize + 1) {
    page=3;
    sweetHomeGo();
  }
}
//迷宫选项检测
public void mazeOptions() {

  int tSize=height/80;

  if (mouseButton==LEFT&&mouseX>=width/1.02f&&mouseY>=height/1.05f&&mouseX<=width/1.02f+2*tSize+1&&mouseY<=height/1.05f+tSize+1) {
    startFlag=true;
    page=0;
    menu();
  }
  tSize=height/40;
  if (mouseButton==LEFT&&mouseX>=width/4&&mouseY>=height/100&&mouseX<=width/4+2*tSize+1&&mouseY<=height/100+tSize+1) {
    fill(255, 0, 0);
    text("保存", width/4, height/100, 2*tSize+1, tSize+1);
    fill(0);
    if (saveMaze()) {
      text("保存成功", width/4+4*tSize+1, height/100, 4*tSize+1, tSize+1);
    }
  }
  if (mouseButton==LEFT&&mouseX>=width/4*2&&mouseY>=height/100&&mouseX<=width/4*2+2*tSize+1&&mouseY<=height/100+tSize+1) {
    fill(255, 0, 0);
    text("重建", width/3*2, height/100, 2*tSize+1, tSize+1);
    startDrawMaze();
  }
  if (mouseButton==LEFT&&mouseX>=width/4*3&&mouseY>=height/100&&mouseX<=width/4*3+2*tSize+1&&mouseY<=height/100+tSize+1) {
    fill(255, 0, 0);
    text("设置", width/3*2, height/100, 2*tSize+1, tSize+1);
    page=1;
    site();
  }
}
//岁月鸿沟选项检测
public void sweetHomeGoOptions() {
  int tSize=height/80;
  if (mouseButton==LEFT&&mouseX>=width/1.02f&&mouseY>=height/1.05f&&mouseX<=width/1.02f+2*tSize+1&&mouseY<=height/1.05f+tSize+1) {
    startFlag=true;
    page=0;
    menu();
  }
}
//设置选项检测
public void siteCondirm_Return() {
  int tSize = height / 20;
  textSize(tSize);
  if (mouseButton == LEFT && mouseX >= width / 1.2f && mouseY >= height / 1.1f && mouseX <= width / 1.2f + (2 * tSize + 1) && mouseY<= height / 1.1f + (tSize + 1)) {
     rowNum = tempRowNum;
    colNum = tempColNum;
    wallWeight = tempWallWeight;
    sideLength = tempSideLength;
    fill(227, 140, 0);
    text("确定", width / 1.2f, height / 1.1f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 1.1f && mouseY >= height / 1.1f && mouseX <= width / 1.1f + (2 * tSize + 1) && mouseY<= height / 1.1f + (tSize + 1)) {
    fill(227, 140, 0);
    text("返回", width / 1.2f, height / 1.1f, 2 * tSize + 1, tSize + 1);
    page = 0;
    menu();
  }
  if (mouseButton == LEFT && mouseX >= width / 1.15f && mouseY >= height / 1.3f && mouseX <= width / 1.15f + (2 * tSize + 1) && mouseY<= height / 1.3f + (tSize + 1)) {
    fill(227, 140, 0);
    text("开始", width / 1.2f, height / 1.1f, 2 * tSize + 1, tSize + 1);
    page = 2;
    startDrawMaze();
  }
}
public void siteRow() {
  int  tSize = height / 45;
  textSize(tSize);
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 15 && mouseX <= width / 30 + tSize + 1 && mouseY <= height / 15 + tSize + 1) {
    site();
    tempRowNum = 2;
    fill(255, 0, 0);
    text("2", width / 30, height / 15, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 11.5f && mouseX <= width / 30 + tSize + 1 && mouseY <= height / 11.5f + tSize + 1) {
    site();
    tempRowNum = 3;
    fill(255, 0, 0);
    text("3", width / 30, height / 11.5f, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 9.4f && mouseX <= width / 30 + tSize + 1 && mouseY <= height / 9.4f + tSize + 1) {
    site();
    tempRowNum = 4;
    fill(255, 0, 0);
    text("4", width / 30, height / 9.4f, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 8 && mouseX <= width / 30 + tSize + 1 && mouseY <= height / 8 + tSize + 1) {
    site();
    tempRowNum = 5;
    fill(255, 0, 0);
    text("5", width / 30, height / 8, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 7 && mouseX <= width / 30 + tSize + 1 && mouseY <= height / 7+ tSize + 1) {
    site();
    tempRowNum = 6;
    fill(255, 0, 0);
    text("6", width / 30, height / 7, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 6.2f && mouseX <= width / 30 + tSize + 1 && mouseY <= height / 6.2f + tSize + 1) {
    site();
    tempRowNum = 7;
    fill(255, 0, 0);
    text("7", width / 30, height / 6.2f, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 5.6f && mouseX <= width / 30 + tSize + 1 && mouseY <= height / 5.6f + tSize + 1) {
    site();
    tempRowNum = 8;
    fill(255, 0, 0);
    text("8", width / 30, height / 5.6f, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 5.1f && mouseX <= width / 30 + tSize + 1 && mouseY <= height / 5.1f + tSize + 1) {
    site();
    tempRowNum = 9;
    fill(255, 0, 0);
    text("9", width / 30, height / 5.1f, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 4.7f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 4.7f + tSize) {
    site();
    tempRowNum = 10;
    fill(255, 0, 0);
    text("10", width / 30, height / 4.7f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 4.3f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 4.3f + tSize) {
    site();
    tempRowNum = 11;
    fill(255, 0, 0);
    text("11", width / 30, height / 4.3f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 4 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 4 + tSize) {
    site();
    tempRowNum = 12;
    fill(255, 0, 0);
    text("12", width / 30, height / 4, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 3.72f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 3.72f + tSize) {
    site();
    tempRowNum = 13;
    fill(255, 0, 0);
    text("13", width / 30, height / 3.72f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 3.5f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 3.5f + tSize) {
    site();
    tempRowNum = 14;
    fill(255, 0, 0);
    text("14", width / 30, height / 3.5f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 3.3f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 3.3f + tSize) {
    site();
    tempRowNum = 15;
    fill(255, 0, 0);
    text("15", width / 30, height / 3.3f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 3.1f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 3.1f + tSize) {
    site();
    tempRowNum = 16;
    fill(255, 0, 0);
    text("16", width / 30, height / 3.1f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 2.95f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 2.95f + tSize) {
    site();
    tempRowNum = 17;
    fill(255, 0, 0);
    text("17", width / 30, height / 2.95f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 2.8f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 2.8f + tSize) {
    site();
    tempRowNum = 18;
    fill(255, 0, 0);
    text("18", width / 30, height / 2.8f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 2.68f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 2.68f + tSize) {
    site();
    tempRowNum = 19;
    fill(255, 0, 0);
    text("19", width / 30, height / 2.68f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 2.56f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 2.56f + tSize) {
    site();
    tempRowNum = 20;
    fill(255, 0, 0);
    text("20", width / 30, height / 2.56f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 2.44f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 2.44f + tSize) {
    site();
    tempRowNum = 21;
    fill(255, 0, 0);
    text("21", width / 30, height / 2.44f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 2.34f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 2.34f + tSize) {
    site();
    tempRowNum = 22;
    fill(255, 0, 0);
    text("22", width / 30, height / 2.34f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 2.25f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 2.25f + tSize) {
    site();
    tempRowNum = 23;
    fill(255, 0, 0);
    text("23", width / 30, height / 2.25f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 2.17f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 2.17f + tSize) {
    site();
    tempRowNum = 24;
    fill(255, 0, 0);
    text("24", width / 30, height / 2.17f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 2.09f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 2.09f + tSize) {
    site();
    tempRowNum = 25;
    fill(255, 0, 0);
    text("25", width / 30, height / 2.09f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 2.02f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 2.02f + tSize) {
    site();
    tempRowNum = 26;
    fill(255, 0, 0);
    text("26", width / 30, height / 2.02f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.958f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.958f + tSize) {
    site();
    tempRowNum = 27;
    fill(255, 0, 0);
    text("27", width / 30, height / 1.958f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.9f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.9f + tSize) {
    site();
    tempRowNum = 28;
    fill(255, 0, 0);
    text("28", width / 30, height / 1.9f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.84f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.84f + tSize) {
    site();
    tempRowNum = 29;
    fill(255, 0, 0);
    text("29", width / 30, height / 1.84f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.78f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.78f + tSize) {
    site();
    tempRowNum = 30;
    fill(255, 0, 0);
    text("30", width / 30, height / 1.78f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.72f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.72f+ tSize) {
    site();
    tempRowNum = 31;
    fill(255, 0, 0);
    text("31", width / 30, height / 1.72f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.67f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.67f + tSize) {
    site();
    tempRowNum = 32;
    fill(255, 0, 0);
    text("32", width / 30, height / 1.67f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.62f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.62f + tSize) {
    site();
    tempRowNum = 33;
    fill(255, 0, 0);
    text("33", width / 30, height / 1.62f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.57f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.57f + tSize) {
    site();
    tempRowNum = 34;
    fill(255, 0, 0);
    text("34", width / 30, height / 1.57f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.52f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.52f + tSize) {
    site();
    tempRowNum = 35;
    fill(255, 0, 0);
    text("35", width / 30, height / 1.52f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.48f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.48f + tSize) {
    site();
    tempRowNum = 36;
    fill(255, 0, 0);
    text("36", width / 30, height / 1.48f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.44f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.44f + tSize) {
    site();
    tempRowNum = 37;
    fill(255, 0, 0);
    text("37", width / 30, height / 1.44f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.40f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.40f + tSize) {
    site();
    tempRowNum = 38;
    fill(255, 0, 0);
    text("38", width / 30, height / 1.40f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.36f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.36f + tSize) {
    site();
    tempRowNum = 39;
    fill(255, 0, 0);
    text("39", width / 30, height / 1.36f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.33f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.33f + tSize) {
    site();
    tempRowNum = 40;
    fill(255, 0, 0);
    text("40", width / 30, height / 1.33f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.30f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.30f + tSize) {
    site();
    tempRowNum = 50;
    fill(255, 0, 0);
    text("50", width / 30, height / 1.30f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.27f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.27f + tSize) {
    site();
    tempRowNum = 60;
    fill(255, 0, 0);
    text("60", width / 30, height / 1.27f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.24f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.24f + tSize) {
    site();
    tempRowNum = 70;
    fill(255, 0, 0);
    text("70", width / 30, height / 1.24f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.21f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.21f + tSize) {
    site();
    tempRowNum = 90;
    fill(255, 0, 0);
    text("90", width / 30, height / 1.21f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.18f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.18f + tSize) {
    site();
    tempRowNum = 100;
    fill(255, 0, 0);
    text("100", width / 30, height / 1.18f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.15f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.15f + tSize) {
    site();
    tempRowNum = 125;
    fill(255, 0, 0);
    text("125", width / 30, height / 1.15f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.125f && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.125f + tSize) {
    site();
    tempRowNum = 150;
    fill(255, 0, 0);
    text("150", width / 30, height / 1.125f, 2 * tSize + 1, tSize + 1);
  }
}
//col
public void siteCol() {
  int  tSize = height / 45;
  textSize(tSize);


  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 15 && mouseX <= width / 9 + tSize + 1 && mouseY <= height / 15 + tSize + 1) {
    site();
    tempColNum = 2;
    fill(255, 0, 0);
    text("2", width / 9, height / 15, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 11.5f && mouseX <= width / 9 + tSize + 1 && mouseY <= height / 11.5f + tSize + 1) {
    site();
    tempColNum = 3;
    fill(255, 0, 0);
    text("3", width / 9, height / 11.5f, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 9.4f && mouseX <= width / 9 + tSize + 1 && mouseY <= height / 9.4f + tSize + 1) {
    site();
    tempColNum = 4;
    fill(255, 0, 0);
    text("4", width / 9, height / 9.4f, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 8 && mouseX <= width / 9 + tSize + 1 && mouseY <= height / 8 + tSize + 1) {
    site();
    tempColNum = 5;
    fill(255, 0, 0);
    text("5", width / 9, height / 8, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 7 && mouseX <= width / 9 + tSize + 1 && mouseY <= height / 7+ tSize + 1) {
    site();
    tempColNum = 6;
    fill(255, 0, 0);
    text("6", width / 9, height / 7, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 6.2f && mouseX <= width / 9 + tSize + 1 && mouseY <= height / 6.2f + tSize + 1) {
    site();
    tempColNum = 7;
    fill(255, 0, 0);
    text("7", width / 9, height / 6.2f, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 5.6f && mouseX <= width / 9 + tSize + 1 && mouseY <= height / 5.6f + tSize + 1) {
    site();
    tempColNum = 8;
    fill(255, 0, 0);
    text("8", width / 9, height / 5.6f, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 5.1f && mouseX <= width / 9 + tSize + 1 && mouseY <= height / 5.1f + tSize + 1) {
    site();
    tempColNum = 9;
    fill(255, 0, 0);
    text("9", width / 9, height / 5.1f, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 4.7f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 4.7f + tSize) {
    site();
    tempColNum = 10;
    fill(255, 0, 0);
    text("10", width / 9, height / 4.7f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 4.3f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 4.3f + tSize) {
    site();
    tempColNum = 11;
    fill(255, 0, 0);
    text("11", width / 9, height / 4.3f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 4 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 4 + tSize) {
    site();
    tempColNum = 12;
    fill(255, 0, 0);
    text("12", width / 9, height / 4, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 3.72f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 3.72f + tSize) {
    site();
    tempColNum = 13;
    fill(255, 0, 0);
    text("13", width / 9, height / 3.72f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 3.5f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 3.5f + tSize) {
    site();
    tempColNum = 14;
    fill(255, 0, 0);
    text("14", width / 9, height / 3.5f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 3.3f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 3.3f + tSize) {
    site();
    tempColNum = 15;
    fill(255, 0, 0);
    text("15", width / 9, height / 3.3f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 3.1f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 3.1f + tSize) {
    site();
    tempColNum = 16;
    fill(255, 0, 0);
    text("16", width / 9, height / 3.1f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 2.95f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 2.95f + tSize) {
    site();
    tempColNum = 17;
    fill(255, 0, 0);
    text("17", width / 9, height / 2.95f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 2.8f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 2.8f + tSize) {
    site();
    tempColNum = 18;
    fill(255, 0, 0);
    text("18", width / 9, height / 2.8f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 2.68f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 2.68f + tSize) {
    site();
    tempColNum = 19;
    fill(255, 0, 0);
    text("19", width / 9, height / 2.68f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 2.56f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 2.56f + tSize) {
    site();
    tempColNum = 20;
    fill(255, 0, 0);
    text("20", width / 9, height / 2.56f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 2.44f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 2.44f + tSize) {
    site();
    tempColNum = 21;
    fill(255, 0, 0);
    text("21", width / 9, height / 2.44f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 2.34f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 2.34f + tSize) {
    site();
    tempColNum = 22;
    fill(255, 0, 0);
    text("22", width / 9, height / 2.34f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 2.25f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 2.25f + tSize) {
    site();
    tempColNum = 23;
    fill(255, 0, 0);
    text("23", width / 9, height / 2.25f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 2.17f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 2.17f + tSize) {
    site();
    tempColNum = 24;
    fill(255, 0, 0);
    text("24", width / 9, height / 2.17f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 2.09f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 2.09f + tSize) {
    site();
    tempColNum = 25;
    fill(255, 0, 0);
    text("25", width / 9, height / 2.09f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 2.02f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 2.02f + tSize) {
    site();
    tempColNum = 26;
    fill(255, 0, 0);
    text("26", width / 9, height / 2.02f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.958f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.958f + tSize) {
    site();
    tempColNum = 27;
    fill(255, 0, 0);
    text("27", width / 9, height / 1.958f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.9f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.9f + tSize) {
    site();
    tempColNum = 28;
    fill(255, 0, 0);
    text("28", width / 9, height / 1.9f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.84f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.84f + tSize) {
    site();
    tempColNum = 29;
    fill(255, 0, 0);
    text("29", width / 9, height / 1.84f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.78f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.78f + tSize) {
    site();
    tempColNum = 30;
    fill(255, 0, 0);
    text("30", width / 9, height / 1.78f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.72f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.72f+ tSize) {
    site();
    tempColNum = 31;
    fill(255, 0, 0);
    text("31", width / 9, height / 1.72f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.67f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.67f + tSize) {
    site();
    tempColNum = 32;
    fill(255, 0, 0);
    text("32", width / 9, height / 1.67f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.62f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.62f + tSize) {
    site();
    tempColNum = 33;
    fill(255, 0, 0);
    text("33", width / 9, height / 1.62f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.57f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.57f + tSize) {
    site();
    tempColNum = 34;
    fill(255, 0, 0);
    text("34", width / 9, height / 1.57f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.52f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.52f + tSize) {
    site();
    tempColNum = 35;
    fill(255, 0, 0);
    text("35", width / 9, height / 1.52f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.48f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.48f + tSize) {
    site();
    tempColNum = 36;
    fill(255, 0, 0);
    text("36", width / 9, height / 1.48f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.44f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.44f + tSize) {
    site();
    tempColNum = 37;
    fill(255, 0, 0);
    text("37", width / 9, height / 1.44f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.40f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.40f + tSize) {
    site();
    tempColNum = 38;
    fill(255, 0, 0);
    text("38", width / 9, height / 1.40f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.36f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.36f + tSize) {
    site();
    tempColNum = 39;
    fill(255, 0, 0);
    text("39", width / 9, height / 1.36f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.33f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.33f + tSize) {
    site();
    tempColNum = 40;
    fill(255, 0, 0);
    text("40", width / 9, height / 1.33f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.9f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.9f + tSize) {
    site();
    tempColNum = 50;
    fill(255, 0, 0);
    text("50", width / 9, height / 1.9f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.27f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.27f + tSize) {
    site();
    tempColNum = 60;
    fill(255, 0, 0);
    text("60", width / 9, height / 1.27f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.24f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.24f + tSize) {
    site();
    tempColNum = 70;
    fill(255, 0, 0);
    text("70", width / 9, height / 1.24f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.21f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.21f + tSize) {
    site();
    tempColNum = 90;
    fill(255, 0, 0);
    text("90", width / 9, height / 1.21f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.18f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.18f + tSize) {
    site();
    tempColNum = 100;
    fill(255, 0, 0);
    text("100", width / 9, height / 1.18f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.15f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.15f + tSize) {
    site();
    tempColNum = 125;
    fill(255, 0, 0);
    text("125", width / 9, height / 1.15f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.125f && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.125f + tSize) {
    site();
    tempColNum = 150;
    fill(255, 0, 0);
    text("150", width / 9, height / 1.125f, 2 * tSize + 1, tSize + 1);
  }
}
public void siteWallWeight() {
  int  tSize = height / 45;
  textSize(tSize);

  if (mouseButton == LEFT && mouseX >= width / 5.5f && mouseY >= height / 15 && mouseX <= width / 5.5f + tSize + 1 && mouseY <= height / 15 + tSize + 1) {
    site();
    tempWallWeight = 1;
    fill(255, 0, 0);
    text("1", width / 5.5f, height / 15, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 5.5f && mouseY >= height / 11.5f && mouseX <= width / 5.5f + tSize + 1 && mouseY <= height / 11.5f + tSize + 1) {
    site();
    tempWallWeight = 2;
    fill(255, 0, 0);
    text("2", width / 5.5f, height / 11.5f, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 5.5f && mouseY >= height / 9.4f && mouseX <= width / 5.5f + tSize + 1 && mouseY <= height / 9.4f + tSize + 1) {
    site();
    tempWallWeight = 3;
    fill(255, 0, 0);
    text("3", width / 5.5f, height / 9.4f, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 5.5f && mouseY >= height / 8 && mouseX <= width / 5.5f + tSize + 1 && mouseY <= height / 8 + tSize + 1) {
    site();
    tempWallWeight = 4;
    fill(255, 0, 0);
    text("4", width / 5.5f, height / 8, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 5.5f && mouseY >= height / 7 && mouseX <= width / 5.5f + tSize + 1 && mouseY <= height / 7+ tSize + 1) {
    site();
    tempWallWeight = 5;
    fill(255, 0, 0);
    text("5", width / 5.5f, height / 7, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 5.5f && mouseY >= height / 6.2f && mouseX <= width / 5.5f + tSize + 1 && mouseY <= height / 6.2f + tSize + 1) {
    site();
    tempWallWeight = 6;
    fill(255, 0, 0);
    text("6", width / 5.5f, height / 6.2f, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 5.5f && mouseY >= height / 5.6f && mouseX <= width / 5.5f + tSize + 1 && mouseY <= height / 5.6f + tSize + 1) {
    site();
    tempWallWeight = 7;
    fill(255, 0, 0);
    text("7", width / 5.5f, height / 5.6f, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 5.5f && mouseY >= height / 5.1f && mouseX <= width / 5.5f + tSize + 1 && mouseY <= height / 5.1f + tSize + 1) {
    site();
    tempWallWeight = 8;
    fill(255, 0, 0);
    text("8", width / 5.5f, height / 5.1f, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 5.5f && mouseY >= height / 4.7f && mouseX <= width / 5.5f + tSize + 1 && mouseY <= height / 4.7f + tSize) {
    site();
    tempWallWeight = 9;
    fill(255, 0, 0);
    text("9", width / 5.5f, height / 4.7f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 5.5f && mouseY >= height / 4.3f && mouseX <= width / 5.5f + 2 * tSize + 1 && mouseY <= height / 4.3f + tSize) {
    site();
    tempWallWeight = 10;
    fill(255, 0, 0);
    text("10", width / 5.5f, height / 4.3f, 2 * tSize + 1, tSize + 1);
  }
}
public void siteSideLength() {
  int  tSize = height / 45;
  textSize(tSize);
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 15 && mouseX <= width / 4 + tSize + 1 && mouseY <= height / 15 + tSize + 1) {
    site();
    tempSideLength = 5;
    fill(255, 0, 0);
    text("5", width / 4, height / 15, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 11.5f && mouseX <= width / 4 + tSize + 1 && mouseY <= height / 11.5f + tSize + 1) {
    site();
    tempSideLength = 6;
    fill(255, 0, 0);
    text("6", width / 4, height / 11.5f, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 9.4f && mouseX <= width / 4 + tSize + 1 && mouseY <= height / 9.4f + tSize + 1) {
    site();
    tempSideLength = 7;
    fill(255, 0, 0);
    text("7", width / 4, height / 9.4f, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 8 && mouseX <= width / 4 + tSize + 1 && mouseY <= height / 8 + tSize + 1) {
    site();
    tempSideLength = 8;
    fill(255, 0, 0);
    text("8", width / 4, height / 8, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 7 && mouseX <= width / 4 + tSize + 1 && mouseY <= height / 7+ tSize + 1) {
    site();
    tempSideLength = 9;
    fill(255, 0, 0);
    text("9", width / 4, height / 7, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 6.2f && mouseX <= width / 4 + 2*tSize + 1 && mouseY <= height / 6.2f + tSize + 1) {
    site();
    tempSideLength = 10;
    fill(255, 0, 0);
    text("10", width / 4, height / 6.2f, 2* tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 5.6f && mouseX <= width / 4 + 2*tSize + 1 && mouseY <= height / 5.6f + tSize + 1) {
    site();
    tempSideLength = 20;
    fill(255, 0, 0);
    text("20", width / 4, height / 5.6f, 2* tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 5.1f && mouseX <= width / 4 +2* tSize + 1 && mouseY <= height / 5.1f + tSize + 1) {
    site();
    tempSideLength = 30;
    fill(255, 0, 0);
    text("30", width / 4, height / 5.1f, 2* tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 4.7f && mouseX <= width / 4 + 2 * tSize + 1 && mouseY <= height / 4.7f + tSize) {
    site();
    tempSideLength = 40;
    fill(255, 0, 0);
    text("40", width / 4, height / 4.7f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 4.3f && mouseX <= width / 4 + 2 * tSize + 1 && mouseY <= height / 4.3f + tSize) {
    site();
    tempSideLength = 50;
    fill(255, 0, 0);
    text("50", width / 4, height / 4.3f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 4 && mouseX <= width / 4 + 2 * tSize + 1 && mouseY <= height / 4 + tSize) {
    site();
    tempSideLength = 60;
    fill(255, 0, 0);
    text("60", width / 4, height / 4, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 3.72f && mouseX <= width / 4 + 2 * tSize + 1 && mouseY <= height / 3.72f + tSize) {
    site();
    tempSideLength = 70;
    fill(255, 0, 0);
    text("70", width / 4, height / 3.72f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 3.5f && mouseX <= width / 4 + 2 * tSize + 1 && mouseY <= height / 3.5f + tSize) {
    site();
    tempSideLength = 80;
    fill(255, 0, 0);
    text("80", width / 4, height / 3.5f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 3.3f && mouseX <= width / 4 + 2 * tSize + 1 && mouseY <= height / 3.3f + tSize) {
    site();
    tempSideLength = 90;
    fill(255, 0, 0);
    text("90", width / 4, height / 3.3f, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 3.1f && mouseX <= width / 4 + 3 * tSize + 1 && mouseY <= height / 3.1f + tSize) {
    site();
    tempSideLength = 100;
    fill(255, 0, 0);
    text("100", width / 4, height / 3.1f, 3 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 2.95f && mouseX <= width / 4 + 3 * tSize + 1 && mouseY <= height / 2.95f + tSize) {
    site();
    tempSideLength = 110;
    fill(255, 0, 0);
    text("110", width / 4, height / 2.95f, 3 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 2.8f && mouseX <= width / 4 + 3 * tSize + 1 && mouseY <= height / 2.8f + tSize) {
    site();
    tempSideLength = 120;
    fill(255, 0, 0);
    text("120", width / 4, height / 2.8f, 3 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 2.68f && mouseX <= width / 4 + 3 * tSize + 1 && mouseY <= height / 2.68f + tSize) {
    site();
    tempSideLength = 130;
    fill(255, 0, 0);
    text("130", width / 4, height / 2.68f, 3 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 2.56f && mouseX <= width / 4 + 3 * tSize + 1 && mouseY <= height / 2.56f + tSize) {
    site();
    tempSideLength = 140;
    fill(255, 0, 0);
    text("140", width / 4, height / 2.56f, 3 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 2.44f && mouseX <= width / 4 + 3 * tSize + 1 && mouseY <= height / 2.44f + tSize) {
    site();
    tempSideLength = 150;
    fill(255, 0, 0);
    text("150", width / 4, height / 2.44f, 3 * tSize + 1, tSize + 1);
  }
}
class Room {
  float xpos=0, ypos=0, sideLength=0, numberOfEntries=0;
  boolean flag=false; //是否进入过该room
  public void init(float x, float y, float side, float weight) {
    stroke(0);
    fill(255);
    strokeWeight(weight);
    xpos=x;
    ypos=y;
    sideLength=side;
    rect(x, y, side, side);
    fill(255, 0, 0);
  }
  public void breakWall(String side, int weight) {

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
  public void inside() {
    flag=true;
    numberOfEntries++;
    //stroke(255, 0, 0);
    //rectMode(CENTER);
    //fill(125);
    //rect(xpos+sideLength/2, ypos+sideLength/2, 5, 5 );
  }
  //是否进入了该room
  public boolean ynJoin() {
    return flag;
  }
  public void siteOutset(String path) {
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
  public void siteEnd(String path) {
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
  public void settings() {  size(displayWidth, displayHeight); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "maze" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
