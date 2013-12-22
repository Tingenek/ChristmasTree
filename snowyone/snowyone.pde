/*
//Christmas Tree with @cheerlights
//Tingenek@gmail.com
//Backgroud courtesy of http://www.zastavki.com/eng/Drawn_wallpapers/wallpaper-17315-29.htm
*/

PImage bg;


void setup() {
  size(640, 480);
  bg = loadImage("snowtree.jpg");
  smooth();
  //lowe framerate so snow works
  frameRate(2);
  color c1 = color(220,20,60);
  fill(c1 );
}

void draw() {
  background(bg);
  drawBaubles();
  drawSnow();
} 

void drawBaubles() {
 //draw baubles down the tree 
 noStroke();
 ellipse(298,140,random(8,10), 10);
 ellipse(270,174,10, 10);
 ellipse(348,177,10, 10);
 ellipse(364,223,10, 10);
 ellipse(257,219,10, 10);
 ellipse(260,273,10, 10);
 ellipse(335,236,10, 10);
 ellipse(379,267,10, 10);
 ellipse(374,315,10, 10);
 ellipse(282,323,10, 10);
 ellipse(230,324,10, 10);
}

void drawSnow() {
  // draw the snow
  stroke(255, 255, 255);
  strokeWeight(3); 
  for (int i = 0; i < 10; i = i+1)
  {
    for (int j=0; j<10; j=j+1)
    {
      point(random(i*60, (i+1)*60), random(height));
    }
  }
   strokeWeight(1);
}

