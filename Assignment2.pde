PrintWriter output;
   import ddf.minim.*;    //import library for sounds

    Minim minim;  //sounds objects
  AudioPlayer player;
  
  Minim minimCrash;
  AudioPlayer playerCrash;
//screen width and height
static int width = 500;
static int height = 500;
//speed of the game - delay time after each draw step
static int timeDelay = 100;
int stage=0;


ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];


void fileCopy(){  
  File file = saveFile("scores.txt");
  println(file);
 
  File dest = new File(savePath("new.txt"), "scores.txt");
  println(dest);
} 

void setup()
{
  size(width, height);
  stage=0;
  //setUpPlayerControllers();
  minim = new Minim(this);    //load sound for shoot
  player = minim.loadFile("sound//shootsound.mp3");
  minimCrash = new Minim(this);    //load sound to collide spaceship with Meteor
  playerCrash = minimCrash.loadFile("sound//Crash.wav");
}

void draw()
{
  if(stage==0)
  {
    fill(221);
    background(0);
    
  text("press P to start the game and see the rules",20,210);
  text("press  M to view scores",20,220);
  }
  
  if(checkKey('M'))
  {
    stage=1;
    showscore();
  }
  if(checkKey('p'))
  {
    //stage=2;
    setUpPlayerControllers();
  }

  for (Player player : players)
  {
    player.update();
    player.display();
  }
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  //.. Others to follow
  return value.charAt(0);
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);

  XML playerXML = children[0];
  Player p = new Player(
  0
    , color(random(0, 255), random(0, 255), random(0, 255))
    , playerXML);
  int x = (0 + 1) * gap;
  p.pos.x = 230;
  p.pos.y = 300;
  players.add(p);
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
  void showscore()
  {
    background(0);
  String[] lines = loadStrings("data/scores.txt");
  if (lines.length==0)
  {
    text("there is no scores",20,210);
  }
  else
  {
  for(int i=0;i<lines.length;i++)
  {
  text("Your score is: " + lines[i],20,210);
  break;
  }
  }
   text("press P to start the game",20,220);
    
  }

