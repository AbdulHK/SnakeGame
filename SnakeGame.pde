public class SnakeGame 
{
  private boolean isStarted = false;
  //snake body
  private ArrayList<SnakeClass> snake;

  private int X = 3;
  private int Y = 2;
  //collection of apples
  private ArrayList<SnakeClass> apples;
  //collection of apples types
  private ArrayList<Integer> applesTypes;
  //snake element radius
  private int radius = 10;
  //snake current direction
  private String direction;
  //current score
  int score = 0;

  
   //Constructor
   // count 
  
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


  public ArrayList<SnakeClass> getSnake()
  {
    return snake;
  }

  public boolean isIsStarted() 
  {
    return isStarted;
  }

  public void setIsStarted(boolean isStarted) 
  {
    this.isStarted = isStarted;
  }

  public String getDirection() 
  {
    return direction;
  }

  public void setDirection(String direction) 
  {
    this.direction = direction;
  }

  public void checkApplesTime()
  {
    //checks appletime
  }

  
   // Computes the coordinates of the following items and stores them in a collection
   //wight of frame
   // hight of frame
   
  public void nextStep(int wight, int hight)
  {
    SnakeClass temp = snake.get(snake.size()-1);
    int x = temp.getPositionX();
    int y = temp.getPositionY();
    //dependent on direction create new snake head with next coordinates, and remove 
    //tail element
    if (direction.equals("U")) 
    {
      y -= radius;
    }
    if (direction.equals("D")) 
    {
      y += radius;
    }
    if (direction.equals("L"))
    {
      x -= radius;
    }
    if (direction.equals("R"))
    {
      x += radius;
    }if (x < 0) 
    {
            x = width; 
          }
        if (x > width)
        {
            x = 0; 
        }
        if (y < 70) 
        {
          y = height; 
        }
        if (y > height)
        {
          y = 74; 
        }
    snake.add(new SnakeClass(x, y, temp.getRadius()));
    snake.remove(0);
  }

  
   //Create apple 
   //wight of frame
   // hight of frame
   //return object of apple
   
  public void createApple(int wight, int hight)
  {
    if(!apples.isEmpty())
    {
      if(apples.size() >= 2)
        return; 
  
      //with probability 00.01% remove any of apples
      if(random(100) > 99.99)
      {
          int removeApple = (int)random(apples.size());
          apples.remove(removeApple);
          applesTypes.remove(removeApple);
      }
   }
    
    while (true) 
    {
      //randomly create new apple position
      int xa = (int)(random(wight-100))+50;
      int ya = (int)(random(hight-100))+70;
         
      if (!SnakeOnApple())
      {
        apples.add(new SnakeClass(xa, ya, radius));
        int type = 1;
        //generate apple type
        float randomType = random(100);
        //with probability 50% will be created green apple
        if(randomType > 50)
        {
          //else with probability 25% will be created violet apple
            if(randomType > 75)
            {
              //else with probability 11% will be created red apple
              if(randomType > 86)
              {
                //else with probability 10% will be created blue apple
                if(randomType > 96)
                {
                  //else with probability 4% will be created white apple
                  type = 5;
                }else
                {
                  type = 4;
                }
              }
              else
              {
                type = 3;
              }    
            }
            else
            {
              type = 2;
          }
        }
        else
        {
          type = 1;
        }
        applesTypes.add(type);
        return;
      }
    }
  }

  
    //Checks whether the snake grabbed an apple
   //return boolean result of operation
   
  public boolean SnakeOnApple()
  {
    if (apples == null || apples.isEmpty()) 
    {
      return false;
    }
    
    
    //for each apple and snake body element
    for(int j = 0; j < apples.size(); j++)
    {
    
      for (int i = 0; i<snake.size (); i++)
      {
        //check position
        if (Math.abs(snake.get(i).getPositionX() - apples.get(j).getPositionX()) < 15 && 
        Math.abs(snake.get(i).getPositionY() - apples.get(j).getPositionY()) < 15)
        {
               player.play();
               player = minim.loadFile("sound//shootsound.mp3");

          //if match - dependent on type change game settings
          switch(applesTypes.get(j))
          {
          case 1:
          //green apple - add 10 points, and 3 length points
            score += 10;
            increaseSnake(width, height);
            break;
          case 2:
          //violen - add 5 score points
            score += 5;
            break;
          case 3:
          //reduce the time delay
            timeDelay = timeDelay/2;
            break;
          case 4:
          //increase time delay
            timeDelay = (int)(timeDelay*1.5);
            break;
          case 5:
          //remove from the end of the snake half of the items
            int newSize = snake.size()/2;
            for(int k = 0; k<snake.size()/2; k++)
              snake.remove(0);
            break;
          }
          
          //remove apple
          apples.remove(j);
          applesTypes.remove(j);
          
          return true;
        }
      }
    }
    return false;
  }

  
   //Increases the size of the snake
   //param wight of frame
   //param hight of frame
   
  public void increaseSnake(int wight, int hight)
  {
    for (int i = 0; i<X; i++) 
    {
      //dependent on direction add elements to snake head
      SnakeClass temp = snake.get(snake.size()-1);
      int x = temp.getPositionX();
      int y = temp.getPositionY();
      if (direction.equals("U"))
      {
        y -= radius;
      }
      if (direction.equals("D")) 
      {
        y += radius;
      }
      if (direction.equals("L"))
      {
        x -= radius;
      }
      if (direction.equals("R"))
      {
        x += radius;
      }
      if (x>wight)
      {
        x -= wight;
      }
      if (x<0)
      {
        x += wight;
      }
      if (y>hight) 
      {
        y -= hight-70;
      }
      if (y<70) 
      {
        y += hight-70;
      }
      snake.add(new SnakeClass(x, y, temp.getRadius()));
    }
  }

  
   // Checks whether the snake is not bumped into itself
   //return boolean result of operation
   
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

