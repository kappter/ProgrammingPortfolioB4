// SpaceGame | Dec 2020
// by Mr Kapptie
// TODO: Project Setup

SpaceShip s1;
ArrayList<Laser> lasers;
ArrayList<Rock> rocks;
ArrayList<Star> stars;
Timer timer;
int score;

void setup() {
  size(500, 500);
  s1 = new SpaceShip(#E3A11E);
  lasers = new ArrayList();
  rocks = new ArrayList();
  stars = new ArrayList();
  timer = new Timer(int(random(500, 900)));
  score = 0;
  timer.start();
}

void draw() {
  noCursor();
  background(0);

  stars.add(new Star(int(random(width)), int(random(height))));
  for (int i = 0; i < stars.size(); i++) {
    Star star = stars.get(i);
    star.display();
    star.move();
    if (star.reachedBottom()) {
      stars.remove(star);
    }
  }

  if (timer.isFinished()) {
    rocks.add(new Rock(int(random(width)), -50));
    timer.start();
  }

  for (int i = 0; i < rocks.size(); i++) {
    Rock rock = rocks.get(i);
    rock.display();
    rock.move();
    // collision between ship and rock
    if(s1.rockIntersection(rock)) {
      rocks.remove(rock);
      s1.health-=rock.health;
      score+=50;
    }
    if (rock.reachedBottom()) {
      rocks.remove(rock);
    }
  }

  for (int i = 0; i < lasers.size(); i++) {
    Laser laser = lasers.get(i);
    laser.display();
    laser.fire();
    // detect rock collision
    for (int j = 0; j < rocks.size(); j++) {
      Rock rock = rocks.get(j);
      if(rock.laserIntersection(laser)){
        lasers.remove(laser);
        rock.health-=laser.power;
        if(rock.health<1){
          rocks.remove(rock);
          score+=rock.health;
        }
      }
    }
    if (laser.reachedTop()) {
      lasers.remove(laser);
    }
  }

  infoPanel();

  s1.display(mouseX, mouseY);
}

void mousePressed() {
  if (s1.ammo >0) {
    lasers.add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+10, s1.y));
  }
  s1.ammo--;
}

void infoPanel() {
  fill(128, 128);
  rectMode(CORNER);
  rect(0, height-50, width, 50);
  fill(255, 128);
  text("Health:" + s1.health, 20, height-20);
  text("Lives:" + s1.lives, 150, height-20);
  text("Ammo:" + s1.ammo, 210, height-20);
  text("Level:" , 300, height-20);
  text("Score:" + score, 350, height-20);
}
