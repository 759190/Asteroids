class UFO extends GameObject {
  
  int bulletCounter; 
  float vx,vy;
  UFO() {
    lives=1;
   location=new PVector (random(0,width), random(0,height));
    velocity= new PVector(0,1);
    velocity.rotate(random(0,TWO_PI)); //360 Degrees
    size=50;
 vx=myShip.location.x-location.x; 
 vy=myShip.location.y-location.y;
  }
  
  
  
  void show() {
   noStroke();
   fill(255,0,0);
   ellipse(location.x,location.y,size,size);
   bulletCounter=bulletCounter+1;
   
  }
  void act() {
   super.act(); 
   if (bulletCounter>60) {
   myObjects.add(new UFObullet(location.x,location.y,vx,vy));


     bulletCounter=0;
   }
   
   //collision check
   int i=0;
   while(i<myObjects.size()) {
     GameObject myObj=myObjects.get(i);
     if (myObj instanceof Bullet) {
  if (dist(location.x,location.y,myObj.location.x,myObj.location.y)<= size/2+myObj.size) {
   myObj.lives=0;
  myObjects.add(new Particle(location.x,location.y)); //adds explosion particles
  myObjects.add(new Particle(location.x,location.y));
  myObjects.add(new Particle(location.x,location.y));
  myObjects.add(new Particle(location.x,location.y));
   lives=0; //distroys UFO
  
  
  }  
     }
      i++;
     }
  }
} //end
