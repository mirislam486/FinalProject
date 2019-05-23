PImage bg;
int y; 

abstract class SpaceInvaders{
  int xcor, ycor; 
}
  
  public class playerShip extends SpaceInvaders{
  PImage img;
  int startx, starty;
  
    
    playerShip(int x, int y){
      this.startx = x;
      this.starty = y; 
    }
  
    void display(){
      img = loadImage("playerShip.PNG");
      image(img, startx, starty, width/7, height/10); 
    }
    
   void move(){
    if (keyPressed == true) {
      if (keyCode == LEFT) {
        startx -= 10;
      } else if (keyCode == RIGHT) {
        startx += 10;
      } 
    }else{
      startx += 0;
    }
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
    playerShip player = new playerShip(160, 550);
    player.display();
    player.move(); 
  }