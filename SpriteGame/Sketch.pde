// this will be our generic class describing a skeleton
// of functionality that a sketch will have. when we write
// actual sketches we will *overload* the functions of the
// Sketch class. 
//
// all functions that are defined in Sketch will also exist 
// in subclasses of Sketch and can be safely called even if
// we don't know exactly what class a given object actually is.
//
// because classes defined in Processing are local classes 
// defined inside the PApplet master sketch we can access
// all global variables and methods. this is not really good
// Java, but it's convenient.

class Sketch {
  PApplet p;
  String className;
  
  // simple constructor, taking a PApplet reference as a
  // reference so that we can address the parent object.
  public Sketch(PApplet p) {
    this.p=p;
    
    // get the name of this class and print it
    className=this.getClass().getSimpleName();
    println("\n------------");    
    println(className+" constructor. (In Sketch)");    
  }
  
  // reinit() should take care of any initialization required
  // for a sketch to run. it might be called several times if
  // the user switches back and forth between sketches.
  public void reinit() {
    println(className+".reinit()");
  }
    
  // draw() is called every frame so that the sketch can draw
  // itself. it should also take care of any frame-by-frame 
  // updating the sketch might need
  public void draw() {
    background(0);
    textAlign(CENTER);
    translate(width/2,height/2);
    
    fill(255);
    text("Nothing to see here.",0,0);
  }
  
  
  ///////////////////////////////////////////////////////////
  // Sketch defines standard event handler functions so that
  // we can tell it about events it might want to respond to.
  
  void keyPressed() {
  }
  
  void mousePressed() {
  }
  
  void mouseDragged() {
  }
  
}
