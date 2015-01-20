class Player
{
  Game game;

  PVector pos;
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int index;
  color colour;

  Player()
  {
    pos = new PVector(width / 2, height / 2);
  }
