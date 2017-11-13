class Background {
  final String DIRECTORY_PREFIX = "\\Resource\\Background\\", EXTENSION = ".PNG";
  
  ArrayList<PImage> images = new ArrayList<PImage>(){{
    PImage image = loadImage(DIRECTORY_PREFIX+1+EXTENSION);
    add(image);
  }};
  
  Background(){
    PImage image = images.get(0);
    float scale = max(width/(float)image.width, height/(float)image.height);
    image.resize((int)(image.width*scale), (int)(image.height*scale));
  }
  
  
  void draw(){
    background(0);
    PImage image = images.get(0);
    image(image,0,height*9/10-height);
  }
  
  void tick() {
    
  }
  
  int depth(){
    return 50;
  }
}