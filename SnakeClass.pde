public class SnakeClass
{
  
int positionX;
     int positionY;
     int radius;
     long appleTime = 0;
     long currentTime = 0;
    
    
     //Simple constructor
     //positionX x position of snake element
     //positionY y position of snake element
     //radius size of snake element
     //color color of snale element
     
    public SnakeClass(int positionX, int positionY, int radius)
    {
        this.positionX = positionX;
        this.positionY = positionY;
        this.radius = radius;
    }

    public long getAppleTime() {
        return appleTime;
    }

    public void setAppleTime(long appleTime)
    {
        this.appleTime = appleTime;
    }

    public void setCurrentTime(long currentTime) 
    {
        this.currentTime = currentTime;
    }

    public long getCurrentTime() {
        return currentTime;
    }
    
    public int getPositionX() {
        return positionX;
    }

    public int getPositionY() {
        return positionY;
    }

    public void setPositionX(int positionX) {
        this.positionX = positionX;
    }

    public void setPositionY(int positionY) {
        this.positionY = positionY;
    }

    
    public int getRadius() {
        return radius;
    }
            
}

