//CONSTANTS
final int IDLE_LEFT = 0, IDLE_RIGHT = 1, MOVE_LEFT = 2, MOVE_RIGHT = 3, ATTACK_LEFT_1 = 4, ATTACK_RIGHT_1 = 5, ATTACK_LEFT_2 = 6, ATTACK_RIGHT_2 = 7, ATTACK_LEFT_3 = 8, ATTACK_RIGHT_3 = 9, DAMAGE_LEFT = 10, DAMAGE_RIGHT = 11;

final HeroState[] cachedStates = new HeroState[12];

HeroState idleLeft(){
  if (cachedStates[IDLE_LEFT] == null){
    cachedStates[IDLE_LEFT] = new IdleLeft();
  }
  cachedStates[IDLE_LEFT].reset();
  return cachedStates[IDLE_LEFT];
}

HeroState idleRight(){
  if (cachedStates[IDLE_RIGHT] == null){
    cachedStates[IDLE_RIGHT] = new IdleRight();
  }
  cachedStates[IDLE_RIGHT].reset();
  return cachedStates[IDLE_RIGHT];
}

HeroState moveLeft(){
  if (cachedStates[MOVE_LEFT] == null){
    cachedStates[MOVE_LEFT] = new MovingLeft();
  }
  cachedStates[MOVE_LEFT].reset();
  return cachedStates[MOVE_LEFT];
}

HeroState moveRight(){
  if (cachedStates[MOVE_RIGHT] == null){
    cachedStates[MOVE_RIGHT] = new MovingRight();
  }
  cachedStates[MOVE_RIGHT].reset();
  return cachedStates[MOVE_RIGHT];
}

HeroState atkLeft1(){
  if (cachedStates[ATTACK_LEFT_1] == null){
    cachedStates[ATTACK_LEFT_1] = new AttackLeft1();
  }
  cachedStates[ATTACK_LEFT_1].reset();
  return cachedStates[ATTACK_LEFT_1];
}

HeroState atkLeft2(){
  if (cachedStates[ATTACK_LEFT_2] == null){
    cachedStates[ATTACK_LEFT_2] = new AttackLeft2();
  }
  cachedStates[ATTACK_LEFT_2].reset();
  return cachedStates[ATTACK_LEFT_2];
}

HeroState atkLeft3(){
  if (cachedStates[ATTACK_LEFT_3] == null){
    cachedStates[ATTACK_LEFT_3] = new AttackLeft3();
  }
  cachedStates[ATTACK_LEFT_3].reset();
  return cachedStates[ATTACK_LEFT_3];
}


HeroState atkRight1(){
  if (cachedStates[ATTACK_RIGHT_1] == null){
    cachedStates[ATTACK_RIGHT_1] = new AttackRight1();
  }
  cachedStates[ATTACK_RIGHT_1].reset();
  return cachedStates[ATTACK_RIGHT_1];
}

HeroState atkRight2(){
  if (cachedStates[ATTACK_RIGHT_2] == null){
    cachedStates[ATTACK_RIGHT_2] = new AttackRight2();
  }
  cachedStates[ATTACK_RIGHT_2].reset();
  return cachedStates[ATTACK_RIGHT_2];
}

HeroState atkRight3(){
  if (cachedStates[ATTACK_RIGHT_3] == null){
    cachedStates[ATTACK_RIGHT_3] = new AttackRight3();
  }
  cachedStates[ATTACK_RIGHT_3].reset();
  return cachedStates[ATTACK_RIGHT_3];
}

HeroState hDamageLeft(){
  
  if (cachedStates[DAMAGE_LEFT] == null){
    cachedStates[DAMAGE_LEFT] = new HDamageLeft();
  }
  cachedStates[DAMAGE_LEFT].reset();
  return cachedStates[DAMAGE_LEFT];
}

HeroState hDamageRight(){
  
  if (cachedStates[DAMAGE_RIGHT] == null){
    cachedStates[DAMAGE_RIGHT] = new HDamageRight();
  }
  cachedStates[DAMAGE_RIGHT].reset();
  return cachedStates[DAMAGE_RIGHT];
}