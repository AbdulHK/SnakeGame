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
    snakeGame.setIsStarted(true);
    snakeGame.createApple(width, height);
    counter = 0;

    for (int i = 0; i< butterfly.length/2; i+=2) {
      butterfly[i] = (int)random(width);
      butterfly[i+1] = (int)random(height);
    }
  }

  void startGame(){
    snakeGame.setIsStarted(true);
  }

  void setDirection(String direction) {

    butterflyX = (int)random(100)>50 ? 1 : -1;
    butterflyY = (int)random(100)>50 ? 1 : -1;

    if (direction.equals("U") && !snakeGame.getDirection().equals("D"))
    {
      snakeGame.setDirection("U");
    }
    if (direction.equals("D") && !snakeGame.getDirection().equals("U"))
    {
      snakeGame.setDirection("D");
    }
    if (direction.equals("L") && !snakeGame.getDirection().equals("R"))
    {
      snakeGame.setDirection("L");
    }
    if (direction.equals("R") && !snakeGame.getDirection().equals("L"))
    {
      snakeGame.setDirection("R");
    }
  }

  void display() {

    drawBackground();

    delay(timeDelay);
    counter++;

    if (snakeGame != null ) {

      if (!snakeGame.isIsStarted()) {
        showStartMenu();
        return;
      }

      snakeGame.nextStep(width, height);
      if (snakeGame.SnakeOnSnake()) {
        println("end");
        snakeGame.setIsStarted(false);
        counter = 0;
      }
      
      snakeGame.createApple(width, height);

      snakeGame.SnakeOnApple();

      int radius = snakeGame.getSnake().get(snakeGame.getSnake().size()-1).getRadius();
      int xs = snakeGame.getSnake().get(snakeGame.getSnake().size()-2).getPositionX()+radius/2;
      int ys = snakeGame.getSnake().get(snakeGame.getSnake().size()-2).getPositionY()+radius/2;

      fill(211, 222, 18);
      stroke(211, 222, 18);
      strokeWeight(4);
      if (snakeGame.getDirection().equals("U")) {
        line(xs, ys, xs, ys-radius*1.5);
        line(xs, ys-radius*1.5, xs-5, ys-radius*2);
        line(xs, ys-radius*1.5, xs+5, ys-radius*2);
        fill(0);
        stroke(0);
        ellipse(xs-5, ys-radius, 5, 5);
        ellipse(xs+5, ys-radius, 5, 5);
        stroke(211, 222, 18);
        fill(211, 222, 18);
      }
      if (snakeGame.getDirection().equals("D")) {
        line(xs, ys, xs, ys+radius*1.5);
        line(xs, ys+radius*1.5, xs-5, ys+radius*2);
        line(xs, ys+radius*1.5, xs+5, ys+radius*2);
        fill(0);
        stroke(0);
        ellipse(xs-5, ys+radius, 5, 5);
        ellipse(xs+5, ys+radius, 5, 5);
        stroke(211, 222, 18);
        fill(211, 222, 18);
      }
      if (snakeGame.getDirection().equals("L")) {
        line(xs, ys, xs-radius*1.5, ys);
        line(xs-radius*1.5, ys, xs-radius*2, ys-5);
        line(xs-radius*1.5, ys, xs-radius*2, ys+5);
        fill(0);
        stroke(0);
        ellipse(xs-radius, ys-5, 5, 5);
        ellipse(xs-radius, ys+5, 5, 5);
        stroke(211, 222, 18);
        fill(211, 222, 18);
      }
      if (snakeGame.getDirection().equals("R")) {
        line(xs, ys, xs+radius*1.5, ys);
        line(xs+radius*1.5, ys, xs+radius*2, ys-5);
        line(xs+radius*1.5, ys, xs+radius*2, ys+5);
        fill(0);
        stroke(0);
        ellipse(xs+radius, ys-5, 5, 5);
        ellipse(xs+radius, ys+5, 5, 5);
        stroke(211, 222, 18);
        fill(211, 222, 18);
      }

      int offset = counter % 2 == 0 ? 1 : -1;

      for (int i = 0; i<snakeGame.getSnake ().size()-1; i++)
      {
        xs = snakeGame.getSnake().get(i).getPositionX();
        ys = snakeGame.getSnake().get(i).getPositionY();
        radius = snakeGame.getSnake().get(i).getRadius();
        if (i % 2 == 0) {
          fill(255, 0, 0);
          if (snakeGame.getDirection().equals("U")) {
            xs -= radius/4*offset;
          }
          if (snakeGame.getDirection().equals("D")) {
            xs -= radius/4*offset;
          }
          if (snakeGame.getDirection().equals("L")) {
            ys -= radius/4*offset;
          }
          if (snakeGame.getDirection().equals("R")) {
            ys -= radius/4*offset;
          }
        } else {
          fill(0);
          if (snakeGame.getDirection().equals("U")) {
            xs -= radius/4*(-offset);
          }
          if (snakeGame.getDirection().equals("D")) {
            xs -= radius/4*(-offset);
          }
          if (snakeGame.getDirection().equals("L")) {
            ys -= radius/4*(-offset);
          }
          if (snakeGame.getDirection().equals("R")) {
            ys -= radius/4*(-offset);
          }
        }

        rect(xs, ys, radius, radius);
      }

      if (snakeGame.apples != null && !snakeGame.apples.isEmpty())
      {

        for (int i = 0; i<snakeGame.apples.size (); i++) {
                              
          int xa = snakeGame.apples.get(i).getPositionX();
          int ya = snakeGame.apples.get(i).getPositionY();
          int aradius = snakeGame.apples.get(i).getRadius();

          strokeWeight(1);

          switch(snakeGame.applesTypes.get(i)) {
          case 1:
            fill(0, 255, 0);
            stroke(0);
            break;
          case 2:
            fill(202, 43, 230);
            stroke(0);
            break;
          case 3:
            fill(255, 0, 0);
            stroke(0);
            break;
          case 4:
            fill(0, 0, 255);
            stroke(0);
            break;
          case 5:
            fill(210, 210, 210);
            stroke(0);
            break;
          }

          
          ellipse(xa, ya, aradius, aradius);
        }
      }

      fill(255);

      text("Current scores "+snakeGame.score, 10, 30);
    }
  }

  void drawBackground() {

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

