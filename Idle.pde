abstract class Idle extends InterruptableByAttack {
  
  Idle(float frameSpeed, float numberOfImages, String directory, String extn) {
    super(frameSpeed, numberOfImages, directory, extn);
  }
  
  boolean tickState(){
    if (super.tickState()){
      return true;
    }
    return decideLeftRightMoving();
  }
}

boolean decideLeftRightMoving(){
  if (isPressed(LEFT_C) ^ isPressed(RIGHT_C)){
    if (isPressed(LEFT_C)){
      getHero().setState(moveLeft());
    } else {
      getHero().setState(moveRight());
    }
    return true;
  }
  return false;
}

class IdleLeft extends Idle {
  IdleLeft() { super(0.2, 8, "\\Resource\\Hero\\IdleLeft\\", ".png"); }
  void decideAttack() { getHero().setState(atkLeft1()); }
  
  void decideDash() {
    getHero().dashLeft();
    getHero().setState(atkRight3());
  }
  
}

class IdleRight extends Idle {
  IdleRight() { super(0.2, 8, "\\Resource\\Hero\\IdleRight\\", ".png"); }
  void decideAttack() { getHero().setState(atkRight1()); }
  
  void decideDash() {
    getHero().dashRight();
    getHero().setState(atkLeft3());
  }
}