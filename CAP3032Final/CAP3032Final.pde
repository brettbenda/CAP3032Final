/*
TODO: 

Brett:
Make buttons images instead of art we write code for
[current ones are practical but ugly, will make nice ones eventually]
*/

String menu = "home";//used to tell what menu we are on, change when we click on buttons

//Buttons on "home"
Button start = new Button(300,600,300,150,#aaccff,"Start");
Button rules = new Button(300,800,300,150,#ffccaa,"Rules");

//Buttons on "rules"
Button backFromRules = new Button(60,60,50,50,#ffaaaa,"<-");

//Buttons on "preGame"
Button backFromPreGame = new Button(60,60,50,50,#ffaaaa,"<-");
Button playGame = new Button(300,600,300,150,#aaccff,"play");

//Buttons on "game"
Button backFromGame = new Button(60,60,50,50,#ffaaaa,"<-");
Button simulateWin = new Button(300,600,300,150,#aaffcc,"win");

//Butons on "postGame"
Button backFromPostGame = new Button(60,60,50,50,#ffaaaa,"<-");

void setup(){
  size(600,900);
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
     if(playGame.isOver()){
         menu = "game";
     }break;
   case "game":
     if(backFromGame.isOver()){
        menu = "home"; 
     }
     if(simulateWin.isOver()){
         menu = "postGame";
     }break;
   case "postGame":
     if(backFromPostGame.isOver()){
         menu = "home";
     }
     break;
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
  text("[will select difficulty and game type here]",300,200);
  backFromPreGame.show();
  playGame.show();
}

void drawGame(){
  background(255);
  textSize(30);
  text("[will play game here]",300,200);
  backFromGame.show();
  simulateWin.show();
}

void drawPostGame(){
  background(255);
  textSize(30);
  text("[will see post game stats here]",300,200);
  backFromPostGame.show();
}