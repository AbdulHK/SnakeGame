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
