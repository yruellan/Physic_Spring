Object[] objs ;
boolean is_clicking = false;
Particle on_mouse ;     // selected particle
float friction = 0.015 ; // between .01 and .2

void settings(){
  size(800,800);

  objs = new Object[1];
  
  // Nb particule for x and y, length (in pixel) of spring
  objs[0] = Obj_from_square(5,3,80.0);
  
}

void draw(){
  background(0);
  
  for (Object obj : objs){
    obj.apply_force(new PVector(0,.2)); // add gravity
    obj.update();
  }
  
  if (is_clicking ){
    // set position and speed of the grabed particle
    on_mouse.pos = new PVector(mouseX,mouseY);
    on_mouse.spe = new PVector(0,0);
  }
  for (Object obj : objs) obj.show();

}


void mouseClicked(){
  // Grab the nearest particle
  is_clicking = !is_clicking ;
  if (is_clicking){
    float min = 1000 ;
    for (Object obj : objs){
      for ( int i = 0 ; i<obj.part.length ; i++){
        PVector v = new PVector(mouseX,mouseY).sub(obj.part[i].pos);
        if ( v.mag() < min){
          min = v.mag() ;
          on_mouse = obj.part[i] ;
        }
      }
    }
  }
}

void keyPressed(){
  // lock or unlock the selected particle
  
  if (keyCode == 10){ // Enter
    println("Save pictures");
    save("image/img"+hour()+":"+minute()+":"+second()+".png");
  } else if (on_mouse != null){
    on_mouse.can_move = !on_mouse.can_move ;
  }
}
