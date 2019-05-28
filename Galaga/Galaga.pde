interface Displayable {
  void display();
}

PImage bg;
int y; 
int enemyX, enemyY;

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
  
  }
  
  public class Bullets extends SpaceInvaders{
  int startx, starty;
  
  Bullets(int x, int y){
      this.startx = x;
      this.starty = y; 
  
  }
  
  }
  
  
  
  ArrayList<Displayable> spawnEnemies1;
  ArrayList<Displayable> spawnEnemies2;
  void setup() {
    spawnEnemies1 = new ArrayList<Displayable>();
    spawnEnemies2 = new ArrayList<Displayable>();
    size(360, 640);
    bg = loadImage("star.jpg");
    for(int x = 0; x < 5; x++){
      Enemies e = new Enemies(enemyX + (x * 75), enemyY);
      spawnEnemies1.add(e); 
    }
    
    for(int x = 0; x < 4; x++){
      Enemies e = new Enemies(enemyX + (x * 90), 50);
      spawnEnemies2.add(e); 
    }
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
    
    for(Displayable Enemies: spawnEnemies1){
      Enemies.display(); 
    }
      
    for(Displayable Enemies: spawnEnemies2){
      Enemies.display(); 
   }
  }