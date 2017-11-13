abstract class AttackLeft extends Attack {
  
  AttackLeft(float frameSpeed, float numberOfImages, String directory, String extn) {
    super(frameSpeed, numberOfImages, directory, extn);
  }
  
  void tick(){
    getHero().move(-speed,0);
    if ((int)currentIndexFloat % 4 == 0){
      world.damageMonster((int)getHero().getX(), true, 1);
    }
    super.tick();
  }
  
  void decideIdle() { getHero().setState(new IdleLeft()); }
}

class AttackLeft1 extends AttackLeft {
  AttackLeft1() { super(1,9,"\\Resource\\Hero\\AttackLeft1\\", ".png"); }
  void decideNextAttack() { getHero().setState(new AttackLeft2()); }
}

class AttackLeft2 extends AttackLeft {
  AttackLeft2() { super(1,9,"\\Resource\\Hero\\AttackLeft2\\", ".png"); }
  void decideNextAttack() { getHero().setState(new AttackLeft3()); }
}

class AttackLeft3 extends AttackLeft {
  AttackLeft3() { super(1,13,"\\Resource\\Hero\\AttackLeft3\\", ".png"); }
  void decideNextAttack() { getHero().setState(new AttackLeft1()); }
}

abstract class AttackRight extends Attack {
  
  AttackRight(float frameSpeed, float numberOfImages, String directory, String extn) {
    super(frameSpeed, numberOfImages, directory, extn);
  }
  
  void tick(){
    getHero().move(speed,0);
    super.tick();
    if ((int)currentIndexFloat % 4 == 0){
      world.damageMonster((int)getHero().getX(), false, 1);
    }
  }
  
  void decideIdle() { getHero().setState(new IdleRight()); }
}

class AttackRight1 extends AttackRight {
  AttackRight1() { super(1,9,"\\Resource\\Hero\\AttackRight1\\", ".png"); }
  void decideNextAttack() { getHero().setState(new AttackRight2()); }
}

class AttackRight2 extends AttackRight {
  AttackRight2() { super(1,9,"\\Resource\\Hero\\AttackRight2\\", ".png"); }
  void decideNextAttack() { getHero().setState(new AttackRight3()); }
}

class AttackRight3 extends AttackRight {
  AttackRight3() { super(1,13,"\\Resource\\Hero\\AttackRight3\\", ".png"); }
  void decideNextAttack() { getHero().setState(new AttackRight1()); }
}