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
    pushMatrix();
    scale(5);
    text("Welcome to\nSPRITE!\n", 10,50);
    scale(0.2);
    text("(press any key to play)", 10*5, 400);
    popMatrix();
  }
  
  void keyPressed(){
    switchToSketch = 1;
  }
}


