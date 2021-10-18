void intro() {
  rectMode(CORNER);
  //gif
image(gif[f],500,500,1000,1000);
f=f+1;
if (f==frameNumber) f=0;
  
  //Title text
  fill(255);
  textFont(space);
  textAlign(CENTER);
  textSize(70);
  text("Asteroids",width/2,300); //black font
  

   //start button
 tactileRect(225,520,350,120);
 strokeWeight(4);
 fill(purple);
 rect(225,520,350,120); //start button
    fill(lightPurple);
    textSize(60);
 text("Start",width/2,600); //black font
 
 //Instructions
 textSize(20);
 fill(lightPurple);
  text("Click W to teleport ship",width/2,400); 
  text("Click the screen to pause",width/2,440); 

}

void introClicks() {  
  if (mouseX>225&&mouseX<575&&mouseY>500&&mouseY<640) {
   mode=GAME; 
 }
   
}

// Game -------------------------------------------------------------------
void game() {
   background(0); 
  //pause button
  
 
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

//for rectangles
 void tactileRect(int x,int y, int w, int h) { 
  if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    stroke(255);
  } else {
    stroke(lightPurple);
  }
 }
