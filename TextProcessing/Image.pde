public class Image{
  private PImage img;
  private ArrayList<Integer> pxl;
  
  public Image(String fileName){
    pxl=new ArrayList<Integer>();
    img=loadImage(fileName); 
    img.resize(width,height);

    createPixelArray();
}
  public void drawImage(){
   image(img,0,0); 
  }
  private void createPixelArray(){
    img.loadPixels();
      for (int i =0;i<img.width*img.height;i++){
        if(img.pixels[i]!=testColor){
          pxl.add(i);
        }
      }
    img.updatePixels();   
  }
  
  public ArrayList<Integer> getPixelArray(){
   return pxl; 
  }
  
  public int getX(){
    return img.width;
  }
  public int getY(){
    return img.height;
  }
}
