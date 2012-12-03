AnimatedSprite animation;
int fps = 15;

void setup() {
  size(800, 800);
  frameRate(30);
  
  // Load the image sequence
  PImage[] seq = new PImage[4];
  java.io.File folder = new java.io.File(dataPath("animation"));
  String[] filenames = folder.list();
  
  for (int i = 0; i < filenames.length; i++) {
    seq[i] = loadImage(dataPath("animation/" + filenames[i]));
  }
  
  animation = new AnimatedSprite(seq, width/2, 10, fps);
}

void draw() {
  background(255);
  fill(0);
  text(fps + " FPS\n(Press +/- to change FPS\n'p' to toggle play/stop)", 20, 20);
  animation.update();
  animation.draw();
}

void keyPressed(){
  if(key == 'p'){
    if(animation.isPlaying()){
      animation.stop();

    } else {
            animation.loop();

    }
  }
  if(key == '='){
    fps++;
    animation.setFPS(fps);
  } if(key == '-'){
    fps--;
    if(fps < 0) fps = 0;
    animation.setFPS(fps);
  }
}

