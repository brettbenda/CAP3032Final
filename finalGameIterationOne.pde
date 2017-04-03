rectangle[][] easyBoard = new rectangle[5][5];

void setup(){
 size(1000,1000);
 createEasyBoard();
  
}
void draw(){
  background(0,200,0);
  drawEasyBoard();

  
  
  
  
}
void drawEasyBoard(){
  rectangle r;
  for(int i = 0; i < 5; i++){
     for(int j = 0; j<5;j++){
      r = easyBoard[i][j];
      fill(r.getColor());
      rect(r.getXPos(),r.getYPos(),r.getWidth(),r.getHeight());
     }
  }
  
  
}
void createEasyBoard(){
  for(int i = 0; i < 5; i++){
     for(int j = 0; j<5;j++){
       rectangle r = new rectangle();
       if(j==1){
        r.setColor(color(100,0,0)); 
       }
       else if(j==2){
         r.setColor(color(0,0,100));
       }
       else if(j==3){
        r.setColor(color(100,50,100)); 
       }
       else if(j==4){
        r.setColor(color(20,150,90)); 
       }
       else if(j==0){
        r.setColor(color(200,200,200)); 
       }
       if(i==2){
        r.setColor(color(10,90,200)); 
       }
       r.setXPos(120*(j+2)-50);
       r.setYPos(120+(120*(i+1)));
       r.setHeight(100);
       r.setWidth(100);
       easyBoard[i][j] = r;
     }
  }
}

class rectangle{
  color c;
  float xPos, yPos, hgt, wdt;  
  
  rectangle(){
    
     c = color(255,255,255);
     xPos = 0;
     yPos = 0;
     hgt = 0;
     wdt = 0;
    
  }
  
  void setColor(color newColor){
    c = newColor;
  }
  color getColor(){
   return this.c; 
  }
  void setXPos(float x){
   xPos = x; 
  }
  float getXPos(){
   return this.xPos; 
  }
  void setYPos(float y){
   yPos = y; 
  }
  float getYPos(){
   return this.yPos; 
  }
  void setHeight(float newHeight){
    hgt = newHeight;
  }
  float getHeight(){
   return this.hgt; 
  }
  void setWidth(float newWidth){
   wdt = newWidth; 
  }
  float getWidth(){
   return this.wdt; 
  }
  
  
}

void shiftUp(){

  rectangle[] tempRectangleArray = new rectangle[5];
  rectangle r = new rectangle();
  int iter = 0;
  while(iter<=120){
    for(int i = 0; i < 5; i++){
     for(int j = 0; j< 5; j++){
       r = easyBoard[i][j];
     
       r.setYPos((r.getYPos())-1);
       
       if(iter >= 60){
        if(i==0){
         r.setYPos(720); 
        }
       }
       
     }
    }
    iter+=1;
  }
  
  tempRectangleArray[0] = easyBoard[0][0];
  tempRectangleArray[1] = easyBoard[0][1];
  tempRectangleArray[2] = easyBoard[0][2];
  tempRectangleArray[3] = easyBoard[0][3];
  tempRectangleArray[4] = easyBoard[0][4];
  
  for(int i = 0; i<=3; i++){
    for(int j = 0; j<=4; j++){
      
      easyBoard[i][j] = easyBoard[i+1][j];
      
    }
   
 }
 
 for(int i = 0; i<5;i++){
   easyBoard[4][i] = tempRectangleArray[i]; 
  }
  
}

void shiftDown(){
  rectangle[] tempRectangleArray = new rectangle[5];
  rectangle r = new rectangle();
  int iter = 0;
  while(iter<=120){
    for(int i = 0; i < 5; i++){
     for(int j = 0; j< 5; j++){
       r = easyBoard[i][j];
     
       r.setYPos((r.getYPos())+1);
       
       if(iter >= 60){
        if(i==4){
         r.setYPos(240); 
        }
       }
       
     }
    }
    iter+=1;
  }
  
  tempRectangleArray[0] = easyBoard[4][0];
  tempRectangleArray[1] = easyBoard[4][1];
  tempRectangleArray[2] = easyBoard[4][2];
  tempRectangleArray[3] = easyBoard[4][3];
  tempRectangleArray[4] = easyBoard[4][4];
  
  for(int i = 3; i>=0; i--){
    for(int j = 4; j>=0; j--){
      
      easyBoard[i+1][j] = easyBoard[i][j];
      
    }
   
 }
 
 for(int i = 0; i<5;i++){
   easyBoard[0][i] = tempRectangleArray[i]; 
  }
 
}

void shiftRight(){
  
  rectangle[] tempRectangleArray = new rectangle[5];
  rectangle r = new rectangle();
  int iter = 0;
  while(iter<=120){
    for(int i = 0; i < 5; i++){
     for(int j = 0; j< 5; j++){
       r = easyBoard[i][j];
     
       r.setXPos((r.getXPos())+1);
       
       if(iter >= 60){
        if(j==4){
         r.setXPos(180); 
        }
       }
       
     }
    }
    iter+=1;
  }
  
  tempRectangleArray[0] = easyBoard[0][4];
  tempRectangleArray[1] = easyBoard[1][4];
  tempRectangleArray[2] = easyBoard[2][4];
  tempRectangleArray[3] = easyBoard[3][4];
  tempRectangleArray[4] = easyBoard[4][4];
  
 //swap all values
 for(int i = 4; i>=0; i--){
    for(int j = 3; j>=0; j--){
      
      easyBoard[i][j+1] = easyBoard[i][j];
      
    }
   
 }
 
  
  for(int i = 0; i<5;i++){
   easyBoard[i][0] = tempRectangleArray[i]; 
  }
  
}

void shiftLeft(){
  
  rectangle[] tempRectangleArray = new rectangle[5];
  rectangle r = new rectangle();
  int iter = 0;
  while(iter<=120){
    for(int i = 0; i < 5; i++){
     for(int j = 0; j< 5; j++){
       r = easyBoard[i][j];
     
       r.setXPos((r.getXPos())-1);
       
       if(iter >= 60){
        if(j==0){
         r.setXPos(665); 
        }
       }
       
     }
    }
    iter+=1;
  }
  
  tempRectangleArray[0] = easyBoard[0][0];
  tempRectangleArray[1] = easyBoard[1][0];
  tempRectangleArray[2] = easyBoard[2][0];
  tempRectangleArray[3] = easyBoard[3][0];
  tempRectangleArray[4] = easyBoard[4][0];
  
  for(int i = 0; i<=4; i++){
    for(int j = 0; j<=3; j++){
      
      easyBoard[i][j] = easyBoard[i][j+1];
      
    }
   
 }
 
  
  for(int i = 0; i<5;i++){
   easyBoard[i][4] = tempRectangleArray[i]; 
  }
  
  
}

void keyPressed(){  
     if(keyCode == UP){
       shiftUp();
     }
     else if(keyCode == DOWN){
       shiftDown();
      }
     else if(keyCode == RIGHT){
      shiftRight();
     }
     else if(keyCode == LEFT){
       shiftLeft();
     }  
}