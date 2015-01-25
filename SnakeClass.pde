public class SnakeClass {
  
int positionX;
     int positionY;
     int radius;
     long appleTime = 0;
     long currentTime = 0;
    
   
    public SnakeClass(int positionX, int positionY, int radius) {
        this.positionX = positionX;
        this.positionY = positionY;
        this.radius = radius;
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

