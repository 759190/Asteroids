boolean upkey,downkey,leftkey,rightkey,spacekey;
Ship myShip;
ArrayList<GameObject> myObjects;

//mode variables -------------------------------------
int mode;
final int INTRO=0;
final int GAME=1;
final int PAUSE=2;
final int GAMEOVER=3;

//gif
PImage[] gif;
int frameNumber;
int f; //frame

PFont space; //font


void setup() {
 size(800,800);
 mode=INTRO;
 imageMode(CENTER); 
 
 myShip=new Ship();
 
 myObjects=new ArrayList<GameObject>();
 myObjects.add(myShip);
 myObjects.add(new Asteroid());
 myObjects.add(new Asteroid());
 myObjects.add(new Asteroid());
 
 space=createFont("SPACE.ttf", 200); //font
 
//Set up Gif
 frameNumber=15;
 gif = new PImage[frameNumber];
 int i=0;
 while (i<frameNumber) { //while loop
   gif[i]=loadImage("frame_"+i+"_delay-0.03s.gif");
   i=i+1;
   }


  
  
} //end

void draw() {



   //game mode
    if (mode==INTRO) {
    intro();
  }else if (mode==GAME) {  
   game(); 
  }else if (mode==PAUSE) {
    pause();
  }else if (mode==GAMEOVER) {
    gameover();
  }else{
    println("Error: Mode= " + mode);
  }
 

}//end
