// Improvements by Greg Borenstein (November 2012):
// - Set speed based on desired FPS
// - playOnce(), loop(), stop functions
// - load images from a directory
// - rename to AnimatedSprite to get around weird windows problem.

// Originally by:
// Daniel Shiffman
// Hanukkah 2011
// 8 nights of Processing examples
// http://www.shiffman.net

class FrameWindow {
  int start;
  int size;

  FrameWindow( int start, int size ) {
    this.start = start;
    this.size = size;
  }

  int getEnd() {
    return start + size;
  }
  
  int getStart(){
    return start;
  }
  
  int getSize(){
    return size;
  }

  float getLoopedFrame(float unLoopedFrame) {
    if (unLoopedFrame < start) {
      float offset = start - unLoopedFrame;
      return getEnd() - offset;
    }

    else if (unLoopedFrame > getEnd()) {
      float offset = unLoopedFrame - getEnd();
      return start + offset;
    }

    else {
      return unLoopedFrame;
    }
  }
}

class AnimatedSprite {
  float x;  // location for Animation
  float y;  // location for Animation

  float height;
  float width;

  // The index into the array is a float!
  // This allows us to vary the speed of the animation
  // It will have to be converted to an int before the actual image is displayed
  float index = 0; 

  // Speed, this will control both the animations movement
  // as well as how fast it cycles through the images
  float speed;
  int fps;
  // The array of images
  PImage[] images;

  boolean playing = false;
  boolean playOnce = true;
  
  FrameWindow window;

  AnimatedSprite(String pathToImages, float x_, float y_, int fps) {
    loadImagesFromPath(pathToImages);
    x = x_;
    y = y_;
    this.width = images[0].width;
    this.height = images[0].height;
    this.fps = fps;
    index = 0;
    setFPS(fps);
    
    window = new FrameWindow(0, images.length);
  }

  AnimatedSprite(PImage[] images_, float x_, float y_, int fps) {
    images = images_;
    x = x_;
    y = y_;

    // Starting at the beginning
    index = 0;
    setFPS(fps);
    window = new FrameWindow(0, images.length-1);
  }

  int getNumFrames() {
    return images.length;
  }


  void loadImagesFromPath(String path) {
    java.io.FilenameFilter DSStoreFileFilter = new DSStoreFileFilter();
    java.io.File folder = new java.io.File(dataPath(path));
    String[] filenames = folder.list(DSStoreFileFilter);
    images = new PImage[filenames.length];

    for (int i = 0; i < filenames.length; i++) {
      images[i] = loadImage(dataPath(path + "/" + filenames[i]));
    }
  }

  void setFPS(int fps) {
    this.fps = fps;
  }

  void setSpeed(int fps) {
    speed = fps/(float)frameRate;
  }

  void playOnce() {
    index = 0;
    playOnce = true;
    playing = true;
  }

  void loop() {
    playing = true;
    playOnce = false;
  }

  void jumpTo(int i) {
    index = i;
  }

  void scrub(int i) {
    index += i;
    if (index >= images.length) {
      index = 0;
    }
  }

  void stop() {
    playing = false;
    playOnce = false;
  }

  boolean isPlaying() {
    return playing;
  }

  void displayFrames() {

    for (int i = 0; i < images.length; i++) {
      image(images[i], i*this.width, 0);
    }

    pushStyle();
    stroke(255, 0, 0); 
    noFill();
    rect(int(index)*this.width, 0, this.width, this.height);
    stroke(0,255,0);
    strokeWeight(3);
    println("start: " + window.getStart() + " size: " + window.getSize());
    line(int(window.getStart())*this.width, -10, int(window.getStart() + window.getSize()) * this.width, -10);
    popStyle();
  }

  void draw() {
    // We must convert the float index to an int first!
    int imageIndex = int(index);
    image(images[imageIndex], x, y);
  }

  void update() {
    setSpeed(fps);

    if (playing) {
      // Move the index forward in the animation sequence
      index += speed;
      // If we are at the end, go back to the beginning
      
      print("pre-loop: " + index);
      index = window.getLoopedFrame(index);
      println(" post-loop: " + index);

      if (index >= images.length) {
        if (playOnce) {
          playing = false;
          index = images.length-1;
        } 
        else {

          // We could just say index = 0
          // but this is slightly more accurate
          index -= images.length;
        }
      }
    }
  }
}

