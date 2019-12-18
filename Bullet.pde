class BulletBase { // this thing is the base class for all bullets
  private PVector position;
  private PVector velocity;
  private float direction;
  private float speed;
  private int timeLeft;
  private boolean isAlive;
  private float damage;
  BulletBase(PVector spawnPosition, float speedMultiplier, float damageMultiplier, float spawnDirection, int range) {
    //print("hi");
    this.position = spawnPosition;
    this.isAlive = true; //if a bullet is alive it performs its actions but if not it is deleted.
    this.speed = 8.0; //base speed and damage (is multiplied by modifier later)
    this.damage = 10.0;
    this.direction = spawnDirection;
    this.timeLeft = range;
    this.speed += speed * speedMultiplier; //this adds bonuses instead of multiplying the base value.
    this.damage += damage * damageMultiplier; //same as speed
    this.velocity = new PVector(0, -10);
  }
  
  void move() {
    if (timeLeft > 0) {
      //print("moving!!!");
      this.position.add(this.velocity);
    }
    else {
      this.isAlive = false;
    }
  }
  void display() {
    print(" Y2: " + this.position.y);
    fill(255);
    ellipse(this.position.x, this.position.y, 10, 10);
  }
  void update() {
    move();
    display();
  }
} 
