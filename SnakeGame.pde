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
  public void nextStep(int wight, int hight)
  {
    SnakeClass temp = snake.get(snake.size()-1);
    int x = temp.getPositionX();
    int y = temp.getPositionY();
    //dependent on direction create new snake head with next coordinates, and remove 
    //tail element
    if (direction.equals("U")) {
      y -= radius;
    }
    if (direction.equals("D")) {
      y += radius;
    }
    if (direction.equals("L")) {
      x -= radius;
    }
    if (direction.equals("R")) {
      x += radius;
    }
     snake.add(new SnakeClass(x, y, temp.getRadius()));
    snake.remove(0);
  }
   public void createApple(int wight, int hight)
  {
    if(!apples.isEmpty()){
      if(apples.size() >= 2)
        return; 
  
      //with probability 00.01% remove any of apples
      if(random(100) > 99.99){
          int removeApple = (int)random(apples.size());
          apples.remove(removeApple);
          applesTypes.remove(removeApple);
      }
   }
    
    while (true) {
      //randomly create new apple position
      int xa = (int)(random(wight-100))+50;
      int ya = (int)(random(hight-100))+70;
         
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

