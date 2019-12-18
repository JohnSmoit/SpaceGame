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
    this.size = dimensions;
    this.position = spawnPos;
    this.health = 100;
    this.speed = 5.0;
    this.speedModifier = 1.0;
    this.velocity = new PVector(0, 0);
    this.shootSpeed = 120;
    this.shooTimer = 0;
    this.bullets = new ArrayList<BulletBase>(); //default bullet base is player bullet for now.
  }
  void update(boolean up, boolean down, boolean left, boolean right, boolean shooting) {
    print (" Y: " + this.position.y);
    move(up, down, left, right);
    shoot(shooting);
    display();
  }
  void move(boolean up, boolean down, boolean left, boolean right) {
    if (up) {
      this.velocity.y -= speed;
    }
    if (down) {
      this.velocity.y += speed;
    }
    if (left) {
      this.velocity.x -= speed;
    }
    if (right) {
      this.velocity.x += speed;
    }
    this.position.add(velocity);
    this.velocity.x = 0;
    this.velocity.y = 0;
  }
  void display() {
    fill(255, 0, 0);
    ellipse(this.position.x, this.position.y, this.size, this.size);
  }
  void shoot(boolean shooting) {
    if (shooting) {
      if (this.shooTimer < this.shootSpeed) {
        this.shooTimer++;
      }
      else {
        this.bullets.add(new BulletBase(position, 1, 1, 0, 500));
        this.shooTimer = 0; 
      }
    }
    for (int i = 0; i < bullets.size(); i++) {
      BulletBase bullet = bullets.get(i);
      if (bullet.isAlive) {
        //print("111111");
        bullet.update();
      }
      else {
        this.bullets.remove(i);
      }
    }
  }
  
}
