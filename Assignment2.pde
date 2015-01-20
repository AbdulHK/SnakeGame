//width and height
static int width = 500;
static int height = 500;
static int timeDelay = 100;
//delay of draw step

ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];

void setup()
{
  size(width, height);
  setUpPlayerControllers();
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

