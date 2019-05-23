int x, y; 

void move(){
  if (keyPressed == true) {
    if (keyCode == LEFT) {
      x -= 10;
    } else if (keyCode == RIGHT) {
      x += 10;
    } 
  }else{
    x += 0;
  }
}


void setup(){
  size(400, 400); 
}

void draw(){
  ellipse(x + 200, y + 200, 75, 75);
  move();
} 