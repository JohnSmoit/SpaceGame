class BulletBase { // this thing is the base class for all bullets
  PVector position;
  PVector velocity;
  float direction;
  float speed;
  int timeLeft;
  boolean isAlive;
  float damage;
  BulletBase(PVector spawnPosition, float speedMultiplier, float damageMultiplier, float spawnDirection, int range) {
    position = spawnPosition;
    isAlive = true; //if a bullet is alive it performs its actions but if not it is deleted.
    speed = 8.0; //base speed and damage (is multiplied by modifier later)
    damage = 10.0;
    direction = spawnDirection;
    timeLeft = range;
    speed += speed * speedMultiplier; //this adds bonuses instead of multiplying the base value.
    damage += damage * damageMultiplier; //same as speed
    velocity = new PVector(0, -10);
  }
  
  void move() {
    if (timeLeft > 0) {
      position.add(velocity);
    }
    else {
      isAlive = false;
    }
  }
  void display() {
    fill(255);
    ellipse(position.x, position.y, 10, 10);
  }
  void update() {
    move();
    display();
  }
} 
