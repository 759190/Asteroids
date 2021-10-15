class Asteroid extends GameObject {
 
  int asterCount;
 
  Asteroid() {
    lives=1;
    location=new PVector (random(0,width), random(0,height));
    velocity= new PVector(0,1);
    velocity.rotate(random(0,TWO_PI)); //360 Degrees
    size=100;
    asterCount=0;
    
    

  }
  
  Asteroid(int s,float x, float y) {
    lives=1;
    location=new PVector(x,y);
    velocity= new PVector(0,1.5);
    velocity.rotate(random(0,TWO_PI)); //360 Degrees
    size=s;
    
    
  }
  
  
  void show() {
   noFill();
   stroke(255);
   ellipse(location.x,location.y,size,size);
  
   

  }
  void act() {
   super.act(); 
   
 
   
   //collision check
   int i=0;
   while(i<myObjects.size()) {
     GameObject myObj=myObjects.get(i);
     if (myObj instanceof Bullet) {
  if (dist(location.x,location.y,myObj.location.x,myObj.location.y)<= size/2+myObj.size) {
    myObj.lives=0;
   lives=0; //distroys asteroid
  
  asterCount=asterCount+1;
  if (asterCount==3) {
      mode=GAMEOVER; // --------------------
    } 
   
   
   
   //adds explosion particles
  myObjects.add(new Particle(location.x,location.y)); 
  myObjects.add(new Particle(location.x,location.y));
  myObjects.add(new Particle(location.x,location.y));
  myObjects.add(new Particle(location.x,location.y));
  myObjects.add(new Particle(location.x,location.y));
  
   //splits asteroids into 2
   if(size>40) {
   myObjects.add(new Asteroid(size/2,location.x,location.y));
   }

  }  
     }
      i++;
     }
  }
} //end
