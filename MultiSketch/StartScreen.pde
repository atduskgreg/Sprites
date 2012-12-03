class StartScreen extends Sketch {

  StartScreen(PApplet p) {
    super(p);
  }

  void reinit() {
    println("returning to start screen");
  }

  void draw() {
    background(0);
    stroke(255);
    text("welcome! This is the start screen\nPress any key to start the game", 50,50);
  }
  
  void keyPressed(){
    switchToSketch = 1;
  }
}


