//菜单选项检测
void menuSelect() {
  int tSize = height / 15;
  //开始
  if (mouseButton == LEFT && mouseX >= width / 2 - 100 && mouseY >= height / 3 && (mouseX <= width / 2 - 100 + (2 * tSize + 1)) && (mouseY<= height / 3 + tSize + 1)) {
    page = 2;
    startDrawMaze();
  }
  tSize = height / 20;
  //设置
  if (mouseButton == LEFT && mouseX >= width / 1.1 && mouseY >= height / 1.2 && mouseX <= width / 1.1 + (2 * tSize + 1) && mouseY<= height / 1.2 + tSize + 1) {
    page = 1;
    site();
  }
  //关于
  if (mouseButton == LEFT && mouseX >= width / 1.1 && mouseY >= height / 1.1 && mouseX <= width / 1.1 + (2 * tSize + 1) && mouseY<= height / 1.1 + tSize + 1) {
    page=4;
    about();
  }
  tSize = height / 50;
  if (mouseButton == LEFT && mouseX >= width / 1.07 && mouseY >= height / 100 && mouseX <= width / 1.07 + (4 * tSize + 1) && mouseY<= height / 100 + tSize + 1) {
    page=3;
    sweetHomeGo();
  }
}
//迷宫选项检测
void mazeOptions() {

  int tSize=height/80;

  if (mouseButton==LEFT&&mouseX>=width/1.02&&mouseY>=height/1.05&&mouseX<=width/1.02+2*tSize+1&&mouseY<=height/1.05+tSize+1) {
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
void sweetHomeGoOptions() {
  int tSize=height/80;
  if (mouseButton==LEFT&&mouseX>=width/1.02&&mouseY>=height/1.05&&mouseX<=width/1.02+2*tSize+1&&mouseY<=height/1.05+tSize+1) {
    startFlag=true;
    page=0;
    menu();
  }
}
//设置选项检测
void siteCondirm_Return() {
  int tSize = height / 20;
  textSize(tSize);
  if (mouseButton == LEFT && mouseX >= width / 1.2 && mouseY >= height / 1.12 && mouseX <= width / 1.2 + (2 * tSize + 1) && mouseY<= height / 1.1 + (tSize + 1)) {
     rowNum = tempRowNum;
    colNum = tempColNum;
    wallWeight = tempWallWeight;
    sideLength = tempSideLength;
    fill(227, 140, 0);
    text("确定", width / 1.2, height / 1.12, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 1.1 && mouseY >= height / 1.12 && mouseX <= width / 1.1 + (2 * tSize + 1) && mouseY<= height / 1.1 + (tSize + 1)) {
    fill(227, 140, 0);
    text("返回", width / 1.2, height / 1.12, 2 * tSize + 1, tSize + 1);
    page = 0;
    menu();
  }
  if (mouseButton == LEFT && mouseX >= width / 1.15 && mouseY >= height / 1.3 && mouseX <= width / 1.15 + (2 * tSize + 1) && mouseY<= height / 1.3 + (tSize + 1)) {
    fill(227, 140, 0);
    text("开始", width / 1.2, height / 1.1, 2 * tSize + 1, tSize + 1);
    page = 2;
    startDrawMaze();
  }
}
void siteRow() {
  int  tSize = height / 45;
  textSize(tSize);
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 15 && mouseX <= width / 30 + tSize + 1 && mouseY <= height / 15 + tSize + 1) {
    site();
    tempRowNum = 2;
    fill(255, 0, 0);
    text("2", width / 30, height / 15, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 11.5 && mouseX <= width / 30 + tSize + 1 && mouseY <= height / 11.5 + tSize + 1) {
    site();
    tempRowNum = 3;
    fill(255, 0, 0);
    text("3", width / 30, height / 11.5, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 9.42 && mouseX <= width / 30 + tSize + 1 && mouseY <= height / 9.4 + tSize + 1) {
    site();
    tempRowNum = 4;
    fill(255, 0, 0);
    text("4", width / 30, height / 9.42, tSize + 1, tSize + 1);
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
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 6.2 && mouseX <= width / 30 + tSize + 1 && mouseY <= height / 6.2 + tSize + 1) {
    site();
    tempRowNum = 7;
    fill(255, 0, 0);
    text("7", width / 30, height / 6.2, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 5.6 && mouseX <= width / 30 + tSize + 1 && mouseY <= height / 5.6 + tSize + 1) {
    site();
    tempRowNum = 8;
    fill(255, 0, 0);
    text("8", width / 30, height / 5.6, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 5.1 && mouseX <= width / 30 + tSize + 1 && mouseY <= height / 5.1 + tSize + 1) {
    site();
    tempRowNum = 9;
    fill(255, 0, 0);
    text("9", width / 30, height / 5.1, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 4.7 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 4.7 + tSize) {
    site();
    tempRowNum = 10;
    fill(255, 0, 0);
    text("10", width / 30, height / 4.7, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 4.3 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 4.3 + tSize) {
    site();
    tempRowNum = 11;
    fill(255, 0, 0);
    text("11", width / 30, height / 4.3, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 4 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 4 + tSize) {
    site();
    tempRowNum = 12;
    fill(255, 0, 0);
    text("12", width / 30, height / 4, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 3.72 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 3.72 + tSize) {
    site();
    tempRowNum = 13;
    fill(255, 0, 0);
    text("13", width / 30, height / 3.72, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 3.5 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 3.5 + tSize) {
    site();
    tempRowNum = 14;
    fill(255, 0, 0);
    text("14", width / 30, height / 3.5, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 3.3 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 3.3 + tSize) {
    site();
    tempRowNum = 15;
    fill(255, 0, 0);
    text("15", width / 30, height / 3.3, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 3.1 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 3.1 + tSize) {
    site();
    tempRowNum = 16;
    fill(255, 0, 0);
    text("16", width / 30, height / 3.1, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 2.95 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 2.95 + tSize) {
    site();
    tempRowNum = 17;
    fill(255, 0, 0);
    text("17", width / 30, height / 2.95, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 2.8 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 2.8 + tSize) {
    site();
    tempRowNum = 18;
    fill(255, 0, 0);
    text("18", width / 30, height / 2.8, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 2.68 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 2.68 + tSize) {
    site();
    tempRowNum = 19;
    fill(255, 0, 0);
    text("19", width / 30, height / 2.68, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 2.56 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 2.56 + tSize) {
    site();
    tempRowNum = 20;
    fill(255, 0, 0);
    text("20", width / 30, height / 2.56, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 2.44 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 2.44 + tSize) {
    site();
    tempRowNum = 21;
    fill(255, 0, 0);
    text("21", width / 30, height / 2.44, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 2.34 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 2.34 + tSize) {
    site();
    tempRowNum = 22;
    fill(255, 0, 0);
    text("22", width / 30, height / 2.34, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 2.25 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 2.25 + tSize) {
    site();
    tempRowNum = 23;
    fill(255, 0, 0);
    text("23", width / 30, height / 2.25, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 2.171 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 2.17 + tSize) {
    site();
    tempRowNum = 24;
    fill(255, 0, 0);
    text("24", width / 30, height / 2.171, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 2.09 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 2.09 + tSize) {
    site();
    tempRowNum = 25;
    fill(255, 0, 0);
    text("25", width / 30, height / 2.09, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 2.02 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 2.02 + tSize) {
    site();
    tempRowNum = 26;
    fill(255, 0, 0);
    text("26", width / 30, height / 2.02, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.958 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.958 + tSize) {
    site();
    tempRowNum = 27;
    fill(255, 0, 0);
    text("27", width / 30, height / 1.958, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.9 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.9 + tSize) {
    site();
    tempRowNum = 28;
    fill(255, 0, 0);
    text("28", width / 30, height / 1.9, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.84 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.84 + tSize) {
    site();
    tempRowNum = 29;
    fill(255, 0, 0);
    text("29", width / 30, height / 1.84, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.78 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.78 + tSize) {
    site();
    tempRowNum = 30;
    fill(255, 0, 0);
    text("30", width / 30, height / 1.78, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.72 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.72+ tSize) {
    site();
    tempRowNum = 31;
    fill(255, 0, 0);
    text("31", width / 30, height / 1.72, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.67 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.67 + tSize) {
    site();
    tempRowNum = 32;
    fill(255, 0, 0);
    text("32", width / 30, height / 1.67, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.62 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.62 + tSize) {
    site();
    tempRowNum = 33;
    fill(255, 0, 0);
    text("33", width / 30, height / 1.62, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.57 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.57 + tSize) {
    site();
    tempRowNum = 34;
    fill(255, 0, 0);
    text("34", width / 30, height / 1.57, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.52 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.52 + tSize) {
    site();
    tempRowNum = 35;
    fill(255, 0, 0);
    text("35", width / 30, height / 1.52, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.48 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.48 + tSize) {
    site();
    tempRowNum = 36;
    fill(255, 0, 0);
    text("36", width / 30, height / 1.48, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.44 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.44 + tSize) {
    site();
    tempRowNum = 37;
    fill(255, 0, 0);
    text("37", width / 30, height / 1.44, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.40 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.40 + tSize) {
    site();
    tempRowNum = 38;
    fill(255, 0, 0);
    text("38", width / 30, height / 1.40, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.36 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.36 + tSize) {
    site();
    tempRowNum = 39;
    fill(255, 0, 0);
    text("39", width / 30, height / 1.36, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.33 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.33 + tSize) {
    site();
    tempRowNum = 40;
    fill(255, 0, 0);
    text("40", width / 30, height / 1.33, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.30 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.30 + tSize) {
    site();
    tempRowNum = 50;
    fill(255, 0, 0);
    text("50", width / 30, height / 1.30, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.27 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.27 + tSize) {
    site();
    tempRowNum = 60;
    fill(255, 0, 0);
    text("60", width / 30, height / 1.27, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.24 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.24 + tSize) {
    site();
    tempRowNum = 70;
    fill(255, 0, 0);
    text("70", width / 30, height / 1.24, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.21 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.21 + tSize) {
    site();
    tempRowNum = 90;
    fill(255, 0, 0);
    text("90", width / 30, height / 1.21, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.18 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.18 + tSize) {
    site();
    tempRowNum = 100;
    fill(255, 0, 0);
    text("100", width / 30, height / 1.18, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.15 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.15 + tSize) {
    site();
    tempRowNum = 125;
    fill(255, 0, 0);
    text("125", width / 30, height / 1.15, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 30 && mouseY >= height / 1.125 && mouseX <= width / 30 + 2 * tSize + 1 && mouseY <= height / 1.125 + tSize) {
    site();
    tempRowNum = 150;
    fill(255, 0, 0);
    text("150", width / 30, height / 1.125, 2 * tSize + 1, tSize + 1);
  }
}
//col
void siteCol() {
  int  tSize = height / 45;
  textSize(tSize);


  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 15 && mouseX <= width / 9 + tSize + 1 && mouseY <= height / 15 + tSize + 1) {
    site();
    tempColNum = 2;
    fill(255, 0, 0);
    text("2", width / 9, height / 15, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 11.5 && mouseX <= width / 9 + tSize + 1 && mouseY <= height / 11.5 + tSize + 1) {
    site();
    tempColNum = 3;
    fill(255, 0, 0);
    text("3", width / 9, height / 11.5, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 9.42 && mouseX <= width / 9 + tSize + 1 && mouseY <= height / 9.4 + tSize + 1) {
    site();
    tempColNum = 4;
    fill(255, 0, 0);
    text("4", width / 9, height / 9.42, tSize + 1, tSize + 1);
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
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 6.2 && mouseX <= width / 9 + tSize + 1 && mouseY <= height / 6.2 + tSize + 1) {
    site();
    tempColNum = 7;
    fill(255, 0, 0);
    text("7", width / 9, height / 6.2, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 5.6 && mouseX <= width / 9 + tSize + 1 && mouseY <= height / 5.6 + tSize + 1) {
    site();
    tempColNum = 8;
    fill(255, 0, 0);
    text("8", width / 9, height / 5.6, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 5.1 && mouseX <= width / 9 + tSize + 1 && mouseY <= height / 5.1 + tSize + 1) {
    site();
    tempColNum = 9;
    fill(255, 0, 0);
    text("9", width / 9, height / 5.1, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 4.7 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 4.7 + tSize) {
    site();
    tempColNum = 10;
    fill(255, 0, 0);
    text("10", width / 9, height / 4.7, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 4.3 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 4.3 + tSize) {
    site();
    tempColNum = 11;
    fill(255, 0, 0);
    text("11", width / 9, height / 4.3, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 4 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 4 + tSize) {
    site();
    tempColNum = 12;
    fill(255, 0, 0);
    text("12", width / 9, height / 4, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 3.72 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 3.72 + tSize) {
    site();
    tempColNum = 13;
    fill(255, 0, 0);
    text("13", width / 9, height / 3.72, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 3.5 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 3.5 + tSize) {
    site();
    tempColNum = 14;
    fill(255, 0, 0);
    text("14", width / 9, height / 3.5, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 3.3 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 3.3 + tSize) {
    site();
    tempColNum = 15;
    fill(255, 0, 0);
    text("15", width / 9, height / 3.3, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 3.1 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 3.1 + tSize) {
    site();
    tempColNum = 16;
    fill(255, 0, 0);
    text("16", width / 9, height / 3.1, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 2.95 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 2.95 + tSize) {
    site();
    tempColNum = 17;
    fill(255, 0, 0);
    text("17", width / 9, height / 2.95, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 2.8 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 2.8 + tSize) {
    site();
    tempColNum = 18;
    fill(255, 0, 0);
    text("18", width / 9, height / 2.8, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 2.68 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 2.68 + tSize) {
    site();
    tempColNum = 19;
    fill(255, 0, 0);
    text("19", width / 9, height / 2.68, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 2.56 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 2.56 + tSize) {
    site();
    tempColNum = 20;
    fill(255, 0, 0);
    text("20", width / 9, height / 2.56, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 2.44 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 2.44 + tSize) {
    site();
    tempColNum = 21;
    fill(255, 0, 0);
    text("21", width / 9, height / 2.44, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 2.34 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 2.34 + tSize) {
    site();
    tempColNum = 22;
    fill(255, 0, 0);
    text("22", width / 9, height / 2.34, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 2.25 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 2.25 + tSize) {
    site();
    tempColNum = 23;
    fill(255, 0, 0);
    text("23", width / 9, height / 2.25, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 2.171 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 2.17 + tSize) {
    site();
    tempColNum = 24;
    fill(255, 0, 0);
    text("24", width / 9, height / 2.171, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 2.09 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 2.09 + tSize) {
    site();
    tempColNum = 25;
    fill(255, 0, 0);
    text("25", width / 9, height / 2.09, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 2.02 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 2.02 + tSize) {
    site();
    tempColNum = 26;
    fill(255, 0, 0);
    text("26", width / 9, height / 2.02, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.958 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.958 + tSize) {
    site();
    tempColNum = 27;
    fill(255, 0, 0);
    text("27", width / 9, height / 1.958, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.9 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.9 + tSize) {
    site();
    tempColNum = 28;
    fill(255, 0, 0);
    text("28", width / 9, height / 1.9, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.84 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.84 + tSize) {
    site();
    tempColNum = 29;
    fill(255, 0, 0);
    text("29", width / 9, height / 1.84, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.78 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.78 + tSize) {
    site();
    tempColNum = 30;
    fill(255, 0, 0);
    text("30", width / 9, height / 1.78, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.72 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.72+ tSize) {
    site();
    tempColNum = 31;
    fill(255, 0, 0);
    text("31", width / 9, height / 1.72, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.67 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.67 + tSize) {
    site();
    tempColNum = 32;
    fill(255, 0, 0);
    text("32", width / 9, height / 1.67, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.62 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.62 + tSize) {
    site();
    tempColNum = 33;
    fill(255, 0, 0);
    text("33", width / 9, height / 1.62, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.57 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.57 + tSize) {
    site();
    tempColNum = 34;
    fill(255, 0, 0);
    text("34", width / 9, height / 1.57, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.52 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.52 + tSize) {
    site();
    tempColNum = 35;
    fill(255, 0, 0);
    text("35", width / 9, height / 1.52, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.48 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.48 + tSize) {
    site();
    tempColNum = 36;
    fill(255, 0, 0);
    text("36", width / 9, height / 1.48, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.44 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.44 + tSize) {
    site();
    tempColNum = 37;
    fill(255, 0, 0);
    text("37", width / 9, height / 1.44, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.40 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.40 + tSize) {
    site();
    tempColNum = 38;
    fill(255, 0, 0);
    text("38", width / 9, height / 1.40, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.36 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.36 + tSize) {
    site();
    tempColNum = 39;
    fill(255, 0, 0);
    text("39", width / 9, height / 1.36, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.33 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.33 + tSize) {
    site();
    tempColNum = 40;
    fill(255, 0, 0);
    text("40", width / 9, height / 1.33, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.9 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.9 + tSize) {
    site();
    tempColNum = 50;
    fill(255, 0, 0);
    text("50", width / 9, height / 1.9, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.27 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.27 + tSize) {
    site();
    tempColNum = 60;
    fill(255, 0, 0);
    text("60", width / 9, height / 1.27, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.24 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.24 + tSize) {
    site();
    tempColNum = 70;
    fill(255, 0, 0);
    text("70", width / 9, height / 1.24, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.21 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.21 + tSize) {
    site();
    tempColNum = 90;
    fill(255, 0, 0);
    text("90", width / 9, height / 1.21, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.18 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.18 + tSize) {
    site();
    tempColNum = 100;
    fill(255, 0, 0);
    text("100", width / 9, height / 1.18, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.15 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.15 + tSize) {
    site();
    tempColNum = 125;
    fill(255, 0, 0);
    text("125", width / 9, height / 1.15, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 9 && mouseY >= height / 1.125 && mouseX <= width / 9 + 2 * tSize + 1 && mouseY <= height / 1.125 + tSize) {
    site();
    tempColNum = 150;
    fill(255, 0, 0);
    text("150", width / 9, height / 1.125, 2 * tSize + 1, tSize + 1);
  }
}
void siteWallWeight() {
  int  tSize = height / 45;
  textSize(tSize);

  if (mouseButton == LEFT && mouseX >= width / 5.5 && mouseY >= height / 15 && mouseX <= width / 5.5 + tSize + 1 && mouseY <= height / 15 + tSize + 1) {
    site();
    tempWallWeight = 1;
    fill(255, 0, 0);
    text("1", width / 5.5, height / 15, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 5.5 && mouseY >= height / 11.5 && mouseX <= width / 5.5 + tSize + 1 && mouseY <= height / 11.5 + tSize + 1) {
    site();
    tempWallWeight = 2;
    fill(255, 0, 0);
    text("2", width / 5.5, height / 11.5, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 5.5 && mouseY >= height / 9.42 && mouseX <= width / 5.5 + tSize + 1 && mouseY <= height / 9.4 + tSize + 1) {
    site();
    tempWallWeight = 3;
    fill(255, 0, 0);
    text("3", width / 5.5, height / 9.42, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 5.5 && mouseY >= height / 8 && mouseX <= width / 5.5 + tSize + 1 && mouseY <= height / 8 + tSize + 1) {
    site();
    tempWallWeight = 4;
    fill(255, 0, 0);
    text("4", width / 5.5, height / 8, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 5.5 && mouseY >= height / 7 && mouseX <= width / 5.5 + tSize + 1 && mouseY <= height / 7+ tSize + 1) {
    site();
    tempWallWeight = 5;
    fill(255, 0, 0);
    text("5", width / 5.5, height / 7, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 5.5 && mouseY >= height / 6.2 && mouseX <= width / 5.5 + tSize + 1 && mouseY <= height / 6.2 + tSize + 1) {
    site();
    tempWallWeight = 6;
    fill(255, 0, 0);
    text("6", width / 5.5, height / 6.2, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 5.5 && mouseY >= height / 5.6 && mouseX <= width / 5.5 + tSize + 1 && mouseY <= height / 5.6 + tSize + 1) {
    site();
    tempWallWeight = 7;
    fill(255, 0, 0);
    text("7", width / 5.5, height / 5.6, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 5.5 && mouseY >= height / 5.1 && mouseX <= width / 5.5 + tSize + 1 && mouseY <= height / 5.1 + tSize + 1) {
    site();
    tempWallWeight = 8;
    fill(255, 0, 0);
    text("8", width / 5.5, height / 5.1, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 5.5 && mouseY >= height / 4.7 && mouseX <= width / 5.5 + tSize + 1 && mouseY <= height / 4.7 + tSize) {
    site();
    tempWallWeight = 9;
    fill(255, 0, 0);
    text("9", width / 5.5, height / 4.7, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 5.5 && mouseY >= height / 4.3 && mouseX <= width / 5.5 + 2 * tSize + 1 && mouseY <= height / 4.3 + tSize) {
    site();
    tempWallWeight = 10;
    fill(255, 0, 0);
    text("10", width / 5.5, height / 4.3, 2 * tSize + 1, tSize + 1);
  }
}
void siteSideLength() {
  int  tSize = height / 45;
  textSize(tSize);
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 15 && mouseX <= width / 4 + tSize + 1 && mouseY <= height / 15 + tSize + 1) {
    site();
    tempSideLength = 5;
    fill(255, 0, 0);
    text("5", width / 4, height / 15, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 11.5 && mouseX <= width / 4 + tSize + 1 && mouseY <= height / 11.5 + tSize + 1) {
    site();
    tempSideLength = 6;
    fill(255, 0, 0);
    text("6", width / 4, height / 11.5, tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 9.42 && mouseX <= width / 4 + tSize + 1 && mouseY <= height / 9.4 + tSize + 1) {
    site();
    tempSideLength = 7;
    fill(255, 0, 0);
    text("7", width / 4, height / 9.42, tSize + 1, tSize + 1);
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
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 6.2 && mouseX <= width / 4 + 2*tSize + 1 && mouseY <= height / 6.2 + tSize + 1) {
    site();
    tempSideLength = 10;
    fill(255, 0, 0);
    text("10", width / 4, height / 6.2, 2* tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 5.6 && mouseX <= width / 4 + 2*tSize + 1 && mouseY <= height / 5.6 + tSize + 1) {
    site();
    tempSideLength = 20;
    fill(255, 0, 0);
    text("20", width / 4, height / 5.6, 2* tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 5.1 && mouseX <= width / 4 +2* tSize + 1 && mouseY <= height / 5.1 + tSize + 1) {
    site();
    tempSideLength = 30;
    fill(255, 0, 0);
    text("30", width / 4, height / 5.1, 2* tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 4.7 && mouseX <= width / 4 + 2 * tSize + 1 && mouseY <= height / 4.7 + tSize) {
    site();
    tempSideLength = 40;
    fill(255, 0, 0);
    text("40", width / 4, height / 4.7, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 4.3 && mouseX <= width / 4 + 2 * tSize + 1 && mouseY <= height / 4.3 + tSize) {
    site();
    tempSideLength = 50;
    fill(255, 0, 0);
    text("50", width / 4, height / 4.3, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 4 && mouseX <= width / 4 + 2 * tSize + 1 && mouseY <= height / 4 + tSize) {
    site();
    tempSideLength = 60;
    fill(255, 0, 0);
    text("60", width / 4, height / 4, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 3.72 && mouseX <= width / 4 + 2 * tSize + 1 && mouseY <= height / 3.72 + tSize) {
    site();
    tempSideLength = 70;
    fill(255, 0, 0);
    text("70", width / 4, height / 3.72, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 3.5 && mouseX <= width / 4 + 2 * tSize + 1 && mouseY <= height / 3.5 + tSize) {
    site();
    tempSideLength = 80;
    fill(255, 0, 0);
    text("80", width / 4, height / 3.5, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 3.3 && mouseX <= width / 4 + 2 * tSize + 1 && mouseY <= height / 3.3 + tSize) {
    site();
    tempSideLength = 90;
    fill(255, 0, 0);
    text("90", width / 4, height / 3.3, 2 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 3.1 && mouseX <= width / 4 + 3 * tSize + 1 && mouseY <= height / 3.1 + tSize) {
    site();
    tempSideLength = 100;
    fill(255, 0, 0);
    text("100", width / 4, height / 3.1, 3 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 2.95 && mouseX <= width / 4 + 3 * tSize + 1 && mouseY <= height / 2.95 + tSize) {
    site();
    tempSideLength = 110;
    fill(255, 0, 0);
    text("110", width / 4, height / 2.95, 3 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 2.8 && mouseX <= width / 4 + 3 * tSize + 1 && mouseY <= height / 2.8 + tSize) {
    site();
    tempSideLength = 120;
    fill(255, 0, 0);
    text("120", width / 4, height / 2.8, 3 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 2.68 && mouseX <= width / 4 + 3 * tSize + 1 && mouseY <= height / 2.68 + tSize) {
    site();
    tempSideLength = 130;
    fill(255, 0, 0);
    text("130", width / 4, height / 2.68, 3 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 2.56 && mouseX <= width / 4 + 3 * tSize + 1 && mouseY <= height / 2.56 + tSize) {
    site();
    tempSideLength = 140;
    fill(255, 0, 0);
    text("140", width / 4, height / 2.56, 3 * tSize + 1, tSize + 1);
  }
  if (mouseButton == LEFT && mouseX >= width / 4 && mouseY >= height / 2.44 && mouseX <= width / 4 + 3 * tSize + 1 && mouseY <= height / 2.44 + tSize) {
    site();
    tempSideLength = 150;
    fill(255, 0, 0);
    text("150", width / 4, height / 2.44, 3 * tSize + 1, tSize + 1);
  }
}
