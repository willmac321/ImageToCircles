public  class Circles{
  private int radius;
  private PVector pv;
  private int x;
  private int y;
  private int z;
  private boolean mature;
  
  public Circles(){
    radius=0; 
    pv= new PVector();
    mature=false;
  }
  
  public Circles(int r){
    this();
    radius=r;
  }
  
  public void incRadius(){
    radius++;
  }
  
  public int getRadius(){
   return radius/2; 
  }
  
  public PVector getPV(){
   return pv; 
  }
  
  public void setPV(int x, int y){
   pv.x=x;
   pv.y=y;
   this.x=floor(map(x,0,width,0,255));
   this.y=floor(map(y,0,height,0,255));
   this.z=floor(map(x+y,0,width+height,0,255));
  }
  
  public boolean isGrown(){
    return mature;
  }
  public void setGrown(boolean m){
    mature=m;
  }
  public color getColor(){
    return color(x,y,z);
  }
}
