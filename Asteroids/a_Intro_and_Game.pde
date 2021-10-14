void intro() {
  rectMode(CORNER);
  fill(0);
  stroke(0);
  rect(0,0,height,width);
  fill(255);
  
  //Title text
  textAlign(CENTER);
  textSize(100);
  text("Asteroids",width/2,height/2); //black font
  
  
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
