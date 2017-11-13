class MonsterAttackLeft extends MonsterState{
  
  MonsterAttackLeft(){
    super(0.4,12,"\\Resource\\Monster\\AttackLeft\\",".png");
  }
  
  boolean tickState(Monster m){
    if (m.worldX <= getHero().getX()){
      m.setState(m.attackRight);
      return true;
    } else {
      world.damageHero((int)m.worldX-getWidth()/4, true, 1);
      m.worldX -= 5;
      return false;
    }
  }
}

class MonsterAttackRight extends MonsterState{
  
  MonsterAttackRight(){
    super(0.4,12,"\\Resource\\Monster\\AttackRight\\",".png");
  }
  
  boolean tickState(Monster m){
    if (m.worldX > getHero().getX()){
      m.setState(m.attackLeft);
      return true;
    } else {
      world.damageHero((int)m.worldX+getWidth()/2, false, 1);
      m.worldX += 5;
      return true;
    }
  }
}

abstract class Damage extends MonsterState{
  
  Damage(String name){
    super(0.4,4,"\\Resource\\Monster\\"+name+"\\", ".png");
  }
  
  boolean tickState(Monster m){
    if (currentIndexFloat+FRAME_SPEED >= NUM_OF_IMAGES){
      m.setState(m.attackRight);
      return true;
    }
    return false;
  }

}

class DamageLeft extends Damage {
  
  DamageLeft(){
    super("DamageLeft");
  }
  
  void tick(Monster m){
    m.worldX += 14;
    super.tick(m);
  }
}

class DamageRight extends Damage {
  
  DamageRight(){
    super("DamageRight");
  }
  
  void tick(Monster m){
    m.worldX -= 14;
    super.tick(m);
  }
  
}