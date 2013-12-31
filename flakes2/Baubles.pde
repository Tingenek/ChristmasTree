class Baubles {
public ArrayList b = new ArrayList<Point>();

Baubles() {  
this.add(274,174);
this.add(351,205);
this.add(361,273);
this.add(257,302);
this.add(250,230);
} 

void add(int x,int y) {
  b.add(new Point(x,y));
}
  
void show () { 
// Loop through points
for (int i = 0; i < b.size(); i++)
{
  // Get the point at this index
  Point p = (Point) b.get(i);
  p.show(); 
}
}

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
  if (frameCount % (int) random(4,10) == 0) {
    w = (int) random(4,10);
    h = (int) random(4,10);
  }
  ellipse(x,y,w,h); 
  }  
  
}

}


