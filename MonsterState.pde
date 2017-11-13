HashMap<String, ArrayList<PImage>> animations = new HashMap<String, ArrayList<PImage>>();


void increaseMonsterSize(){
  for (ArrayList<PImage> images : animations.values()){
    for (PImage image : images){
      image.resize((int)(image.width*(image.height+10)/image.height), (int)(image.height+10));
    }
  }
}

abstract class MonsterState {
  float currentIndexFloat = 0;
  final float FRAME_SPEED;
  final float NUM_OF_IMAGES;
  final String DIRECTORY_PREFIX, EXTENSION;
  final ArrayList<PImage> images;
  
  MonsterState(float frameSpeed, float numberOfImages, String directory, String extn) {
    FRAME_SPEED = frameSpeed;
    NUM_OF_IMAGES = numberOfImages;
    DIRECTORY_PREFIX = directory;
    EXTENSION = extn;
    images = getAnimations();
  }
  
  ArrayList<PImage> getAnimations(){
    if (animations.get(DIRECTORY_PREFIX) == null) {
      animations.put(DIRECTORY_PREFIX, new ArrayList<PImage>(){{
        for (int i = 0; i < NUM_OF_IMAGES; i++){
          add(loadImage(DIRECTORY_PREFIX+i+EXTENSION));
          float scale = (width/4.5)/get(i).width;
          get(i).resize((int)(get(i).width*scale), (int)(get(i).height*scale));
        }
      }});
    }
    return animations.get(DIRECTORY_PREFIX);
  }
  
  void draw(int x, int y) {
    PImage image = images.get(getFrame()); 
    image(image, x-image.width/2, y-image.height/2);
  }
  
  void drawDead(int x, int y, Monster m) {
    if (getFrame()+1 == NUM_OF_IMAGES){
      world.addDeadMonster(m);
    }
    PImage image = images.get(getFrame());
    tint(255,255-255*getFrame()/(NUM_OF_IMAGES-1));
    image(image, x-image.width/2, y-image.height/2);
    tint(255,255);
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
  
  private PImage getCurrentImage(){
    return images.get(getFrame());
  }
  
  void tick(Monster m) {
    tickAnimation();
    tickState(m);
  }
  
  abstract boolean tickState(Monster m);
  
  
  void reset(){
    currentIndexFloat = 0;
  }
  
  int getWidth(){
    return images.get((int)currentIndexFloat).width;
  }
}