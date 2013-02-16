class GameLevel extends Sketch {
  AnimatedSprite sprite;
  int fps = 15;

  GameLevel(PApplet p) {
    super(p);
    sprite = new AnimatedSprite(dataPath("animation"), width/2, 10, fps);
    sprite.loop();
  }

  void reinit() {
    println("returning to the game");
  }

  void draw() {
    background(255);
    fill(125);
    text("Press 'q' quit\n'p' - to start/stop\n'+/-' - to set FPS\n" + fps + " FPS", 25, 25);

    pushMatrix();
    sprite.update();
    sprite.draw();
    popMatrix();

    pushMatrix();
    translate(10, height - sprite.height - 10);
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
    if (key == '=') {
      fps++;
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
    
    if (key == '-') {
      fps--;
      if (fps < 0) fps = 0;
      sprite.setFPS(fps);
    }
    if(key == 'q'){
      switchToSketch = 2;
    }
  }
}

