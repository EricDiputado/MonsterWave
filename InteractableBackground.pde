class Weather {
  
  float worldX = 50, worldY = 50;
  
  void draw(float heroX, float heroY){
    ellipse(50-heroX, 50-heroY, 80, 80);
  }
}

class Floor {
  float worldX = 0, worldY = 0;
  
  String IMAGE_DIRECTORY = "\\Resource\\Floor\\Floor2.png";
  PImage image = loadImage(IMAGE_DIRECTORY);
  
  Floor(){
    float scale = width/image.width;
    image.resize((int)(image.width*scale), (int)(image.height*scale));
  }
  
  void draw(float heroX, float heroY){
    float screenX = worldX;
    while (screenX > 0) {screenX -= image.width; }
    while (screenX < width*-1) { screenX += image.width; }
    image(image,screenX,height-image.height);
    image(image,screenX+image.width,height-image.height);
    image(image,screenX+image.width*2,height-image.height);
  }
  
  void tick(){
    
  }
}