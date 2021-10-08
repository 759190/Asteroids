class Bullet extends GameObject {
 
  int timer;
 
  Bullet() {
    timer=60;
    lives=1;
    location=new PVector(myShip.location.x,myShip.location.y);
    velocity=new PVector(myShip.direction.x,myShip.direction.y);
    velocity.setMag(10); // set magnatude
    velocity.add(myShip.velocity); //bullet speed (adding)
    size=10;
  }
 void show() {
   stroke(255);
   fill(255);
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
