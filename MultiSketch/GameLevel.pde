class GameLevel extends Sketch {

  GameLevel(PApplet p) {
    super(p);
  }

  void reinit() {
    println("returning to the game");
  }

  void draw() {
    background(0);
    fill(255);
    noStroke();
    rect(mouseX, 300, 100, 10);
    fill(125);
    text("Press any key to quit", 25, 25);
    
  }
  
  void keyPressed(){
    switchToSketch = 2;
  }
}


