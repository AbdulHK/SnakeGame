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
//    snakeGame.setIsStarted(true);
    snakeGame.createApple(width, height);
    counter = 0;

    for (int i = 0; i< butterfly.length/2; i+=2) {
      butterfly[i] = (int)random(width);
      butterfly[i+1] = (int)random(height);
    }
  }

