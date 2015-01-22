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
