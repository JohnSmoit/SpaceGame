
PlayerShip player;
boolean up = false;
boolean down = false;
boolean left = false;
boolean right = false;
boolean shooting = false;
void setup() {
  size(600, 600);
  player = new PlayerShip(20, new PVector(0, 0));
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  player.update(up, down, left, right, shooting);
}
void keyTyped() {
  if (key == 'w') {
    up = true;
  }
  if (key == 'a') {
    left = true;
  }
  if (key == 's') {
    down = true;
  }
  if (key == 'd') {
    right = true;
  }
}
void keyReleased() {
  if (key == 'w') {
    up = false;
  }
  if (key == 'a') {
    left = false;
  }
  if (key == 's') {
    down = false;
  }
  if (key == 'd') {
    right = false;
  }
}
void mouseClicked() {
  shooting = true;
}
void mouseReleased() {
  shooting = false;
}
