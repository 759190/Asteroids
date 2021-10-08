void pause () {
  
}

void pauseClicks() {  
}

void reset() { //reset-------------------------------------------
   mode=INTRO;
   
  

    }//end
    
// GAMEOVER---------------------------------------------------------------------
void gameover() {
  rectMode(CORNER);
  fill(0,255,0);
  noStroke();
  rect(0,0,width,height);
  
  //Title text
  fill(0);
  textAlign(CENTER);
  textSize(100);
  text("Game Over",width/2,height/2); //black font
  
}

void gameoverClicks() {  
   reset();
}
