class ImageButton{
 float x;
 float y;
 PImage image;
 
 ImageButton(float x, float y, PImage image){
   this.x = x;
   this.y = y;
   this.image = image;
 }
 
 void show(){
   imageMode(CENTER);
   image(image,x,y);
 }
 
 boolean isOver(){
   if(mouseX > x - image.width/2 && mouseX < x + image.width/2){
    if(mouseY > y - image.height/2 && mouseY < y + image.height/2){
     return true; 
    }
   }
   return false;
 }
}