interface Displayable {
  void display();
}

interface Moveable {
  void move();
}

abstract class SpaceInvaders implements Displayable{
}
  
  public class playerShip extends SpaceInvaders implements Moveable{
  PImage img;
  PImage bg;
  int y;
  
    void display(){
      img = loadImage("playerShip.PNG");
    }
  
  }

  void setup() {
    size(360, 640);
    bg = loadImage("star.jpg");
  }

  void draw() {
    background(bg);
  
    stroke(226, 204, 0);
    line(0, y, width, y);
  
    y++;
    if (y > height) {
      y = 0; 
    }
    image(img, 160, 550, width/7, height/10);
  }