class UFO extends GameObject {
  
  int bulletCounter; 
  float vx,vy;
  int randomSpawn;
  int a;
  UFO() {
   lives=1;
   randomSpawn= int (random(0,4));
   size=50;
   
    //Random spawn point on edge_________________________________________ 
    if(randomSpawn==0) {
   location=new PVector (random(0,width), 0); // start at top
   velocity= new PVector(0,1);
    }
    if(randomSpawn==1) {
   location=new PVector (random(0,width), 800); // start at bottom
   velocity= new PVector(0,-1);
    }
    if(randomSpawn==2) {
   location=new PVector (0, random(0,height)); //start at left 
   velocity= new PVector(1,0);
    }
    if(randomSpawn==3) {
   location=new PVector (800, random(0,height)); // start at right
   velocity= new PVector(-1,0);
    } 
    //____________________________________________________________
 
  }
  
  
  
  void show() {
    
    vx=myShip.location.x-location.x; 
    vy=myShip.location.y-location.y;
 
   stroke(255);
   fill(lightPurple);
   ellipse(location.x,location.y,size,size);
   fill(lightGrey);
   ellipse(location.x,location.y,size-20,size-20);
   bulletCounter=bulletCounter+1;
   
  }
  void act() {
   super.act(); 
   if (bulletCounter>150) {
   myObjects.add(new UFObullet(location.x,location.y,vx,vy));
     bulletCounter=0;
   }
   //------------------------
   //kill ufo when off screen
  if (randomSpawn==0 && location.y>800) lives=0;
  if (randomSpawn==1 && location.y<0) lives=0;
  if (randomSpawn==2 && location.x>800) lives=0;
  if (randomSpawn==3 && location.x<0) lives=0;
  
      //------------------------

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
