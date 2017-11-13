class Hero {
  final int FIXED_X = width/2, FIXED_Y = (int)(height*8.2/10);
  HeroState state = new IdleRight();
  float worldX = width*1.5, worldY = 0;
  int health = 20;
  int damageCooldown = 0;
  
  void draw() {
    state.draw((int)worldX,(int)worldY + FIXED_Y);
  }
  
  void setState(HeroState state){
    this.state = state;
  }
  
  void tick() {
    state.tick();
    damageCooldown = max(0, damageCooldown-1);
  }
  
  void move(float dx, float dy){
    worldX += dx;
    worldY += dy;
  }
  
  float getX(){
    return worldX;
  }
  
  float getY(){
    return worldY;
  }
  
  void dashLeft(){
    move(world.getNextLeft((int)getHero().getX()), 0);
  }
  
  void dashRight() {
    move(world.getNextRight((int)getHero().getX()),0);
  }
  
  void damageRight(int damage){
    if (damageCooldown <= 0){
      health -= damage;
      state = hDamageLeft();
      damageCooldown = 80;
    }
  }
  
  void damageLeft(int damage){
    if (damageCooldown <= 0){
      health -= damage;
      state = hDamageRight();
      damageCooldown = 80;
    }
  }
  
  boolean contains(int x) {
    return x > worldX && x < worldX + state.width()/4;
  }
}

Hero getHero() {
  return world.getHero();
}