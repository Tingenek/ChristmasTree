class Baubles {
HashMap hm = new HashMap();
color c = color(#FF0000);
int[] x = { 298,270,348, 364,257,260,335,379,374,282,230};
int[] y = { 140,174,177, 223,219,273,236,267,315,323,324};
color[] stack = new color[11];

  
Baubles () {
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
  hm.put("black", color(#000000));
  //initialise colours
  for (int i = 0; i < stack.length; i++) {
    stack[i] = c;
  }
  
}  
  
void update() {
  //draw baubles down the tree
  stroke(255);
  fill(255);
  for (int i = 0; i < x.length; i++) {
    fill(stack[i]); 
    ellipse(x[i], y[i], 10, 10);
  }
  fill(255);
}

void change(String s) {
  try {
  c = (Integer) hm.get(s);
 /* stack[(int)random(stack.length)] = c;
  stack[(int)random(stack.length)] = c;  
 */
  arrayCopy(stack, 0, stack, 1, stack.length -1);
  stack[0] = c;
  } catch (Exception e) {
    println("Can't get colour " + s);
  }  
}

}
