class Ship extends GameObject {

  //Instance Variables
  PVector direction;
  int shotTimer, immunityTimer, threshold;
  int UFOcounter;
  int teleportTimer;
  float s; // teleport timer size
  boolean danger;


  //Constructors
  Ship() {
    lives=3;
    location=new PVector(width/2, height/2);
    velocity=new PVector(0, 0);
    direction=new PVector(0, -0.1);
    shotTimer=0;
    threshold=60;
    immunityTimer=0;
    teleportTimer=0;
    s=100; // teleport timer size
    danger=false; // if asteroid is near 
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
      fill(lightPurple);
      circle(0, 0, 60);
      fill(0);
      circle(0, 0, 55);
    }

    //space ship----------------------------------------
  
    fill(grey);
    strokeWeight(1);
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
    fill(lightGrey);
    ellipse(-10, 0, 20, 5);
    popMatrix();

    //lives counter
    fill(lightGrey);
    textSize(20);
    text("Lives: "+lives, width/2, 100); //Life counter
    //------------------------------------------------

    immunityTimer=immunityTimer+1;
    UFOcounter=UFOcounter+1;
    teleportTimer=teleportTimer+1;



    //teleport timer bar
    if (teleportTimer>600) {
      fill(lightPurple);
      textSize(15);
     text("Press W", 150, 95); 
    }
    if (teleportTimer<600) {
      noFill();
      fill(lightGrey);
      rect(95, 75, 110, 20);
      fill(purple);
      rect(100, 80, s, 10);
      s=s-0.16;
    }
  }

  void act() {
    super.act();

    //Create UFO
    if (UFOcounter>600) {
      myObjects.add(new UFO()); 
      UFOcounter=0;
    }

    //Teleport feature // ----------------------------------------------------------------------------
 

    int t=0;
    while (t<myObjects.size()) {
      GameObject myObj=myObjects.get(t);
      if (myObj instanceof Asteroid) {

        if (wkey) {

          if (teleportTimer>600) {
            teleportTimer=0;
            s=100;
            
            myShip.location.x=(random(0, width));
            myShip.location.y=(random(0, width));

            while (danger==true) {
               myShip.location.x=(random(0, width));
              myShip.location.y=(random(0, width));
            
              while (dist(location.x, location.y, myObj.location.x, myObj.location.y)<= size/2+myObj.size+200) {
              danger=true;
            
            }
            }
         
            
         }
        }

        if (immunityTimer>=180) { 
          //collision with asteroid -------------------------------------------
          
          if (dist(location.x, location.y, myObj.location.x, myObj.location.y)<= size/2+myObj.size) {
            immunityTimer=0;
            lives=lives-1;
            if (lives==0) mode=GAMEOVER;
          }
        }
      }
      if (myObj instanceof UFObullet) {
        if (immunityTimer>=180) { 
          //collision UFO bullet -------------------------------------------


          if (dist(location.x, location.y, myObj.location.x, myObj.location.y)<= size/2+myObj.size+50) {
            immunityTimer=0;
            lives=lives-1;
            if (lives==0) mode=GAMEOVER;
          }
        }
      }
      t++;
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
}
if (leftkey)direction.rotate(-radians(5));
if (rightkey)direction.rotate(radians(5));

//shoot bullets
if (spacekey&&shotTimer>=threshold) {
  myObjects.add(new Bullet()); 
  myObjects.add(new Bullet());
  shotTimer=40;
} 
//slows down ship when not holding key
if (upkey ==false && downkey==false) velocity.setMag(velocity.mag()*0.98);
}
}
