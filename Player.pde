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

  Player(int index, color colour, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();

    game = new Game();    
    

    this.index = index;
    this.colour = colour;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
  }

  Player(int index, color colour, XML xml)
  {
    this(index
      , colour
      , buttonNameToKey(xml, "up")
      , buttonNameToKey(xml, "down")
      , buttonNameToKey(xml, "left")
      , buttonNameToKey(xml, "right")
      , buttonNameToKey(xml, "start")
      , buttonNameToKey(xml, "button1")
      , buttonNameToKey(xml, "button2")
      );
  }

  void update()
  {
    if (checkKey(up))
    {
      game.setDirection("U");
    }
    if (checkKey(down))
    {
      game.setDirection("D");
    }
    if (checkKey(left))
    {
      game.setDirection("L");
    }    
    if (checkKey(right))
    {
      game.setDirection("R");
    }
    if (checkKey(start))
    {
      game.startGame();
      println("Player " + index + " start");
    }
    if (checkKey(button1))
    {
      println("Player " + index + " button 1");
    }
    if (checkKey(button2))
    {
      println("Player " + index + " butt2");
    }
  }

  void display()
  {    
    
    game.display();
  }
}

