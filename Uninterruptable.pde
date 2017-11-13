abstract class Uninterruptable extends HeroState {
  
  Uninterruptable(float frameSpeed, float numberOfImages, String directory, String extn) {
    super(frameSpeed, numberOfImages, directory, extn);
  }
  
  private void tickAnimation() {
    currentIndexFloat += FRAME_SPEED;
    if (currentIndexFloat >= NUM_OF_IMAGES) {
      currentIndexFloat = NUM_OF_IMAGES-1;
    }
  }
  
  boolean tickState(){
    return !isFinished();
  }
  
  boolean isFinished() {
    return currentIndexFloat >= NUM_OF_IMAGES-1;
  }
}

class HDamageLeft extends Uninterruptable {
  
  HDamageLeft() { super(0.1, 2, "\\Resource\\Hero\\DamageLeft\\",".png"); }
  
  boolean tickState(){
    if (!super.tickState()){
      getHero().setState(idleRight());
      return true;
    }
    getHero().move(-20,0);
    return false;
  }
}

class HDamageRight extends Uninterruptable {
  
  HDamageRight() { super(0.1, 2, "\\Resource\\Hero\\DamageRight\\",".png"); }
  
  boolean tickState(){
    if (!super.tickState()){
      getHero().setState(idleLeft());
      return true;
    }
    getHero().move(20,0);
    return false;
  }
}