class Player{
  AnimatedSprite[] sprites;
  PVector pos;
  float health; // 0 -1
  int currentSpriteIndex;
  int fps = 15;
  
  Player(){
    sprites = new AnimatedSprite[1];
    sprites[0] = new AnimatedSprite(dataPath("lunge"), width/2, 10, fps);
  }
  
  void setCurrentSprite(int spriteIndex){
    currentSpriteIndex = spriteIndex;

    for(int i = 0; i < sprites.length; i++){
      sprites[i].stop();
    }
    
    getCurrentSprite().loop();
  }
  
  
  void setPos(PVector pos){
    this.pos = pos;
  }
  
  AnimatedSprite getCurrentSprite(){
    return sprites[currentSpriteIndex];
  }
  
  void moveRight(){
    pos.x += 15;
  }
  
  void moveLeft(){
    pos.x -= 15;
  }
  
  float getHealth(){
    return health;
  }
  
  void update(){
    getCurrentSprite().update();
  }
  
  void draw(){
    pushMatrix();
    translate(pos.x, pos.y);
    getCurrentSprite().draw();
     pushStyle();
    fill(255,0,0); noStroke();
    for(SpriteAction action: getCurrentSprite().actions){
      if(action.appliesTo(getCurrentSprite())){
        rect(0,0,10,10);
      }
    }
    popStyle();
    popMatrix();
  }
  
}
