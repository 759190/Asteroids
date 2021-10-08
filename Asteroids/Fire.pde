class Fire extends GameObject {
 int t; //transparency
 PVector nudge;
 int r,g,b; //colours
 
 Fire () {
   lives=1;
   size=int(random(5,12));
   t=int(random(200,255));
   location=myShip.location.copy(); //copies ship location
   //move the fire
   nudge=myShip.direction.copy();
   nudge.rotate(PI);
   nudge.setMag(40);
   location.add(nudge);
   
   velocity=myShip.direction.copy(); //copies ship direction
   velocity.rotate(PI+random(-0.5,0.5)); //rotates 180 (radians(180))
   velocity.setMag(3); 
   
   //Random colours
   r=int(random(0,255));
   g=int(random(0,255));
   b=int(random(0,255));
 }
 
  void show() {
    rectMode(CENTER);
    noStroke();
    fill(r,g,b,t);
    square(location.x,location.y,size);
  }
  void act() {
    super.act(); //movement code
    t=t-10;
    if(t<=0) lives=0;
    
  }
  
  
  
  
} //end
