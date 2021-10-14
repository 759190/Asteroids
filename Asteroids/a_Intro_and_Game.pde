void intro() {
  rectMode(CORNER);
  //gif
image(gif[f],500,500,1000,1000);
f=f+1;
if (f==frameNumber) f=0;
  
  //Title text
  textFont(space);
  textAlign(CENTER);
  textSize(70);
  text("Asteroids",width/2,300); //black font
  
  
}

void introClicks() {  
  mode=GAME;

   
}

// Game -------------------------------------------------------------------
void game() {
  
  //pause button
  

  
   background(0); 
 int i=0;
 while(i<myObjects.size()) {
   GameObject myObj= myObjects.get(i);
   myObj.show();
   myObj.act();
   
   if (myObj.lives==0) {
     myObjects.remove(i);
   }else{
     i++;
   }
 }
 
  
}
void gameClicks() { 
 mode=PAUSE;
}
