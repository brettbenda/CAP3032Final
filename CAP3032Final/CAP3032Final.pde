String menu = "home";

//Buttons on "home"
Button start = new Button(175,600,150,75,#aaccff,"Start");
Button rules = new Button(425,600,150,75,#ffccaa,"Rules");

void setup(){
  size(600,700);
}

void draw(){
  switch(menu){
    case "home":
      drawHome();
      break;
    case "rules":
    
    case "preGame":
    
    case "game":
    
    case "postGame":
  }
}

void drawHome(){
  background(255);
  
  textFont(createFont("Tahoma",75));
  
  start.show();
  rules.show();
}