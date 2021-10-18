class UFObullet extends GameObject {
  int timer;
 
  UFObullet(float x,float y, float vx, float vy) {
    timer=80;
    lives=1;
    location=new PVector(x,y);
    velocity= new PVector(vx,vy);
    velocity.setMag(10); // set magnatude
    size=10;
       

  }
 void show() {
   stroke(255);
   fill(lightPurple);
   ellipse(location.x,location.y,size,size);
 }
 void act() {
   super.act();
   
   
   //bullet reload time
   timer--;
   if(timer<=0) {
     lives=0;  
   }
  
 
 }
  
  
}//end
