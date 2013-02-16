class Player {
  AnimatedSprite[] sprites;
  PVector pos;
  float health; // 0 -1
  int currentSpriteIndex;
  int fps = 15;

  Player() {
    sprites = new AnimatedSprite[2];
    sprites[0] = new AnimatedSprite(dataPath("lunge"), 0, 0, fps);
    sprites[0].actions.get(0).setRange(110);
    sprites[1] = new AnimatedSprite(dataPath("reverse-lunge"), 0, 0, fps);
    sprites[1].actions.get(0).setRange(0);
    health = 1.0;
  }

  void setCurrentSprite(int spriteIndex) {
    currentSpriteIndex = spriteIndex;

    for (int i = 0; i < sprites.length; i++) {
      sprites[i].stop();
    }

    getCurrentSprite().loop();
  }


  void setPos(PVector pos) {
    this.pos = pos;
  }

  AnimatedSprite getCurrentSprite() {
    return sprites[currentSpriteIndex];
  }

  void moveRight() {
    pos.x += 15;
  }

  void moveLeft() {
    pos.x -= 15;
  }

  float getHealth() {
    return health;
  }

  void update() {
    getCurrentSprite().update();
  }
  // HERE: 
  // * find somewhere to put the measurement to see if the 
  //   attack is within range. here? on the action?

  boolean isAttacking() {
    boolean result = false;
    for (SpriteAction action: getCurrentSprite().actions) {
      if (action.appliesTo(getCurrentSprite()) && action.actionType == SpriteAction.ATTACK) {
        result = true;
      }
    }
    return result;
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    getCurrentSprite().draw();
    pushStyle();
    fill(255, 0, 0); 
    noStroke();
    for (SpriteAction action: getCurrentSprite().actions) {
      if (action.appliesTo(getCurrentSprite())) {
        rect(action.range, 0, 10, 10);
      }
    }
    popStyle();
    popMatrix();
  }
}

