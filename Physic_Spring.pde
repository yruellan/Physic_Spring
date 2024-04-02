Object obj ;
boolean is_clicking = false;
Particle on_mouse ;
float friction = 0.25 ; // between .01 and .2

void settings(){
  size(800,800);


  int n = 6 ;
  int m = 3 ;
  obj = Obj_from_square(n,m);
  
}

void draw(){
  background(0);
  
  //obj.force(new PVector(random(-.1,.1),1)); // add a force
  obj.collision();
  obj.update();
  
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
