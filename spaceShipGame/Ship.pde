class PlayerShip { // player does not base off of entity and instead is its own class
  PVector position;
  PVector velocity;
  ArrayList<BulletBase> bullets;
  int size;
  int health;
  float speed;
  float speedModifier;
  float shootSpeed;
  float shooTimer;
  PlayerShip(int dimensions, PVector spawnPos) {
    size = dimensions;
    position = spawnPos;
    health = 100;
    speed = 5.0;
    speedModifier = 1.0;
    velocity = new PVector(0, 0);
    shootSpeed = 120;
    shooTimer = 0;
    bullets = new ArrayList<BulletBase>(); //default bullet base is player bullet for now.
  }
  void update(boolean up, boolean down, boolean left, boolean right, boolean shooting) {
    move(up, down, left, right);
    shoot(shooting);
    display();
  }
  void move(boolean up, boolean down, boolean left, boolean right) {
    if (up) {
      velocity.y -= speed;
    }
    if (down) {
      velocity.y += speed;
    }
    if (left) {
      velocity.x -= speed;
    }
    if (right) {
      velocity.x += speed;
    }
    position.add(velocity);
    velocity.x = 0;
    velocity.y = 0;
  }
  void display() {
    fill(255, 0, 0);
    ellipse(position.x, position.y, size, size);
  }
  void shoot(boolean shooting) {
    if (shooting) {
      if (shooTimer < shootSpeed) {
        shooTimer++;
      }
      else {
        bullets.add(new BulletBase(position, 1, 1, 0, 500));
        shooTimer = 0; 
      }
    }
    for (int i = 0; i < bullets.size(); i++) {
      BulletBase bullet = bullets.get(i);
      if (bullet.isAlive) {
        bullet.update();
      }
      else {
        bullets.remove(i);
      }
    }
  }
  
}
