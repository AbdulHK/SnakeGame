class Game {

  boolean dayToNight = true;
  int[] skyColor = new int[] {
    0, 221, 221
  };
  int[] grassColor = new int[] {
    0, 221, 0
  };
  int[] treeColor = new int[] {
    110, 110, 0
  };
  int[] butterfly = new int[12];
  int butterflyX = 0;
  int butterflyY = 0;

  public SnakeGame snakeGame;
  int counter = 0;

  Game() {

    snakeGame = new SnakeGame(15);
  //  snakeGame.setIsStarted(true);
    snakeGame.createApple(width, height);
    counter = 0;

    for (int i = 0; i< butterfly.length/2; i+=2) {
      butterfly[i] = (int)random(width);
      butterfly[i+1] = (int)random(height);
    }
  }
}
 void drawBackground() {

    //at each step change sky, grass and tree color
    if (dayToNight) {
      if (skyColor[0] == 0 && skyColor[1] > 0) {
        skyColor[1]--;
      } else if (skyColor[0] == 221) {
        dayToNight = !dayToNight;
      } else {
        skyColor[0]++;
      }    

      if (counter % 2 == 0) {
        grassColor[1]--;
        treeColor[0]--;
        treeColor[1]--;
      }
    } else {
      if (skyColor[1] == 0 && skyColor[0] > 0) {
        skyColor[0]--;
      } else if (skyColor[1] == 221) {
        dayToNight = !dayToNight;
      } else {
        skyColor[1]++;
      }    

      if (counter % 2 == 0) {
        grassColor[1]++;
        treeColor[0]++;
        treeColor[1]++;
      }
    }

    background(grassColor[0], grassColor[1], grassColor[2]);

    strokeWeight(1);

    rectMode(CORNER);
    stroke(skyColor[0], skyColor[1], skyColor[2]);
    fill(skyColor[0], skyColor[1], skyColor[2]);
    rect(0, 0, width, 70);  

    //draw trees
    for (int i = 0; i<width/40; i++ ) {
      int xpos = 40*i+20;
      int ypos = 40; 
      fill(treeColor[0], treeColor[1], treeColor[2]);
      stroke(0);
      rect(xpos, ypos, 7, 35); 

      xpos += 5;
      ypos += 15;

      stroke(0);
      fill(grassColor[0], grassColor[1], grassColor[2]);
      ellipse(xpos, ypos-23, 15, 15);
      ellipse(xpos-7, ypos-23, 18, 15);
      ellipse(xpos+7, ypos-23, 18, 15);
      ellipse(xpos, ypos-7, 15, 15);
      ellipse(xpos-7, ypos-10, 18, 15);
      ellipse(xpos+7, ypos-10, 18, 15);
      stroke(grassColor[0], grassColor[1], grassColor[2]);
      ellipse(xpos, ypos-15, 25, 25);
    }

    //draw butterflies
    for (int i = 0; i<butterfly.length/2; i+=2) {
      butterfly[i] += butterflyX;
      butterfly[i+1] += butterflyY;

      if (skyColor[0] == 0 && skyColor[1] > 0) {
        stroke(255, 0, 0);
        fill(255, 0, 0);

        if (counter % 2 == 0) {            
          ellipse(butterfly[i]-4, butterfly[i+1], 3, 8);
          ellipse(butterfly[i], butterfly[i+1], 3, 8);
        } else {
          ellipse(butterfly[i]-4, butterfly[i+1], 5, 8);
          ellipse(butterfly[i], butterfly[i+1], 5, 8);
        }
      } else if (skyColor[1] == 0 && skyColor[0] > 0) {
        stroke(58, 255, 17);
        fill(58, 255, 17);
        ellipse(butterfly[i], butterfly[i+1], 2, 2);
      }
    }
  }

  void showStartMenu() {

    fill(255);
    text("Welcome to the Snake game !", 200, 100);
    text("Rules of the game are simple and known to all. Snake should eat apples and should not ", 20, 120);
    text("bite itself. The game has several types of apples : ", 20, 140);
    text(" - green  - add 10 points to scroe, and 3 to snake length ", 20, 160);
    text(" - purple - add 5 points to scroe ", 20, 180);
    text(" - red    - increase the speed x2 ", 20, 200);
    text(" - blue   - reduced the speed x1.5 ", 20, 220);
    text(" - gray   - reduce the size of the snake doubled ", 20, 240);
    
    text(" Press start to play ", 20, 260);
    
  }
}






