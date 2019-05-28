int radius = 10, directionX = 1, directionY = 0;
float x=20, y=20, speed=0.5;
// =========================================================
void setup()
{
  size(500, 500);
  smooth();
  // fill (color(222, 22, 22));
  noStroke();
  ellipseMode(RADIUS);
}
void draw()
{
  background(0);
  // changing Position
  x=x+speed*directionX;
  y=y+speed*directionY; 
  // check boundaries
  if ((x>width-radius) || (x<radius))
  {   
    directionX=-directionX;
  }
  if ((y>height-radius) || (y<radius))
  {   
    directionY=-directionY;
  } 
  // draw
  // if(direction==1)
  // rect(x, y, 20, 20);
  fill (color(222, 22, 22)); 
  ellipse (x, y, radius, radius);    // body
  fill (color(22, 82, 22)); 
  ellipse (x-4, y-4, 2, 2);  // the eye
}
// =========================================================
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      //if (directionX>0) { 
      directionX=-1;
      directionY=0;
      //}
    }
    else if (keyCode == RIGHT)
    {
      //if (directionX<0) {  
      directionX=1;
      directionY=0;
      //}
    }
    else if (keyCode == UP)
    {
      //if (directionY<0) {
      directionY=-1;
      directionX=0;
      //}
    }
    else if (keyCode == DOWN)
    {
      //if (directionY<0) { 
      directionY=1;
      directionX=0;
      //}
    }
  }
}