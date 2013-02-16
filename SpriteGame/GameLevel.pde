class GameLevel extends Sketch {
  Player player1, player2;
  int fps = 15;

  GameLevel(PApplet p) {
    super(p);
    player1 = new Player();
    player1.setPos(new PVector(10, height - 150));
    player1.setCurrentSprite(0);
    
    player2 = new Player();
    player2.setPos(new PVector(300, height - 150));
    player2.setCurrentSprite(1);
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
    
    player2.update();
    player2.draw();
    
    pushMatrix();
    translate(10, height - 50);
    pushMatrix();
    scale(0.2,0.2);
    player1.getCurrentSprite().displayFrames();
    popMatrix();
    translate(width/2, 0);
    scale(0.2,0.2);
    player2.getCurrentSprite().displayFrames();
    popMatrix();
    
    float p1HealthColor = map(player1.getHealth(), 0, 1, 255, 0);
    fill(color(p1HealthColor, 255-p1HealthColor, 0));
    text("P1 HEALTH: " + player1.getHealth(), 10, height - 10);
    
    float p2HealthColor = map(player2.getHealth(), 0, 1, 255, 0);
    fill(color(p2HealthColor, 255-p2HealthColor, 0));
    text("P2 HEALTH: " + player1.getHealth(), width/2, height - 10);
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
      player2.moveRight();
    }
    if(keyCode == LEFT){
      player2.moveLeft();
    }
    
    if(key == 'd'){
      player1.moveRight();
    }
    if(key == 'a'){
      player1.moveLeft();
    }
  }
}

