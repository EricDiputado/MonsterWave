abstract class Attack extends Uninterruptable {
  int speed = 14;
  
  Attack(float frameSpeed, float numberOfImages, String directory, String extn) {
    super(frameSpeed, numberOfImages, directory, extn);
  }
  
  boolean tickState(){
    if (!super.tickState()){
      if (!isPressed(ATTACK_C)){
        if (!decideLeftRightMoving()){
          decideIdle();
        }
        return true;
      }
      decideNextAttack();
    }
    return false;
  }
  
  abstract void decideIdle();
  
  abstract void decideNextAttack();
}