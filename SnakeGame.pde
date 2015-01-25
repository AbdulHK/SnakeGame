public class SnakeGame {
  private boolean isStarted = false;
  private ArrayList<SnakeClass> snake;

  private int X = 3;
  private int Y = 2;
  private ArrayList<SnakeClass> apples;
  private ArrayList<Integer> applesTypes;
  private int radius = 10;
  private String direction;
  int score = 0;
  
  public SnakeGame(int count) 
  {
    score = 0;
    snake = new ArrayList<SnakeClass>();
     apples = new ArrayList<SnakeClass>();
     applesTypes = new ArrayList<Integer>();
    for (int i = 0; i<count; i++)
    {
      snake.add(new SnakeClass(100+radius*i, 100, radius));
    }
    direction = "R";
  }
   public ArrayList<SnakeClass> getSnake() {
    return snake;
  }

  public boolean isIsStarted() {
    return isStarted;
  }

  public void setIsStarted(boolean isStarted) {
    this.isStarted = isStarted;
  }

  public String getDirection() {
    return direction;
  }
   public void setDirection(String direction) {
    this.direction = direction;
  }
   public boolean SnakeOnSnake()
  {
    int x = snake.get(snake.size()-1).getPositionX();
    int y = snake.get(snake.size()-1).getPositionY();
    
    //for each snake element check coordinates
    for (int i = 0; i<snake.size ()-1; i++)
    {
      if ((snake.get(i).getPositionX() == x) && (snake.get(i).getPositionY() == y))
      {
        return true;
      }
    }
    return false;
  }
}

