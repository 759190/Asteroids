class Ship extends GameObject {

  //Instance Variables
  PVector direction;
  int shotTimer, immunityTimer, threshold;
  int UFOcounter;


  //Constructors
  Ship() {
    lives=3;
    location=new PVector(width/2, height/2);
    velocity=new PVector(0, 0);
    direction=new PVector(0, -0.1);
    shotTimer=0;
    threshold=60;
    immunityTimer=0;
  }

  //Behaviour Functions
  void show() {
    pushMatrix();
    
    
    
    translate(location.x, location.y);
    rotate(direction.heading());
    rectMode(CORNER);

//initial hit immunity
    if (immunityTimer<=180) {
      noStroke();
     fill(#7EAEFF);
      circle(0,0,60);
      fill(0);
      circle(0,0,55);
      
    }
    
    //space ship
    fill(150);
    stroke(20);
    triangle(-25, -12.5, -25, 12.5, 25, 0);
    rect(-25, -30, 5, 60); //wing connecter
    noStroke();
    rect(-10, -15, 10, 30); //center rectangle
    stroke(0);
    rect(-30, -15, 3, 30); //tail
    rect(-20, -30, 20, 5); //left wing
    rect(-20, 25, 20, 5); //right wing
    //window
    fill(#7EAEFF);
    ellipse(-10, 0, 20, 5);
    popMatrix();

    //lives counter
    fill(255);
    textSize(20);
    text("Lives: "+lives, width/2, 100); //Life counter
//------------------------------------------------
    

    immunityTimer=immunityTimer+1;
    UFOcounter=UFOcounter+1;

  }

  void act() {
    super.act();
 
    //Create UFO
    if (UFOcounter>100){
myObjects.add(new UFO()); 
UFOcounter=0;
 }
    
   if (immunityTimer>=180) { 
      //collision with asteroid -------------------------------------------
      int i=0;
      while (i<myObjects.size()) {
        GameObject myObj=myObjects.get(i);
        if (myObj instanceof Asteroid) {
          if (dist(location.x, location.y, myObj.location.x, myObj.location.y)<= size/2+myObj.size) {
            immunityTimer=0;
            lives=lives-1;
            if (lives==0) mode=GAMEOVER;
          }
        }
        i++;
      }
    } //--------------------------------------------------------- 
 if (immunityTimer>=180) { 
      //collision UFO bullet -------------------------------------------
      int i=0;
      while (i<myObjects.size()) {
        GameObject myObj=myObjects.get(i);
        if (myObj instanceof UFObullet) {
          if (dist(location.x, location.y, myObj.location.x, myObj.location.y)<= size/2+myObj.size) {
            immunityTimer=0;
            //myObjects.add(new Particle()); //adds explosion particles
            lives=lives-1;
            if (lives==0) mode=GAMEOVER;
          }
        }
        i++;
      }
    } //--------------------------------------------------------- 

    if (velocity.mag() >20) velocity.setMag(20); // sets max speed

    shotTimer++;

    //moving the ship
    if (upkey) {
      velocity.add(direction);
      myObjects.add(new Fire()); //adds one fire
      myObjects.add(new Fire());
    }
    if (downkey) {
      velocity.sub(direction);  
      //myObjects.add(new Particle());
      //myObjects.add(new Particle());
    }
    if (leftkey)direction.rotate(-radians(5));
    if (rightkey)direction.rotate(radians(5));
    //shoot bullets
    if (spacekey&&shotTimer>=threshold) {
      myObjects.add(new Bullet()); 
      myObjects.add(new Bullet());
      shotTimer=0;
    } 
    //slows down ship when not holding key
    if (upkey ==false && downkey==false) velocity.setMag(velocity.mag()*0.98);
  }
}
