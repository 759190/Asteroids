class UFO extends GameObject {
  
  int bulletCounter; 
  float vx,vy;
  int randomSpawn;  
  UFO() {
   lives=1;
   randomSpawn= int (random(0,3));
   size=50;
    //____________________________________________________________ 
    if(randomSpawn==0) {
   location=new PVector (random(0,width), 0); // top
   velocity= new PVector(0,1); 
    }
    if(randomSpawn==1) {
   location=new PVector (random(0,width), 800); // bottom
   velocity= new PVector(0,1);
    }
    if(randomSpawn==2) {
   location=new PVector (0, random(0,height)); //left 
   velocity= new PVector(0,1);
    }
    if(randomSpawn==3) {
   location=new PVector (800, random(0,height)); //right
   velocity= new PVector(0,1);
    }
    //____________________________________________________________
    
    
   
  }
  
  
  
  void show() {
    
    vx=myShip.location.x-location.x; 
    vy=myShip.location.y-location.y;
 
   noStroke();
   fill(255,0,0);
   ellipse(location.x,location.y,size,size);
   bulletCounter=bulletCounter+1;
   
  }
  void act() {
   super.act(); 
   if (bulletCounter>150) {
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
