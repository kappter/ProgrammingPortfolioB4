class Rock {
  // member variables
  int x,y,dia,health,speed,rad;
  char displayMode;
  color c;
  PImage rock1;
  
  // constructor
  Rock(int x, int y) {
    this.x = x;
    this.y = y;
    dia = 50;
    health = 50;
    speed = int(random(1,8));
    rad = 25;
    displayMode = '1';
    c = #715109;
    rock1 = loadImage("rock1.png");
    
  }
  
  // collision for rocks and lasers
  boolean laserIntersection(Laser laser){
    float distance = dist(x,y,laser.x,laser.y);
    if(distance < rad + laser.rad) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean reachedBottom() {
    if(y>height) {
      return true;
    } else {
      return false;
    }
  }
  
  void move() {
    y+=speed;
  }
  
  // member methods
  void display() {
    fill(c);
    ellipse(x,y,dia,dia);
    //if(random(10)>6){
    //image(rock1,x,y);
    //} else if (random(10)>5){
    //  image(rock2,x,y);
    //}
    
  }
}
