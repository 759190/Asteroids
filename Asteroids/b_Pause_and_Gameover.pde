void pause () {
  
}

void pauseClicks() {  
}

void reset() { //reset-------------------------------------------
myShip=new Ship();
 
 myObjects=new ArrayList<GameObject>();
 myObjects.add(myShip);
 myObjects.add(new Asteroid());
 myObjects.add(new Asteroid());
 myObjects.add(new Asteroid());
 
 myObjects.add(new UFO()); 
 myObjects.add(new UFO()); 



 
 

    }//end
    
// GAMEOVER---------------------------------------------------------------------
void gameover() {
  if (myShip.lives==0) {
  rectMode(CORNER);
  fill(0,255,0);
  noStroke();
  rect(0,0,width,height);
  
  //Title text
  fill(0);
  textAlign(CENTER);
  textSize(100);
  text("You lose",width/2,height/2); //black font
  }
   
 
}

void gameoverClicks() { 
  reset();
  mode=INTRO;
}
