class Monster {
  final int FIXED_Y = (int)(height*8.2/10);
  MonsterState state = new MonsterAttackLeft();
  float worldX, worldY = 0;
  int health = 10;
  final MonsterState attackLeft = new MonsterAttackLeft(), attackRight = new MonsterAttackRight(), damageLeft = new DamageLeft(), damageRight = new DamageRight();
  
  Monster(float x, int health){
    worldX = x;
    this.health = health;
  }
  
  void draw() {
    if (health > 0){
      state.draw((int)worldX,(int)worldY + FIXED_Y);
    } else {
      state.drawDead((int)worldX, (int)worldY + FIXED_Y, this);
    }
  }
  
  void tick() {
    state.tick(this);
  }
  
  void damageLeft(int damage){
    health -= damage;
    if (health > 0) {
      state = damageLeft;
      state.reset();
    }
  }
  
  void damageRight(int damage){
    health -= damage;
    if (health > 0) {
      state = damageRight;
      state.reset();
    }
  }
  
  void setState(MonsterState s){
    state = s;
  }
  
  boolean contains(int x){
    return (x < worldX+state.getWidth()/4 && x > worldX - state.getWidth()/4);
  }
  
  float getX(){
    return worldX;
  }
}