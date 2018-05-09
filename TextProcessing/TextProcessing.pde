ArrayList<Circles> circle;
color testColor=color(0,0,0);
int maxRadius=100;
Image img;
Integer[] pxl;
public void settings() {
  size(957,594);
}

public void setup() { 
  img= new Image("Text.jpg");
  pxl= img.getPixelArray().toArray(new Integer[img.getPixelArray().size()]);
  background(51, 51, 51);
  circle=new ArrayList<Circles>();
  //noStroke();
  stroke(255); 
  //frameRate(10);
}

public void draw() {
  if (circle.size()<1000) {
    createCircle();
    background(51, 51, 51);
    for (Circles c : circle) {
      if (!c.isGrown()) {
        updateCircle(c);
      }
      drawCircle(c); //<>//
    }
  }
}

public void drawCircle(Circles c) {
  fill(c.getColor());
  ellipse(c.getPV().x, c.getPV().y, c.getRadius()*2, c.getRadius()*2);
}

public void updateCircle(Circles c) {
  boolean testBounds=makeCircle(c);
  if (testBounds && c.getRadius()<=maxRadius) {
    c.incRadius();
  } else {
    c.setGrown(true);
  }
}

public void createCircle() {
  Circles tmp = new Circles(2);
  int nX=floor(random(img.getX()));
  int nY=floor(random(img.getY()));
  tmp.setPV(nX, nY);
  if(makeCircle(tmp)){ //<>//
    circle.add(tmp);
  }
}

public boolean makeCircle(Circles tmp) {
  boolean create=true;
  Circles chk = new Circles();  
  if(goodEdges(tmp.getPV(), tmp.getRadius())){
    for (int i=0; i<circle.size(); i++) {
      chk=circle.get(i);
      if (!chk.equals(tmp)) {
        PVector dist = PVector.sub(chk.getPV(), tmp.getPV());
        if (dist.mag()<=chk.getRadius()+tmp.getRadius()+1 ) {
          create=false;
          break;
        }
      }
    }
  }
  else{
    create=false;
  }
 return create;
}

private boolean goodEdges(PVector tmp, int r) {
  boolean create=true;
  if (tmp.x-r-1<0 || tmp.x+r+1>width || tmp.y+r+1>height || tmp.y-r-1<0) {
    create=false;
  }
  if(create){
    for (int p : pxl) {
      if ((int)(tmp.x+tmp.y*width)==p || (int)(tmp.x+r+tmp.y*width)==p || (int)(tmp.x-r+tmp.y*width)==p ||(int)(tmp.x+(tmp.y+r)*width)==p || (int)(tmp.x+(tmp.y-r)*width)==p) {
        create=false;
        break;
      }
    }
  }
  return create;
}
