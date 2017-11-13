abstract class HeroState {
  float currentIndexFloat = 0;
  final float FRAME_SPEED;
  final float NUM_OF_IMAGES;
  final String DIRECTORY_PREFIX, EXTENSION;
  final ArrayList<PImage> images;
  
  HeroState(float frameSpeed, float numberOfImages, String directory, String extn) {
    FRAME_SPEED = frameSpeed;
    NUM_OF_IMAGES = numberOfImages;
    DIRECTORY_PREFIX = directory;
    EXTENSION = extn;
    images = getAnimations();
  }
  
  int width(){
    return images.get(0).width;
  }
  
  ArrayList<PImage> getAnimations(){
    return new ArrayList<PImage>(){{
      for (int i = 0; i < NUM_OF_IMAGES; i++){
        add(loadImage(DIRECTORY_PREFIX+i+EXTENSION));
        float scale = (width/4.5)/get(i).width;
        get(i).resize((int)(get(i).width*scale), (int)(get(i).height*scale));
      }
    }};
  }
  
  void draw(int x, int y) {
    PImage image = images.get(getFrame()); 
    image(image, x-image.width/2, y-image.height/2);
  }

  private int getFrame() {
    return (int)currentIndexFloat;
  }
  
  private void tickAnimation() {
    currentIndexFloat += FRAME_SPEED;
    if (currentIndexFloat >= NUM_OF_IMAGES) {
      currentIndexFloat -= NUM_OF_IMAGES;
    }
  }
  
  void tick() {
    tickAnimation();
    tickState();
  }
  
  abstract boolean tickState();
  
  void reset(){
    currentIndexFloat = 0;
  }
}