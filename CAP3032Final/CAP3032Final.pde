/*
TODO: 

Brett:
Make buttons images instead of art we write code for
[current ones are practical but ugly, will make nice ones eventually]
*/

String menu = "home";//used to tell what menu we are on, change when we click on buttons
String difficulty = "easy";

ImageButton start;
ImageButton rules;

ImageButton backFromRules;

ImageButton backFromPreGame;
ImageButton selectEasy;
ImageButton selectMed;
ImageButton selectHard;
ImageButton playGame;

ImageButton backFromGame;
GameBoard gameBoard = new GameBoard(difficulty);
GameBoard keyBoard;

ImageButton backFromPostGame;


void setup(){
  size(600,900);
  start = new ImageButton(300,675,loadImage("start.png"));
  rules = new ImageButton(300,800,loadImage("rules.png"));
  
  backFromRules = new ImageButton(60,60,loadImage("back.png"));
  
  backFromPreGame = new ImageButton(60,60,loadImage("back.png"));
  selectEasy = new ImageButton(300,300,loadImage("easy.png"));
  selectMed = new ImageButton(300,425,loadImage("medium.png"));
  selectHard = new ImageButton(300,550,loadImage("hard.png"));
  playGame = new ImageButton(300,700,loadImage("play.png"));
  backFromGame = new ImageButton(60,60,loadImage("back.png"));
  
  backFromPostGame = new ImageButton(60,60,loadImage("back.png"));
}

void draw(){
  switch(menu){
    case "home":
      drawHome();
      break;
    case "rules":
      drawRules();
      break;
    case "preGame":
      drawPreGame();
      break;
    case "game":
      drawGame();
      break;
    case "postGame":
      drawPostGame();
      break;
  }
}

void mousePressed(){
  switch(menu){
   case "home":
      if(start.isOver()){
        menu = "preGame";
      }
      if(rules.isOver()){
        menu = "rules";
      }
      break;  
   case "rules":
      if(backFromRules.isOver()){
        menu = "home";
      }
      break;
   case "preGame":
     if(backFromPreGame.isOver()){
        menu = "home"; 
     }
     if(selectEasy.isOver()){
        difficulty = "easy"; 
     }
     if(selectMed.isOver()){
        difficulty = "medium"; 
     }
     if(selectHard.isOver()){
        difficulty = "hard"; 
     }
     if(playGame.isOver()){
         gameBoard = new GameBoard(difficulty);
         keyBoard = new GameBoard(gameBoard);
         keyBoard.randomize();
         menu = "game";
     }break;
   case "game":
     if(backFromGame.isOver()){
        menu = "home"; 
     }
     break;
   case "postGame":
     if(backFromPostGame.isOver()){
         menu = "home";
     }
     break;
  }
}

void keyPressed(){
   switch(menu){
    case "game":
      if(keyCode==RIGHT){
        gameBoard.moveRight();
      }
      if(keyCode==LEFT){
        gameBoard.moveLeft();
      }
      if(keyCode==UP){
        gameBoard.moveUp();
      }
      if(keyCode==DOWN){
        gameBoard.moveDown();
      }
   }
}

void drawHome(){
  background(255);
  
  start.show();
  rules.show();
}

void drawRules(){
  background(255);
  textSize(30);
  text("[rules go here]",300,450);
  backFromRules.show();
}

void drawPreGame(){
  background(255);
  textSize(30);
  
  rectMode(CENTER);
  strokeWeight(5);
  
  switch(difficulty){
   case "easy":
     stroke(#26400D);
     fill(#26400D);
     rect(300,300,205,118,5);
     break;
   case "medium":
     stroke(#403B0D);
     fill(#403B0D);
     rect(300,425,205,118,5);
     break;
   case "hard":
     stroke(#40110D);
     fill(#40110D);
     rect(300,550,205,118,5);
     break;
  }
  
  
  backFromPreGame.show();
  selectEasy.show();
  selectMed.show();
  selectHard.show();
  playGame.show();
}

void drawGame(){
  background(255);
  textSize(30);
  backFromGame.show();
  gameBoard.show();
  keyBoard.showKey();
}

void drawPostGame(){
  background(255);
  textSize(30);
  text("[will see post game stats here]",300,200);
  backFromPostGame.show();
}