
PImage bg;
Baubles baubles;
SnowFlakes snowflakes;

void setup() {
  size(640,480);
  bg = loadImage("snowtree.jpg");
  frameRate(30);
  noStroke();
  smooth(); 
  baubles = new Baubles();
  snowflakes = new SnowFlakes(300);
}

void draw() {
  background(bg);
  baubles.show();
}

void mousePressed() {
 baubles.add(mouseX,mouseY);
 println(mouseX+","+mouseY);
}

