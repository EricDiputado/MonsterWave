World world;

void setup() {
  frameRate(30);
  fullScreen();
  world = new World();
}

void draw() {
  world.draw();
  tick();
  if(getHero().health == 0){
    world.draw();
    noLoop();
    fill(0,50);
    rect(0,0,width,height);
    textSize(width/15);
    fill(255);
    text("Final Score: " +world.monstersKilled, width/5, height/3); 
  }
}

void tick(){
  world.tick();
}