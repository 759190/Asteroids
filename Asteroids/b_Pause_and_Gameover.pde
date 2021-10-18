void pause () {
  fill(255);
  textAlign(CENTER);
  textSize(100);
  text("Pause",width/2,height/2); 
}

void pauseClicks() {  
  mode=GAME;
}

void reset() { //reset-------------------------------------------
myShip=new Ship();
 
 myObjects=new ArrayList<GameObject>();
 myObjects.add(myShip);
 myObjects.add(new Asteroid());
 myObjects.add(new Asteroid());
 myObjects.add(new Asteroid());

    }//end
    
// GAMEOVER---------------------------------------------------------------------
void gameover() {
  
  //gif
image(gif[f],500,500,1000,1000);
f=f+1;
if (f==frameNumber) f=0;
  
  if (myShip.lives==0) {
  rectMode(CORNER);
   
  //Title text
  fill(255);
  textAlign(CENTER);
  textSize(100);
  text("You lose",width/2,height/2); 
  }else{
  
  
     mode=GAMEOVER;
  rectMode(CORNER);
   
  //Title text
  fill(255);
  textAlign(CENTER);
  textSize(100);
  text("You Win",width/2,height/2);
  }
   
 
}

void gameoverClicks() { 
  reset();
  mode=INTRO;
}
