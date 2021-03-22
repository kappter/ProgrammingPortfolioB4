class SpaceShip {
  // member variable
  int x, y, health, ammo, lives, rad;
  char displayMode;
  color c1;

  // constructor
  SpaceShip(color c1) {
    x = 0;
    y = 0;
    health = 100;
    ammo = 1000;
    lives = 3;
    rad = 25;
    displayMode = '1';
    this.c1 = c1;
  }
  
  // collision for rocks and spaceship
  boolean rockIntersection(Rock rock){
    float distance = dist(x,y,rock.x,rock.y);
    if(distance < rad + rock.rad) {
      return true;
    } else {
      return false;
    }
  }

  // member methods 
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    if (displayMode == '1') {
      rectMode(CENTER);
      stroke(150);
      strokeWeight(2);
      fill(c1);
      rect(x+18, y+10, 8, 8);
      rect(x-18, y+10, 8, 8);
      line(x+35, y+10, x+35, y);
      line(x-35, y+10, x-35, y);
      fill(128);
      triangle(x, y-20, x+40, y+10, x-40, y+10);
      fill(200);
      ellipse(x, y+10, 20, 80);
    }
  }
}
