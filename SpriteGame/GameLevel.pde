class GameLevel extends Sketch {
  AnimatedSprite sprite;
  int fps = 15;
  PVector pos;

  GameLevel(PApplet p) {
    super(p);
    sprite = new AnimatedSprite(dataPath("lunge"), width/2, 10, fps);
    sprite.loop();
    pos = new PVector(10, height - sprite.height - 100);
  }

  void reinit() {
    println("returning to the game");
  }

  void draw() {
    background(255);
    fill(125);
    text("Press 'q' quit\n'[/]' to shorten/length sequence\n'{/}' to change sequence start\n'+/- to change FPS'\nLEFT/RIGHT to move\n" + fps + " FPS", 25, 25);

    pushMatrix();
    translate(pos.x, pos.y);
    sprite.update();
    sprite.draw();
    
    pushStyle();
    fill(255,0,0); noStroke();
    for(SpriteAction action: sprite.actions){
      if(action.appliesTo(sprite)){
        rect(sprite.x,sprite.y,10,10);
      }
    }
    popStyle();
    
    popMatrix();

    pushMatrix();
    translate(10, height - sprite.height - 10);
    scale(0.4,0.4);
    sprite.displayFrames();
    popMatrix();
  }

  void keyPressed() {
    if (key == 'p') {
      if (sprite.isPlaying()) {
        sprite.stop();
      } 
      else {
        sprite.loop();
      }
    }
    if (key == '=' || key == '+') {
      fps++;
      sprite.setFPS(fps);
    } 
    
     if (key == '-' || key == '_') {
      fps--;
      if (fps < 0) fps = 0;
      sprite.setFPS(fps);
    }
    
    if(key == '}'){
      sprite.window.start++;
    }
    
    if(key == '{'){
      sprite.window.start--;
    }
    
    if(key == ']'){
      sprite.window.size++;
    }
    
    if(key == '['){
      sprite.window.size--;
    }
    
   
    if(key == 'q'){
      switchToSketch = 2;
    }
    
    if(keyCode == RIGHT){
      pos.x += 15;
    }
    if(keyCode == LEFT){
      pos.x -= 15;
    }
  }
}

