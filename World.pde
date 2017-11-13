class World {
  final int RIGHT_BOUND = (int)(width*2);
  final int LEFT_BOUND = width/2;
  final int MAX_TICKS = 500;
  Hero hero = new Hero();
  ArrayList<Monster> monsters = new ArrayList<Monster>(){{
    add(new Monster(width/2, 5+level));
    add(new Monster(width*2, 5+level));
  }};
  ArrayList<Monster> deadMonsters = new ArrayList<Monster>();
  Floor floor = new Floor();
  Background background = new Background();
  int ticks = 0;
  int level = 0;
  int monstersKilled = 0;
  
  void draw() {
    int translateX = (int)hero.getX()-width/2;
    translateX = min(max(LEFT_BOUND, translateX), RIGHT_BOUND-width);
    pushMatrix();
    translate(-translateX/50, 0);
    background.draw();
    popMatrix();
    pushMatrix();
    translate(-translateX, 0);
    floor.draw(hero.getX(), hero.getY());
    hero.draw();
    for (Monster m : monsters){
      m.draw();
    }
    popMatrix();
    fill(255);
    stroke(0);
    textSize(40);
    text("Level: "+level, 20, 40);
    text("Health: "+getHero().health, width/2-100, 40);
    text("Kill Score: "+monstersKilled, width-300, 40);
    fill(125);
    textSize(15);
    text("TICKS LEFT: "+ max(MAX_TICKS-ticks, 0), 20, 60);
  }
  
  void tick() {
    ticks += 1;
    monsters.removeAll(deadMonsters);
    deadMonsters.clear();
    background.tick();
    hero.tick();
    if (hero.getX() > RIGHT_BOUND){
      hero.move(RIGHT_BOUND-hero.getX(), 0);
    }
    if (hero.getX() < LEFT_BOUND){
      hero.move(LEFT_BOUND-hero.getX(),0);
    }
    floor.tick();
    for (Monster m : monsters){
      m.tick();
    }
    if (monsters.isEmpty() && ticks > MAX_TICKS){
      ticks = 0;
      level++;
      increaseMonsterSize();
    }
    if (ticks < MAX_TICKS && ticks%(min(max(2,7-level), 4)*50) == 0){
      monsters.add(new Monster(width/2, 5+level));
      monsters.add(new Monster(width*2, 5+level));
    }
  }
  
  Hero getHero(){
    return hero;
  }
  
  void damageMonster(int x, boolean left, int damage){
    for (Monster monster : monsters){
      if (monster.contains(x)){
        if (left) {
          monster.damageRight(damage);
        } else {
          monster.damageLeft(damage);
        }
      }
    }
  }
  
  void damageHero(int x, boolean left, int damage){
    if (hero.contains(x)){
      if (left) {
        hero.damageRight(damage);
      } else {
        hero.damageLeft(damage);
      }
    }
  }
  
  void addDeadMonster(Monster m){
    deadMonsters.add(m);
    monstersKilled += 1;
  }
  
  int getNextLeft(int x){
    int dist = width/2;
    for (Monster m : monsters){
      if (m.worldX < x && dist > x-m.worldX) {
        dist = (int)(x-m.worldX);
      }
    }
    return (dist == width/2) ? 0 : -(dist+monsters.get(0).state.getWidth()/4);
  }
  
  int getNextRight(int x){
    int dist = width/2;
    for (Monster m : monsters){
      if (m.worldX > x && dist > m.worldX-x) {
        dist = (int)(m.worldX-x);
      }
    }
    return (dist == width/2) ? 0 : dist+monsters.get(0).state.getWidth()/4;
  }

}