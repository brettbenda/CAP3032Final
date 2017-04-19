/*
TODO: 

Brett:
Make buttons images instead of art we write code for
[current ones are practical but ugly, will make nice ones eventually]
*/
import ddf.minim.*;
AudioPlayer song, difficultyNoise, buttonNoise, victoryNoise;
Minim minim;
//To install library: (I don't know if it's in this sketch already)
//Sketch --> Import Library --> Search "Sound" --> Install "Minim | An audio library that provides easy to use class..."
//By "Damian Di Fede and Anderson Mills"

String menu = "home";//used to tell what menu we are on, change when we click on buttons
String difficulty = "easy";
int frames;
int seconds;
int fadeAlpha = 0;

ImageButton start;
ImageButton rules;

ImageButton backFromRules;

ImageButton backFromPreGame;
ImageButton selectEasy;
ImageButton selectMed;
ImageButton selectHard;
ImageButton playGame;

ImageButton backFromGame;
ImageButton reset;
ImageButton undo;
GameBoard gameBoard = new GameBoard(difficulty);
GameBoard keyBoard;
GameBoard resetBoard;
GameBoard firstSavedBoard;
GameBoard secondSavedBoard;
GameBoard thirdSavedBoard;
GameBoard fourthSavedBoard;
GameBoard fifthSavedBoard;

ImageButton backFromPostGame;

PImage background;

void setup(){
  size(600,900);
  start = new ImageButton(300,500,loadImage("start.png"));
  rules = new ImageButton(300,700,loadImage("rules.png"));
  
  background = loadImage("temoTileSliderBackground.png");
  
  backFromRules = new ImageButton(60,60,loadImage("back.png"));
  
  backFromPreGame = new ImageButton(60,60,loadImage("back.png"));
  selectEasy = new ImageButton(300,175,loadImage("easy.png"));
  selectMed = new ImageButton(300,300,loadImage("medium.png"));
  selectHard = new ImageButton(300,425,loadImage("hard.png"));
  playGame = new ImageButton(300,800,loadImage("play.png"));
  
  reset = new ImageButton(100,800,loadImage("reset.png"));
  undo = new ImageButton(500,800,loadImage("undo.png"));
  backFromGame = new ImageButton(60,60,loadImage("back.png"));
  
  backFromPostGame = new ImageButton(60,60,loadImage("back.png"));

  minim = new Minim(this);
  song = minim.loadFile("beep23.mp3");
  difficultyNoise = minim.loadFile("POP.WAV");
  buttonNoise = minim.loadFile("TINK.WAV");
  victoryNoise = minim.loadFile("VICTORY.WAV");
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
  //judging by what the mouse clicks on, it will switch between cases (so like between home screen and rules)
  switch(menu){
   case "home":
      if(start.isOver()){
        buttonNoise.rewind();
        buttonNoise.play();
        menu = "preGame";
      }
      if(rules.isOver()){
        buttonNoise.rewind();
        buttonNoise.play();
        menu = "rules";
      }
      break;  
   case "rules":
      if(backFromRules.isOver()){
        buttonNoise.rewind();
        buttonNoise.play();
        menu = "home";
      }
      break;
   case "preGame":
     if(backFromPreGame.isOver()){
       buttonNoise.rewind();
        buttonNoise.play();
        menu = "home"; 
     }
     if(selectEasy.isOver()){
        difficulty = "easy";
        difficultyNoise.rewind();
        difficultyNoise.play();
     }
     if(selectMed.isOver()){
        difficulty = "medium"; 
        difficultyNoise.rewind();
        difficultyNoise.play();
     }
     if(selectHard.isOver()){
        difficulty = "hard"; 
        difficultyNoise.rewind();
        difficultyNoise.play();
     }
     if(playGame.isOver()){
         buttonNoise.rewind();
         buttonNoise.play();
         gameBoard = new GameBoard(difficulty);
         keyBoard = new GameBoard(gameBoard);
         keyBoard.randomize();
         resetBoard = new GameBoard(gameBoard);
         firstSavedBoard = new GameBoard(gameBoard);
         secondSavedBoard = new GameBoard(gameBoard);
         thirdSavedBoard = new GameBoard(gameBoard);
         fourthSavedBoard = new GameBoard(gameBoard);
         fifthSavedBoard = new GameBoard(gameBoard);
         menu = "game";
         frames = 0;
         seconds = 0;
     }break;
   case "game":
     if(backFromGame.isOver()){
        buttonNoise.rewind();
        buttonNoise.play();
        menu = "home"; 
     }
     if(reset.isOver()){
       buttonNoise.rewind();
        buttonNoise.play();
      gameBoard = new GameBoard(resetBoard); 
     }
     if(undo.isOver()){
       buttonNoise.rewind();
        buttonNoise.play();
      undoMove(); 
     }
     break;
   case "postGame":
     if(backFromPostGame.isOver()){
       buttonNoise.rewind();
        buttonNoise.play();
         menu = "home";
     }
     break;
  }
}

void keyPressed(){
  //this method allows us to denote which direction to move the gameboard in
   switch(menu){
    case "game":
      if(keyCode==RIGHT || keyCode==LEFT || keyCode==UP || keyCode==DOWN){
        fifthSavedBoard = new GameBoard(fourthSavedBoard);
        fourthSavedBoard = new GameBoard(thirdSavedBoard);
        thirdSavedBoard = new GameBoard(secondSavedBoard);
        secondSavedBoard = new GameBoard(firstSavedBoard);
        firstSavedBoard = new GameBoard(gameBoard);   
        song.rewind();
        song.play();
      }
    
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
  //will draw the home screen
  background(background);
  start.show();
  rules.show();
}

void drawRules(){
  pushMatrix();
  background(255);
  noStroke();
  fill(245,161,161);
  rectMode(CORNER);
  rect(30,150,width-60,510);
  textMode(CENTER);
  fill(0);
  textSize(50);
  textAlign(CENTER);
  text("Rules",width/2,200);
  textSize(25);
  textAlign(LEFT);
  text("The goal of the game is to match a “key”",40,250);
  text("pattern displayed at the bottom of the",40,280);
  text("screen by manipulating a set of color tiles",40,310);
  text("on the game board.",40,340);
  text("1.  When the game begins, the player will ",50,380);
  text("use the keyboard arrow keys to slide",90,410);
  text("all color tiles on the game board in the",90,440);
  text("input direction.",90,470);
  text("2.  If a tile collides with another tile, they",50,510);
  text("move as one unit until separated.",90,540);
  text("3.  If a tile collides with a wall (black block)",50,580);
  text("or the edge of the board, it cannot",90,610);
  text("move further in that direction.",90,640);
  popMatrix();
  backFromRules.show();
}

void drawPreGame(){
  //will draw pregame, with a selection of difficulty and another case switch
  background(255);
  textSize(30);
  
  rectMode(CENTER);
  strokeWeight(5);
  fill(0);
  textFont(createFont("Tahoma",50));
  text("Difficulty:",200,100);
  
  switch(difficulty){
   case "easy":
     stroke(#26400D);
     fill(#26400D);
     rect(300,175,205,118,5);
     break;
   case "medium":
     stroke(#403B0D);
     fill(#403B0D);
     rect(300,300,205,118,5);
     break;
   case "hard":
     stroke(#40110D);
     fill(#40110D);
     rect(300,425,205,118,5);
     break;
  }
  
  
  backFromPreGame.show();
  selectEasy.show();
  selectMed.show();
  selectHard.show();
  playGame.show();
}

void drawGame(){
  //will draw and setup the actual game
  background(255);
  textSize(30);
  backFromGame.show();
  gameBoard.show();
  reset.show();
  undo.show();
  keyBoard.showKey();
  checkWinCondition();
  
  frames++;
  if(frames==60){
    seconds++;
    frames = 0;
  }
  fill(0);
  text("Time: " + seconds,245,100);
}

void undoMove(){
  
 gameBoard = new GameBoard(firstSavedBoard); 
 firstSavedBoard = new GameBoard(secondSavedBoard);
 secondSavedBoard = new GameBoard(thirdSavedBoard);
 thirdSavedBoard = new GameBoard(fourthSavedBoard);
 fourthSavedBoard = new GameBoard(fifthSavedBoard);
 
}

void checkWinCondition(){
 //this method runs a simple array comparison to check the win condition
  color[][] gameboard = gameBoard.colors;
  color[][] keyboard = keyBoard.colors;
  int iterator = 0;
  boolean winCondition = false;
  for(int i = 0; i < gameBoard.sideLength; i++){
   for(int j = 0; j < gameBoard.sideLength; j++){
     
    if(gameboard[i][j] == keyboard[i][j]){
     iterator++; 
    }
     
   }
  }
  
  if(iterator == (gameBoard.sideLength * gameBoard.sideLength)){
   winCondition = true; 
  }
  if(winCondition){
    frames = 0;
    fadeAlpha = 0;
    victoryNoise.rewind();
    victoryNoise.play();
    menu = "postGame";
  }
}

void drawPostGame(){
  //draws the post game screen
  frames++;
  if(frames==3){
    println(frames);
    fadeAlpha++;
    frames = 0;
  }
  fill(255,fadeAlpha);
  rect(0,0,600,900);
  textSize(30);
  fill(0);
  text("You finished the game in " + seconds  + " seconds.",50,200);
  backFromPostGame.show();
}