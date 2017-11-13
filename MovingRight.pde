class MovingRight extends InterruptableByAttack {
  
  MovingRight(){
    super(0.8, 8, "\\Resource\\Hero\\MovingRight\\", ".png");
  }
  
  boolean tickState(){
    getHero().move(20,0);
    if (!super.tickState()){
      if (isPressed(LEFT_C) ^ isPressed(RIGHT_C)){
        if (isPressed(LEFT_C)){
          getHero().setState(moveLeft());
          return true;
        }
        return false;
      } else {
        getHero().setState(idleRight());
      }
      return true;
    }
    return true;
  }
  
  void decideAttack() { getHero().setState(atkRight1()); }
  
  void decideDash() {
    getHero().dashRight();
    getHero().setState(atkLeft3());
  }
}