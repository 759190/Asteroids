class Particle extends GameObject {
 int t; //transparency
 
 Particle (float x,float y) {
   lives=1;
   size=int(random(5,12));
   t=int(random(200,255));
   location=new PVector(x,y);
    velocity= new PVector(0,1);
 
   
velocity.rotate(PI+random(-10,10)); 
   velocity.setMag(7); 
   
   
 }
 
  void show() {
    rectMode(CENTER);
    noStroke();
    fill(255);
    square(location.x,location.y,size);
  }
  void act() {
    super.act(); //movement code
    t=t-10;
    if(t<=0) lives=0;
    
  }
  
  
  
  
} //end
