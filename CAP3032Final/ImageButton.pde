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
   //shows images
   imageMode(CENTER);
   image(image,x,y);
 }
 
 boolean isOver(){
   //checks if the mouse is over the button in reference
   if(mouseX > x - image.width/2 && mouseX < x + image.width/2){
    if(mouseY > y - image.height/2 && mouseY < y + image.height/2){
     return true; 
    }
   }
   return false;
 }
}