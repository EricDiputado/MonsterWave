class MovingLeft extends InterruptableByAttack {
  
  MovingLeft(){
    super(0.8, 8, "\\Resource\\Hero\\MovingLeft\\", ".png");
  }
  
  boolean tickState(){
    getHero().move(-20,0);
    if (!super.tickState()){
      if (isPressed(LEFT_C) ^ isPressed(RIGHT_C)){
        if (isPressed(RIGHT_C)){
          getHero().setState(moveRight());
          return true;
        }
        return false;
      } else {
         getHero().setState(idleLeft());
      }
      return true;
    }
    return true;
  }

  void decideAttack() { getHero().setState(atkLeft1()); }
  
  void decideDash() {
    getHero().dashLeft();
    getHero().setState(atkRight3());
  }
}