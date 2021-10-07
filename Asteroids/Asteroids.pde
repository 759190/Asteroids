boolean upkey,downkey,leftkey,rightkey,spacekey;
Ship myShip;
ArrayList<GameObject> myObjects;

//mode variables -------------------------------------
int mode;
final int INTRO=0;
final int GAME=1;
final int PAUSE=2;
final int GAMEOVER=3;


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

} //end

void draw() {
 background(0); 

 
 int i=0;
 while(i<myObjects.size()) {
   GameObject myObj= myObjects.get(i);
   myObj.show();
   myObj.act();
   
   if (myObj.lives==0) {
     myObjects.remove(i);
   }else{
     i++;
   }
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
 }

}//end
