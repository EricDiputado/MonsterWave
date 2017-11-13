abstract class InterruptableByAttack extends HeroState {
  
  InterruptableByAttack(float frameSpeed, float numberOfImages, String directory, String extn) {
    super(frameSpeed, numberOfImages, directory, extn);
  }
  
  boolean tickState(){
    if (isPressed(DASH_C)){
      decideDash();
      return true;
    } else if (isPressed(ATTACK_C)){
      decideAttack();
      return true;
    }
    return false;
  }
  
  abstract void decideAttack();
  
  abstract void decideDash();
}