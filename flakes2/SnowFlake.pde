class SnowFlakes { 
private Flake[] sn;
private int quantity;

SnowFlakes () {
    this(300);
  }

SnowFlakes (int q) {
  quantity = q;
  sn = new Flake[quantity];
  for(int i = 0; i < quantity; i++) {
   sn[i] = new Flake();
  }

}

void fall() {
  for(int i = 0; i < quantity; i++) {
  sn[i].update();
  }
}



//inner class 
//Individual snowflake
class Flake {
float xPosition; 
float yPosition;
float fall;
int flakeSize;
int direction;

int minFlakeSize = 1;
int maxFlakeSize = 5;

Flake() {
    flakeSize = round(random(minFlakeSize, maxFlakeSize));
    xPosition = random(0, width);
    yPosition = random(0, height);
    direction = round(random(0, 1));
    fall = random(0.7, 1);
}

void update() {
    ellipse(xPosition, yPosition, flakeSize, flakeSize);

    //make them drift at slightly different speeds depending on size  
    if(direction == 0) {
      xPosition += flakeSize * 0.1;
    } else {
      xPosition -= flakeSize * 0.1;
    }
     
    // fall 
    yPosition += (flakeSize * fall) + direction; 
    
    //reset if off the screen
    if(xPosition > width + flakeSize || xPosition < -flakeSize || yPosition > height + flakeSize) {
      xPosition = random(0, width);
      yPosition = -flakeSize;
    }
    
  }  
  
}
}
