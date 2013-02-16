////////////////////////////////////////
// HANDLE SKETCHES

void initSketches() {
  sketch=new Sketch[4];
    
  addSketch(new StartScreen(this));
    addSketch(new GameLevel(this));

  addSketch(new EndScreen(this));
  
  switchSketch(0);  
  println(numSketch+" sketches added.");
}

void addSketch(Sketch theSketch) {
  sketch[numSketch]=theSketch;
  numSketch++;
}

void switchSketch(int sketchID) {
  if(sketch[sketchID]==null) return;
  currSketch=sketch[sketchID];
  currSketch.reinit();
}

////////////////////// EVENT HANDLERS

void keyPressed() {
  println(key+" "+(key==CODED)+" "+keyCode);
  
  // often a CTRL command gets sent as a CTRL key
  // and then a regular key. we'll access the keyEvent
  // itself to check if CTRL is pressed.
  if(keyEvent.isControlDown()) {
    //if(keyCode==KeyEvent.VK_1) switchToSketch=0;
    //if(keyCode==KeyEvent.VK_2) switchToSketch=1;
    //if(keyCode==KeyEvent.VK_3) switchToSketch=2;
    //if(keyCode==KeyEvent.VK_4) switchToSketch=3;
    //if(keyCode==KeyEvent.VK_5) switchToSketch=4;
    
    
  }
  
  // give sketches a chance to respond to events
  if(currSketch!=null) currSketch.keyPressed();
}

void mousePressed() {
  if(currSketch!=null) currSketch.mousePressed();
}

////////////////////// EVERYTHING ELSE

void drawDebug() {
  textAlign(CORNER);
  rectMode(CORNER);

  fill(220, 200);
  noStroke();
  
  String s="Current: "+currSketch.className;
  float w=textWidth(s);
  rect(width-(w+10),0, width-(w+10),26);

  fill(33);
  text(s,width-(w+10)+6,18);
}
