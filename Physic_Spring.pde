Object obj ;
boolean is_clicking = false;
Particle on_mouse ;     // selected particle
float friction = 0.05 ; // between .01 and .2

void settings(){
  size(800,800);

  int n = 6 ;
  int m = 3 ;
  obj = Obj_from_square(n,m);
  
}

void draw(){
  background(0);
  
  obj.apply_force(new PVector(0,1)); // add gravity
  obj.update();
  
  if (is_clicking ){
    // set position and speed of the grabed particle
    on_mouse.pos = new PVector(mouseX,mouseY);
    on_mouse.spe = new PVector(0,0);
  }
  obj.show();
}


void mouseClicked(){
  // Grab the nearest particle
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
  // lock or unlock the selected particle
  on_mouse.can_move = !on_mouse.can_move ;
}
