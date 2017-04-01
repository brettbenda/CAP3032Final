class Button{
 float x;
 float y;
 float w;
 float h;
 color col;
 String txt;
 
 Button(float x, float y, float w, float h, color col, String txt){
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   this.col = col;
   this.txt = txt;
 }
 
 void show(){
   rectMode(CENTER);
   noStroke();
   fill(col);

   rect(x,y,w,h);
   
   textFont(createFont("Tahoma",1.5*h/2));
   textAlign(CENTER,CENTER);
   fill(0);
   text(txt,x,y-h/4);
 }
 
 boolean isOver(){
   if(mouseX > x - w/2 && mouseX < x + w/2){
    if(mouseY > y - h/2 && mouseY < y + h/2){
     return true; 
    }
   }
   return false;
 }
}