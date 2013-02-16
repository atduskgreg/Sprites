class GameLevel extends Sketch {
  Player player1, player2;
  int fps = 15;

  GameLevel(PApplet p) {
    super(p);
    player1 = new Player();
    player1.setPos(new PVector(10, height - 150));
    player1.setCurrentSprite(0);
  }

  void reinit() {
    println("returning to the game");
  }

  void draw() {
    background(255);
    fill(125);
    text("Press 'q' quit\n'[/]' to shorten/length sequence\n'{/}' to change sequence start\n'+/- to change FPS'\nLEFT/RIGHT to move\n" + fps + " FPS", 25, 25);

    
    player1.update();
    player1.draw();
    
    pushMatrix();
    translate(10, height - 50);
    scale(0.4,0.4);
    player1.getCurrentSprite().displayFrames();
    popMatrix();
  }

  void keyPressed() {
    if (key == 'p') {
      if (player1.getCurrentSprite().isPlaying()) {
        player1.getCurrentSprite().stop();
      } 
      else {
        player1.getCurrentSprite().loop();
      }
    }
    if (key == '=' || key == '+') {
      fps++;
      player1.getCurrentSprite().setFPS(fps);
    } 
    
     if (key == '-' || key == '_') {
      fps--;
      if (fps < 0) fps = 0;
      player1.getCurrentSprite().setFPS(fps);
    }
    
    if(key == '}'){
      player1.getCurrentSprite().window.start++;
    }
    
    if(key == '{'){
      player1.getCurrentSprite().window.start--;
    }
    
    if(key == ']'){
      player1.getCurrentSprite().window.size++;
    }
    
    if(key == '['){
      player1.getCurrentSprite().window.size--;
    }
    
   
    if(key == 'q'){
      switchToSketch = 2;
    }
    
    if(keyCode == RIGHT){
      player1.moveRight();
    }
    if(keyCode == LEFT){
      player1.moveLeft();
    }
  }
}

