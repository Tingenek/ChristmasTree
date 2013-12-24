/*
// Christmas Tree with @cheerlights
// Version 2. Much Better Snow! & Stuff in Classes.
// Tingenek@gmail.com
// Backgroud courtesy of http://www.zastavki.com/eng/Drawn_wallpapers/wallpaper-17315-29.htm
 */

//BackGround
PImage bg;
String imageName = "snowtree.jpg"; 

//Snowflakes
SnowFlake[] sn;
int quantity = 300;
//Baubles
Baubles baubles;
String currentColour;
//Timer
Elapsed timer;

void setup() {
  size(640,480);
  bg = loadImage(imageName);
  sn = new SnowFlake[quantity];
  baubles = new Baubles();
  timer= new Elapsed(60);
  for(int i = 0; i < quantity; i++) {
   sn[i] = new SnowFlake();
  }
  frameRate(30);
  noStroke();
  smooth(); 
}

void draw() {
  background(bg);
  //Check timer has fired. If so get new colour
  if (timer.checktime()) {
    currentColour=baubles.getnew();
    baubles.change(currentColour);
  }   
  //baubles.change("blue");
  baubles.update();
  
  for(int i = 0; i < quantity; i++) {
  sn[i].update();
  }
  
}


