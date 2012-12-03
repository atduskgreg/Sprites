class EndScreen extends Sketch {

  EndScreen(PApplet p) {
    super(p);
  }

  void reinit() {
    println("returning to end screen");
  }

  void draw() {
    background(255,0,0);
    fill(0);
    text("BYE BYE! This is the end screen\nPress any key to play again", 50,50);
  }
  
  void keyPressed(){
    switchToSketch = 1;
  }
}


