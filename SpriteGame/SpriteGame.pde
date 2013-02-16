import java.io.*;

// MultiSketch system
// Based on work by Marius Watz!
// A state machine where you can switch between mutliple
// sub-classes of Sketch that act like full-on Processing sketches.
// check out the individual Sketch sub-classes (StartScreen, GameLevel, and EndScreen)
// for details and examples.
// To add a new Sketch, create your own sub-class of Sketch, and then
// initialize it in the right place inside the Misc file (follow the pattern there).
// to switch between sketches, set the switchToSketch variable at any time.

Sketch sketch[], currSketch;
int numSketch, switchToSketch=-1;

void setup(){
  size(640,480);
  initSketches();
}

void draw(){
if (currSketch!=null) { // calling current sketch
    pushMatrix();
    currSketch.draw();
    popMatrix();
  }

  if (switchToSketch>-1) {
    switchSketch(switchToSketch);
    switchToSketch=-1;
  }
}
