PImage bg;
float x, y, dx = 1, dy; 
int enemyX, enemyY;
int enemySpeed, bulletSpeed; 




interface Displayable {
  void display();
}

interface Moveable {
  void move();
}


abstract class SpaceInvaders implements Moveable{
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
    
   void move(){}
    
  
  }
  
  //=======================================================
  
  public class Enemies extends SpaceInvaders implements Displayable{
  PImage img;
  int startx, starty;
  
    Enemies(int x, int y){
        this.startx = x;
        this.starty = y; 
      }
  
    void display(){  
        img = loadImage("enemy.png");
        image(img, startx, starty, width/8, height/12); 
      }
      
    void move(){
        x=x+enemySpeed*dx;
        y=y+enemySpeed*dy; 
          if ((x > width ))
          {   
            dx=-dx;
          }
          if ((y>height))
          {   
            dy=-dy;
          } 
    }
  
  }
  
  //=======================================================
  
  public class Bullets extends SpaceInvaders{
  int startx, starty;
  
  Bullets(int x, int y){
      this.startx = x;
      this.starty = y; 
  
  }
  
  void move(){
  }
  
  }
  
  //=========================================================
  
  
  
  ArrayList<Displayable> spawnEnemies1;
  ArrayList<Displayable> spawnEnemies2;
  ArrayList<Moveable> moveEnemies;
  
  
  
  
  void setup() {
    frameRate(4);
    spawnEnemies1 = new ArrayList<Displayable>();
    spawnEnemies2 = new ArrayList<Displayable>();
    moveEnemies = new ArrayList<Moveable>(); 
    size(360, 640);
    bg = loadImage("star.jpg");
    for(int x = 0; x < 5; x++){
      Enemies e = new Enemies(enemyX + (x * 75), enemyY);
      spawnEnemies1.add(e);
      moveEnemies.add(e);
    }
    
    for(int x = 0; x < 4; x++){
      Enemies e = new Enemies(enemyX + (x * 90), 50);
      spawnEnemies2.add(e); 
      moveEnemies.add(e); 
    }
  }
  
  
  
  

  void draw() {
    background(bg);
  
    stroke(226, 204, 0);
    line(0, y, width, y);
  
    //y++;
    //if (y > height) {
    //  y = 0; 
    //}
    playerShip player = new playerShip(160, 550);
    player.display();
    player.move();
    
    for(Displayable Enemies: spawnEnemies1){
      Enemies.display(); 
    }
      
    for(Displayable Enemies: spawnEnemies2){
      Enemies.display(); 
    }
      
    for(Moveable Enemies: moveEnemies){
      Enemies.move();
    }
  }
  
  