class UFO extends GameObject {
  
  
  UFO() {
    lives=1;
    location=new PVector (random(0,width), random(0,height));
    velocity= new PVector(0,1);
    velocity.rotate(random(0,TWO_PI)); //360 Degrees
    size=50;
  }
  
  UFO(int s,float x, float y) {
    lives=1;
    location=new PVector(x,y);
    velocity= new PVector(0,1);
  //  velocity.rotate(random(0,TWO_PI)); //360 Degrees
    size=s;
  }
  
  
  void show() {
   noStroke();
   fill(255,0,0);
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