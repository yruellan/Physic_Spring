Object obj ;
boolean is_clicking = false;
Particle on_mouse ;
float friction = 0.015 ;

void settings(){
  size(800,800);
  
  //Particle A = new Particle(100,100);
  //Particle B = new Particle(200,100);
  //Particle C = new Particle(100,200);
  //Particle D = new Particle(200,200);
  //Particle E = new Particle(300,200);
  
  //Spring S1 = new Spring(A,B,100);
  //Spring S2 = new Spring(C,B,100);
  //Spring S3 = new Spring(A,C,100);
  //Spring S4 = new Spring(D,C,100);
  //Spring S5 = new Spring(D,B,100);
  //Spring S6 = new Spring(D,E,50);
  //Spring S7 = new Spring(A,D,100);
  
  //Particle[] particule = {A,B,C,D,E};
  //Spring[] springs = {S1,S2,S3,S4,S5,S7};
  
  int n = 6 ;
  int m = 3 ;
  obj = Obj_from_square(n,m);
  
}

void draw(){
  background(0);
  
  //obj.force(new PVector(random(-.1,.1),1));
  obj.collision();
  obj.apply();
  
  if (is_clicking){
    on_mouse.pos = new PVector(mouseX,mouseY);
    on_mouse.spe = new PVector(0,0);
  }
  obj.show();
}

void mouseMoved(){
  
}
void mouseClicked(){
  is_clicking = !is_clicking ;
  if (is_clicking){
    float min = 1000 ;
    for ( int i = 0 ; i<obj.part.length ; i++){
      PVector v = new PVector(mouseX,mouseY).sub(obj.part[i].pos);
      if ( v.mag() < min){
        min = v.mag() ;
        on_mouse = obj.part[i] ;
      }
    }
  }
}

void keyPressed(){
  on_mouse.can_move = !on_mouse.can_move ;
}
