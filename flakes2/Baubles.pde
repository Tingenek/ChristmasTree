class Baubles {
private ArrayList b = new ArrayList<Point>();
private HashMap hm = new HashMap();
private color c = color(220, 20, 60); //red

Baubles() {  
// Colour map
hm.put("red", color(#FF0000));
hm.put("green", color(#008000));
hm.put("blue", color(#0000FF));
hm.put("cyan", color(#00FFFF));
hm.put("white", color(#FFFFFF));
hm.put("warmwhite", color(#FDF5E6));
hm.put("purple", color(#800080));
hm.put("magenta", color(#FF00FF));
hm.put("yellow", color(#FFFF00));
hm.put("orange", color(#FFA500));
hm.put("pink", color(#ffc0cb));  

// Initial baubles  
this.add(274,174);
this.add(351,205);
this.add(361,273);
this.add(257,302);
this.add(250,230);
this.add(368,321);
this.add(324,129);
this.add(238,194);
this.add(413,264);
} 

//Add a new point
void add(int x,int y) {
  b.add(new Point(x,y));
}

//Change colour
void change(String s) {
  try {
  c = (Integer) hm.get(s);
  } catch (Exception e) {
    println("Can't get colour " + s);
  }  
}

// Loop through points and show
// Note: Have to cast back to Point  
void show () { 
  stroke(255);    
  fill(c); 
for (int i = 0; i < b.size(); i++)
{
  Point p = (Point) b.get(i);
  p.show(); 
}
stroke(255);
fill(255);
}

//Inner Point Class
//One Bauble
class Point {
  int x;
  int y;
  Point(int mx,int my) {
    x=mx;
    y=my;
  } 
    
void show() {
  
  int w = 10;
  int h = 10;
//  if (frameCount % (int) random(7,13) == 0) {
//    w = (int) random(8,10);
//    h = (int) random(8,10);
//  }
// if (frameCount % 20  == 0) {
//  stroke(192);
// } 
  ellipse(x,y,w,h); 
    if (frameCount % (int) random(10,70) == 0) {
      fill(255);
       ellipse(random(x-4,x+4),random(y-4,y+4),2,2); 
       fill(c);
     } 
  
  
  }  
  
}

}


