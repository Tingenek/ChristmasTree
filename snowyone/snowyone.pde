/*
//Christmas Tree with @cheerlights
//Tingenek@gmail.com
//Backgroud courtesy of http://www.zastavki.com/eng/Drawn_wallpapers/wallpaper-17315-29.htm
*/

PImage bg;
String[] s;
HashMap hm = new HashMap();
int time;
int wait = 60000;


void setup() {
  size(640, 480);
  bg = loadImage("snowtree.jpg");
  //lowe framerate so snow works
  frameRate(2);
  //colours
  hm.put("red", color(220,20,60));
  hm.put("green",color(0,128,0));
  hm.put("blue",color(72,118,255));
  hm.put("cyan",color(0,139,139));
  hm.put("white",color(255,255,255));
  hm.put("warmwhite",color(255,255,255));
  hm.put("purple",color(128,0,128));
  hm.put("magenta",color(238,0,23));
  hm.put("yellow",color(255,255,0));
  hm.put("orange",color(238,154,0));
  hm.put("pink",color(255,20,147));
  time = millis(); //store the current time
  smooth();
  //get current colour
  checktime(0);
}

void draw() {
  background(bg);
  checktime(wait);
   // Lights
  color c1 = color(220,20,60);

  if (s[0] !="") {
   c1 = (Integer) hm.get(s[0]);
  } 

  fill(c1 );
  drawBaubles();
  drawSnow();
} 

void drawBaubles() {
 //draw baubles down the tree 
 stroke(255); 
 ellipse(298,140,10, 10);
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

void checktime(int wait) {
  //Check is time is up. If so get new colour
  if(millis() - time >= wait) {
    try {
    s=loadStrings("http://api.thingspeak.com/channels/1417/field/1/last.txt");

    println(s[0]);
  } catch (Exception e) {
    println(e);
  }
  time = millis();
  }
}
