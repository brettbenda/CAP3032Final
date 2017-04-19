class GameBoard{
 String difficulty;
 color[][] colors;
 int sideLength;
 color[] potentialColors = {color(#0033ff),color(#00ff33),color(#3300ff),color(#33ff00),color(#ff3300),color(#ff0033)
                           ,color(#ff11cc),color(#ffcc11),color(#11ffcc),color(#11ccff),color(#cc11ff),color(#ccff11)};
 
 GameBoard(GameBoard input){
   //creates the gameboard
     this.difficulty = input.difficulty;
     this.colors = new color[input.sideLength][input.sideLength];
     this.sideLength = input.sideLength;
          
     for(int i = 0;i<sideLength;i++){
      for(int j = 0;j<sideLength;j++){
       colors[i][j]=input.colors[i][j];
      }
     }
 }
 
 GameBoard(String difficulty){
   //creates the game board
   if(difficulty.equals("hard")){
     this.difficulty = difficulty;
     this.colors = new color[9][9];
     this.sideLength = 9;
          
     for(int i = 0;i<sideLength;i++){
      for(int j = 0;j<sideLength;j++){
       float random = random(0,5);
       if(random<1){ 
        colors[i][j]= potentialColors[(int)random(0,12)];
       }else if(random>4){
        colors[i][j]=0;
       }else{
        colors[i][j]=200; 
       }
      }
     }
   }
   if(difficulty.equals("medium")){
     this.difficulty = difficulty;
     this.colors = new color[7][7];
     this.sideLength = 7;
     for(int i = 0;i<sideLength;i++){
      for(int j = 0;j<sideLength;j++){
       float random = random(0,5);
       if(random<1){ 
        colors[i][j]= potentialColors[(int)random(0,12)];
       }else if(random>4){
        colors[i][j]=0;
       }else{
        colors[i][j]=200; 
       }
      }
     }
   }
   if(difficulty.equals("easy")){
     this.difficulty = difficulty;
     this.colors = new color[5][5];
     this.sideLength = 5;
     for(int i = 0;i<sideLength;i++){
      for(int j = 0;j<sideLength;j++){
       float random = random(0,5);
       if(random<1){ 
        colors[i][j]= potentialColors[(int)random(0,12)];
       }else if(random>4){
        colors[i][j]=0;
       }else{
        colors[i][j]=200; 
       }
      }
     }
   }
 }
 
 void show(){
   //draws the gameboard
  rectMode(CENTER); 
  stroke(230);
  noFill();
  
  rect(300,350,450,450,50);
  
  noStroke(); 
  rectMode(CORNER);
  for(int i = 0;i<sideLength;i++){
   for(int j = 0;j<sideLength;j++){
    colorMode(HSB);
    
    fill(colors[i][j]);
    rect(102.5+(i*(400/sideLength)),155+(j*(400/sideLength)),(400/sideLength)-5,(400/sideLength)-5,15);
   }
  }
 }
 
 void showKey(){
   //shows the key to which we want the user to achieve
  rectMode(CORNER);
  noStroke(); 
  for(int i = 0;i<sideLength;i++){
   for(int j = 0;j<sideLength;j++){
    colorMode(HSB);
    
    fill(colors[i][j]);
    rect(175+5+(i*(250/sideLength)),612.5+(j*(250/sideLength)),(250/sideLength)-5,(250/sideLength)-5,15-sideLength);
   }
  }
 }
 
 void randomize(){
   //randomizes the moves made on the game board to give the player a challenge to solve
   int times=0;
   switch(difficulty){
    case "easy":
      times = 5;
      break;
    case "medium":
      times = 10;
      break;
    case "hard":
      times = 15;
      break;
   }
   
  for(int i = 0; i < times; i++){
    float temp = random(0,4);
    
    if(temp < 1){
      moveUp();
      print("U");
    }else if(temp >= 1 && temp < 2){
      moveDown();
      print("D");
    }else if(temp >= 2 && temp < 3){
      moveRight();
      print("R");
    }else{
      moveLeft();
      print("L");
    }
    println(" ");
  }
 }
 
 void moveRight(){
   //shifts everything that can shift to the right
  for(int i = sideLength-1;i>=0;i--){
   for(int j = 0;j<sideLength;j++){
     if(i+1==sideLength){
      //edge of gameboard
     }else if(colors[i][j]==0){
      //walls dont move
     }else if(colors[i+1][j]!=200){
      //occupied by a block that is not empty
     }else if(colors[i+1][j]==0){
      //next tile is a wall 
     }else{
       colors[i+1][j]=colors[i][j];
       colors[i][j]=200;
     }
   }
  }
 }
 
  void moveLeft(){
    //shifts everything that can shift to the left
  for(int i = 0;i<sideLength;i++){
   for(int j = 0;j<sideLength;j++){
     if(i-1==-1){
      //edge of gameboard
     }else if(colors[i][j]==0){
      //walls dont move
     }else if(colors[i-1][j]!=200){
      //occupied by a block that is not empty
     }else if(colors[i-1][j]==0){
      //next tile is a wall 
     }else{
       colors[i-1][j]=colors[i][j];
       colors[i][j]=200;
     }
   }
  }
 }
 
  void moveDown(){
    //shifts everything that can shift to the down direction
  for(int i = 0;i<sideLength;i++){
   for(int j = sideLength-1;j>=0;j--){
     if(j+1==sideLength){
      //edge of gameboard
     }else if(colors[i][j]==0){
      //walls dont move
     }else if(colors[i][j+1]!=200){
      //occupied by a block that is not empty
     }else if(colors[i][j+1]==0){
      //next tile is a wall 
     }else{
       colors[i][j+1]=colors[i][j];
       colors[i][j]=200;
     }
   }
  }
 }
 
  void moveUp(){
    //shifts everything that can shift to the up direction
  for(int i = 0;i<sideLength;i++){
   for(int j = 0;j<sideLength;j++){
     if(j-1==-1){
      //edge of gameboard
     }else if(colors[i][j]==0){
      //walls dont move
     }else if(colors[i][j-1]!=200){
      //occupied by a block that is not empty
     }else if(colors[i][j-1]==0){
      //next tile is a wall 
     }else{
       colors[i][j-1]=colors[i][j];
       colors[i][j]=200;
     }
   }
  }
 }
 
}