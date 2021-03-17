void menu() {
  int tSize = height / 15;
  background(44, 98, 173, 0);
  textSize(tSize);
  fill(250, 138, 8);
  startFlag = true;
  text("开始", width / 2 - 100, height / 3, 2 * tSize + 1, tSize + 1);
  tSize = height / 20;
  textSize(tSize);
  text("设置", width / 1.1, height / 1.2, 2 * tSize + 1, tSize + 1);
  text("关于", width/1.1, height/1.12, 2*tSize+1, tSize+1);
  tSize = height / 50;
  textSize(tSize);
  text("岁月鸿沟", width/1.07, height/100, 4*tSize+1, tSize+1);
  text(verson, width/100, height/1.04);
}
void mazeDraw() {
  int tSize=height/80;
  textSize(tSize);
  fill(0);
  text("返回", width/1.02, height/1.05, 2*tSize+1, tSize+1);
  tSize=height/40;
  textSize(tSize);
  text("保存", width/4, height/100, 2*tSize+1, tSize+1);
  text("重建", width/4*2, height/100, 2*tSize+1, tSize+1);
  text("设置", width/4*3, height/100, 2*tSize+1, tSize+1);
  text("使用wsad或", width/1.15, height/1.1);
  text("↑↓←→来移动", width/1.15, height/1.1+tSize);
}
void about() {
  //int high=height/100,speed=1;
  background(46, 84, 151);
  int tSize=height/80;
  textSize(tSize);
  text("返回", width/1.02, height/1.05, 2*tSize+1, tSize+1);
  tSize=height/20;
  textSize(tSize);
  fill(255);
  text("SWEET HOME,GO!", width/1000-tSize/6, height/100, tSize-1, 20*tSize+1);
  text("岁", width/1.02, height/100, tSize+1, 100*tSize+1);
  text("月", width/1.02, height/100*25, tSize+1, 100*tSize+1);
  text("鸿", width/1.02, height/100*50, tSize+1, 100*tSize+1);
  text("沟", width/1.02, height/100*75, tSize+1, 100*tSize+1);
  text("《N个迷宫的诞生》", width/2-9*tSize/2, height/3);
  tSize=height/40;
  textSize(tSize);
  text("使用语言：Processing", width/3, height/3+height/20);
  text("版本:"+verson, width/3, height/2.4);
  text("BUG反馈:wangshijiehh@outlook.com", width/3, height/2.25);
  text("", width/3, height/2.12);
  text("", width/3, height/2.01);
  text("", width/3, height/1.91);
  text("", width/3, height/1.82);
}
void aboutOptions() {
  int tSize=height/80;
  if (mouseButton==LEFT&&mouseX>=width/1.02&&mouseY>=height/1.05&&mouseX<=width/1.02+2*tSize+1&&mouseY<=height/1.05+tSize+1) {
    startFlag=true;
    page=0;
    menu();
  }
}
void sweetHomeGo() {
  int tSize=height/30;
  background(46, 84, 151);
  textSize(tSize);
  text("越过岁月鸿沟就是Sweet Home,Go了？是的，不过是另一个岁月鸿沟，英语的。", width/100, height/2.5-tSize/2);
  text("——惘闻", width/1.1, height/2);
  tSize=height/80;
  textSize(tSize);
  text("返回", width/1.02, height/1.05, 2*tSize+1, tSize+1);
}

void site() {
  int tSize = height / 30;
  startFlag = true;
  background(255);
  textSize(tSize);
  fill(0);
  text("行数", width / 30, height / 30, 2 * tSize + 1, 1 * tSize + 1);
  text("列数", width / 9, height / 30, 2 * tSize + 1, tSize + 1);
  text("墙宽", width / 5.5, height / 30, 2 * tSize + 1, tSize + 1);
  text("房间边长", width / 4, height / 30, 4 * tSize + 1, tSize + 1);
  tSize = height / 20;
  textSize(tSize);
  text("确定", width / 1.2, height / 1.12, 2 * tSize + 1, tSize + 1);
  text("返回", width / 1.1, height / 1.12, 2 * tSize + 1, tSize + 1);
  text("开始", width / 1.15, height / 1.3, 2 * tSize + 1, tSize + 1);
  //row
  tSize = height / 45;
  textSize(tSize);
  text("2", width / 30, height / 15, tSize + 1, tSize + 1);
  text("3", width / 30, height / 11.5, tSize + 1, tSize + 1);
  text("4", width / 30, height / 9.42, tSize + 1, tSize + 1);
  text("5", width / 30, height / 8, tSize + 1, tSize + 1);
  text("6", width / 30, height / 7, tSize + 1, tSize + 1);
  text("7", width / 30, height / 6.2, tSize + 1, tSize + 1);
  text("8", width / 30, height / 5.6, tSize + 1, tSize + 1);
  text("9", width / 30, height / 5.1, tSize + 1, tSize + 1);
  text("10", width / 30, height / 4.7, 2 * tSize + 1, tSize + 1);
  text("11", width / 30, height / 4.3, 2 * tSize + 1, tSize + 1);
  text("12", width / 30, height / 4, 2 * tSize + 1, tSize + 1);
  text("13", width / 30, height / 3.72, 2 * tSize + 1, tSize + 1);
  text("14", width / 30, height / 3.5, 2 * tSize + 1, tSize + 1);
  text("15", width / 30, height / 3.3, 2 * tSize + 1, tSize + 1);
  text("16", width / 30, height / 3.1, 2 * tSize + 1, tSize + 1);
  text("17", width / 30, height / 2.95, 2 * tSize + 1, tSize + 1);
  text("18", width / 30, height / 2.8, 2 * tSize + 1, tSize + 1);
  text("19", width / 30, height / 2.68, 2 * tSize + 1, tSize + 1);
  text("20", width / 30, height / 2.56, 2 * tSize + 1, tSize + 1);
  text("21", width / 30, height / 2.44, 2 * tSize + 1, tSize + 1);
  text("22", width / 30, height / 2.34, 2 * tSize + 1, tSize + 1);
  text("23", width / 30, height / 2.25, 2 * tSize + 1, tSize + 1);
  text("24", width / 30, height / 2.171, 2 * tSize + 1, tSize + 1);
  text("25", width / 30, height / 2.09, 2 * tSize + 1, tSize + 1);
  text("26", width / 30, height / 2.02, 2 * tSize + 1, tSize + 1);
  text("27", width / 30, height / 1.958, 2 * tSize + 1, tSize + 1);
  text("28", width / 30, height / 1.9, 2 * tSize + 1, tSize + 1);
  text("29", width / 30, height / 1.84, 2 * tSize + 1, tSize + 1);
  text("30", width / 30, height / 1.78, 2 * tSize + 1, tSize + 1);
  text("31", width / 30, height / 1.72, 2 * tSize + 1, tSize + 1);
  text("32", width / 30, height / 1.67, 2 * tSize + 1, tSize + 1);
  text("33", width / 30, height / 1.62, 2 * tSize + 1, tSize + 1);
  text("34", width / 30, height / 1.57, 2 * tSize + 1, tSize + 1);
  text("35", width / 30, height / 1.52, 2 * tSize + 1, tSize + 1);
  text("36", width / 30, height / 1.48, 2 * tSize + 1, tSize + 1);
  text("37", width / 30, height / 1.44, 2 * tSize + 1, tSize + 1);
  text("38", width / 30, height / 1.40, 2 * tSize + 1, tSize + 1);
  text("39", width / 30, height / 1.36, 2 * tSize + 1, tSize + 1);
  text("40", width / 30, height / 1.33, 2 * tSize + 1, tSize + 1);
  text("50", width / 30, height / 1.30, 2 * tSize + 1, tSize + 1);
  text("60", width / 30, height / 1.27, 2 * tSize + 1, tSize + 1);
  text("70", width / 30, height / 1.24, 2 * tSize + 1, tSize + 1);
  text("90", width / 30, height / 1.21, 2 * tSize + 1, tSize + 1);
  text("100", width / 30, height / 1.18, 2 * tSize + 1, tSize + 1);
  text("125", width / 30, height / 1.15, 2 * tSize + 1, tSize + 1);
  text("150", width / 30, height / 1.125, 2 * tSize + 1, tSize + 1);
  fill(255, 0, 0);
  text("数字变为红色表明你选择了这个数。请勿选择过大的数，可能导致迷宫大小超出屏幕显示区域。点击确定使设置生效！！！", width / 40, height / 1.05);
  //col
  fill(0);
  text("2", width / 9, height / 15, tSize + 1, tSize + 1);
  text("3", width / 9, height / 11.5, tSize + 1, tSize + 1);
  text("4", width / 9, height / 9.42, tSize + 1, tSize + 1);
  text("5", width / 9, height / 8, tSize + 1, tSize + 1);
  text("6", width / 9, height / 7, tSize + 1, tSize + 1);
  text("7", width / 9, height / 6.2, tSize + 1, tSize + 1);
  text("8", width / 9, height / 5.6, tSize + 1, tSize + 1);
  text("9", width / 9, height / 5.1, tSize + 1, tSize + 1);
  text("10", width / 9, height / 4.7, 2 * tSize + 1, tSize + 1);
  text("11", width / 9, height / 4.3, 2 * tSize + 1, tSize + 1);
  text("12", width / 9, height / 4, 2 * tSize + 1, tSize + 1);
  text("13", width / 9, height / 3.72, 2 * tSize + 1, tSize + 1);
  text("14", width / 9, height / 3.5, 2 * tSize + 1, tSize + 1);
  text("15", width / 9, height / 3.3, 2 * tSize + 1, tSize + 1);
  text("16", width / 9, height / 3.1, 2 * tSize + 1, tSize + 1);
  text("17", width / 9, height / 2.95, 2 * tSize + 1, tSize + 1);
  text("18", width / 9, height / 2.8, 2 * tSize + 1, tSize + 1);
  text("19", width / 9, height / 2.68, 2 * tSize + 1, tSize + 1);
  text("20", width / 9, height / 2.56, 2 * tSize + 1, tSize + 1);
  text("21", width / 9, height / 2.44, 2 * tSize + 1, tSize + 1);
  text("22", width / 9, height / 2.34, 2 * tSize + 1, tSize + 1);
  text("23", width / 9, height / 2.25, 2 * tSize + 1, tSize + 1);
  text("24", width / 9, height / 2.171, 2 * tSize + 1, tSize + 1);
  text("25", width / 9, height / 2.09, 2 * tSize + 1, tSize + 1);
  text("26", width / 9, height / 2.02, 2 * tSize + 1, tSize + 1);
  text("27", width / 9, height / 1.958, 2 * tSize + 1, tSize + 1);
  text("28", width / 9, height / 1.9, 2 * tSize + 1, tSize + 1);
  text("29", width / 9, height / 1.84, 2 * tSize + 1, tSize + 1);
  text("30", width / 9, height / 1.78, 2 * tSize + 1, tSize + 1);
  text("31", width / 9, height / 1.72, 2 * tSize + 1, tSize + 1);
  text("32", width / 9, height / 1.67, 2 * tSize + 1, tSize + 1);
  text("33", width / 9, height / 1.62, 2 * tSize + 1, tSize + 1);
  text("34", width / 9, height / 1.57, 2 * tSize + 1, tSize + 1);
  text("35", width / 9, height / 1.52, 2 * tSize + 1, tSize + 1);
  text("36", width / 9, height / 1.48, 2 * tSize + 1, tSize + 1);
  text("37", width / 9, height / 1.44, 2 * tSize + 1, tSize + 1);
  text("38", width / 9, height / 1.40, 2 * tSize + 1, tSize + 1);
  text("39", width / 9, height / 1.36, 2 * tSize + 1, tSize + 1);
  text("40", width / 9, height / 1.33, 2 * tSize + 1, tSize + 1);
  text("50", width / 9, height / 1.30, 2 * tSize + 1, tSize + 1);
  text("60", width / 9, height / 1.27, 2 * tSize + 1, tSize + 1);
  text("70", width / 9, height / 1.24, 2 * tSize + 1, tSize + 1);
  text("90", width / 9, height / 1.21, 2 * tSize + 1, tSize + 1);
  text("100", width / 9, height / 1.18, 2 * tSize + 1, tSize + 1);
  text("125", width / 9, height / 1.15, 2 * tSize + 1, tSize + 1);
  text("150", width / 9, height / 1.125, 2 * tSize + 1, tSize + 1);
  //wall
  text("1", width / 5.5, height / 15, tSize + 1, tSize + 1);
  text("2", width / 5.5, height / 11.5, tSize + 1, tSize + 1);
  text("3", width / 5.5, height / 9.42, tSize + 1, tSize + 1);
  text("4", width / 5.5, height / 8, tSize + 1, tSize + 1);
  text("5", width / 5.5, height / 7, tSize + 1, tSize + 1);
  text("6", width / 5.5, height / 6.2, tSize + 1, tSize + 1);
  text("7", width / 5.5, height / 5.6, tSize + 1, tSize + 1);
  text("8", width / 5.5, height / 5.1, tSize + 1, tSize + 1);
  text("9", width / 5.5, height / 4.7, 2 * tSize + 1, tSize + 1);
  text("10", width / 5.5, height / 4.3, 2 * tSize + 1, tSize + 1);
  //site
  text("5", width /4, height / 15, tSize + 1, tSize + 1);
  text("6", width /4, height / 11.5, tSize + 1, tSize + 1);
  text("7", width /4, height / 9.42, tSize + 1, tSize + 1);
  text("8", width /4, height / 8, tSize + 1, tSize + 1);
  text("9", width /4, height / 7, tSize + 1, tSize + 1);
  text("10", width /4, height / 6.2, tSize + 1, tSize + 1);
  text("20", width /4, height / 5.6, tSize + 1, tSize + 1);
  text("30", width /4, height / 5.1, tSize + 1, tSize + 1);
  text("40", width /4, height / 4.7, 2 * tSize + 1, tSize + 1);
  text("50", width /4, height / 4.3, 2 * tSize + 1, tSize + 1);
  text("60", width /4, height / 4, 2 * tSize + 1, tSize + 1);
  text("70", width /4, height / 3.72, 2 * tSize + 1, tSize + 1);
  text("80", width /4, height / 3.5, 2 * tSize + 1, tSize + 1);
  text("90", width /4, height / 3.3, 2 * tSize + 1, tSize + 1);
  text("100", width /4, height / 3.1, 3 * tSize + 1, tSize + 1);
  text("110", width /4, height / 2.95, 3 * tSize + 1, tSize + 1);
  text("120", width /4, height / 2.8, 3 * tSize + 1, tSize + 1);
  text("130", width /4, height / 2.68, 3 * tSize + 1, tSize + 1);
  text("140", width /4, height / 2.56, 3 * tSize + 1, tSize + 1);
  text("150", width /4, height / 2.44, 3 * tSize + 1, tSize + 1);
}
