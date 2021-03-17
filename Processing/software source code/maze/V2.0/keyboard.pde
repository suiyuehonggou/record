
//上room[row-1][col].ynWalk() 下room[row+1][col].ynWalk() 左room[row][col-1].ynWalk() 右room[row][col+1].ynWalk()
//判断是否是向回走
boolean backWhere() {
  //println("row="+row+",col="+col);
  switch(judgmentArea(row, col)) {
  case 0:
    {
      switch(key) {
      case 's':
        { 
          if (room[row+1][col].ynWalk()) {
            return true;
          }
          break;
        }
      case 'd':
        { 
          if (room[row][col+1].ynWalk()) {
            return true;
          }
          break;
        }
      }
      break;
    }
  case 1:
    {
      switch(key) {
      case 's':
        { 
          if (room[row+1][col].ynWalk()) {
            return true;
          }
          break;
        }
      case 'a':
        { 
          if (room[row][col-1].ynWalk()) {
            return true;
          }
          break;
        }
      case 'd':
        { 
          if (room[row][col+1].ynWalk()) {
            return true;
          }
          break;
        }
      }
      break;
    }
  case 2:
    {
      switch(key) {
      case 's':
        { 
          if (room[row+1][col].ynWalk()) {
            return true;
          }
          break;
        }
      case 'a':
        { 
          if (room[row][col-1].ynWalk()) {
            return true;
          }
          break;
        }
      }
      break;
    }
  case 3:
    {
      switch(key) {
      case 'w':
        {
          if (room[row-1][col].ynWalk()) {
            return true;
          }
          break;
        }
      case 's':
        { 
          if (room[row+1][col].ynWalk()) {
            return true;
          }
          break;
        }
      case 'd':
        { 
          if (room[row][col+1].ynWalk()) {
            return true;
          }
          break;
        }
      }
      break;
    }
  case 4:
    {
      switch(key) {
      case 'w':
        {
          if (room[row-1][col].ynWalk()) {
            return true;
          }
          break;
        }
      case 's':
        { 
          if (room[row+1][col].ynWalk()) {
            return true;
          }
          break;
        }
      case 'a':
        { 
          if (room[row][col-1].ynWalk()) {
            return true;
          }
          break;
        }
      case 'd':
        { 
          if (room[row][col+1].ynWalk()) {
            return true;
          }
          break;
        }
      }

      break;
    }
  case 5:
    {
      switch(key) {
      case 'w':
        {
          if (room[row-1][col].ynWalk()) {
            return true;
          }
          break;
        }
      case 's':
        { 
          if (room[row+1][col].ynWalk()) {
            return true;
          }
          break;
        }
      case 'a':
        { 
          if (room[row][col-1].ynWalk()) {
            return true;
          }
          break;
        }
      }
      break;
    }
  case 6:
    {
      switch(key) {
      case 'w':
        {
          if (room[row-1][col].ynWalk()) {
            return true;
          }
          break;
        }
      case 'd':
        { 
          if (room[row][col+1].ynWalk()) {
            return true;
          }
          break;
        }
      }
      break;
    }
  case 7:
    {
      switch(key) {
      case 'w':
        {
          if (room[row-1][col].ynWalk()) {
            return true;
          }
          break;
        }
      case 'a':
        { 
          if (room[row][col-1].ynWalk()) {
            return true;
          }
          break;
        }
      case 'd':
        { 
          if (room[row][col+1].ynWalk()) {
            return true;
          }
          break;
        }
      }
      break;
    }
  case 8:
    {
      switch(key) {
      case 'w':
        {
          if (room[row-1][col].ynWalk()) {
            return true;
          }
          break;
        }
      case 'a':
        { 
          if (room[row][col-1].ynWalk()) {
            return true;
          }
          break;
        }
      }
      break;
    }
  }
  return false;
}

//判断走哪个方向
void whereToGo() {
  //规范按键
  if (key==CODED) {
    if (keyCode==UP) {
      key='w';
    }
    if (keyCode==DOWN) {
      key='s';
    }
    if (keyCode==LEFT) {
      key='a';
    }
    if (keyCode==RIGHT) {
      key='d';
    }
  }
  switch(key) {
  case 'w':
    {
    }
  case 'W':
    {
      key='w';
      break;
    }
  case 's':
    {
    }
  case 'S':
    {
      key='s';
      break;
    }
  case 'a':
    {
    }
  case 'A':
    {
      key='a';
      break;
    }
  case 'd':
    {
    }
  case 'D':
    {
      key='d';
      break;
    }
  }
  if (backWhere()) {
    switch(key) {
    case 'w':
      {
        if (!room[row][col].judgmentWall("UP")) {
          room[row][col].backWalkLine("UP", walkLineWeight);
          row--;
        }
        break;
      }
    case 's':
      { 
        if (!room[row][col].judgmentWall("DOWN")) {
          room[row][col].backWalkLine("DOWN", walkLineWeight);
          row++;
        }
        break;
      }
    case 'a':
      {
        if (!room[row][col].judgmentWall("LEFT")) {
          room[row][col].backWalkLine("LEFT", walkLineWeight);
          col--;
        }

        break;
      }
    case 'd':
      { 
        if (!room[row][col].judgmentWall("RIGHT")) {
          room[row][col].backWalkLine("RIGHT", walkLineWeight);
          col++;
        }
        break;
      }
    }
  } else {
    switch(key) {
    case 'w':
      {
        if (!room[row][col].judgmentWall("UP")) {
          room[row][col].walkLine("UP", walkLineWeight, 0);
          row--;
        }
        break;
      }
    case 's':
      { 
        if (!room[row][col].judgmentWall("DOWN")) {
          room[row][col].walkLine("DOWN", walkLineWeight, 0);
          row++;
        }
        break;
      }
    case 'a':
      {
        if (!room[row][col].judgmentWall("LEFT")) {
          room[row][col].walkLine("LEFT", walkLineWeight, 0);
          col--;
        }
        break;
      }
    case 'd':
      { 
        if (!room[row][col].judgmentWall("RIGHT")) {
          room[row][col].walkLine("RIGHT", walkLineWeight, 0);
          col++;
        }
        break;
      }
    }
  }
  win();
}
