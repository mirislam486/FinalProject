PImage bg;
int enemyX, enemyY;
int enemySpeed, bulletSpeed; 




interface Displayable {
  void display();
}

interface Moveable {
  void move();
}


abstract class SpaceInvaders implements Moveable{
  float x, y, dx, dy; 
  //int xcor, ycor; 
  
  SpaceInvaders(x, y){
    this.x = x;
    this.y = y;
  }
  
 // abstract void shoot(); 
}
  
  public class playerShip extends SpaceInvaders{
  PImage img;
  int startx, starty;
  
    
    playerShip(int x, int y){
      super(x, y); 
    }
  
    void display(){
      img = loadImage("playerShip.PNG");
      image(img, startx, starty, width/7, height/10); 
    }
    
   void move(){
     
   }
    
  
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
  
  public class Bullets extends SpaceInvaders implements Displayable{
  int startx, starty;
  
    Bullets(int x, int y){
        this.startx = x;
        this.starty = y; 
  
    }
  
    void move(){
    
    }
  
    void display(){
      ellipse(enemyX, enemyY, 20, 30);
    }
  
  }
  
  //=========================================================
  
  
  
  ArrayList<Displayable> spawnEnemies1;
  ArrayList<Displayable> spawnEnemies2;
  ArrayList<Moveable> moveEnemies;
  playerShip player; 
  
  
  
  
  void setup() {
    player = new playerShip(160, 550);
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
  
  