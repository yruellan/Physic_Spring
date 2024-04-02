class Particle {
  PVector pos ;
  PVector spe ;
  PVector acc ;
  int col = 255 ;
  boolean can_move = true ;
  
  Particle (int x, int y){
    pos = new PVector(x,y);
    spe = new PVector(0,0);
    acc = new PVector(0,0);
  }
  
  void show(){
    noStroke();
    if (can_move){fill(col);} else {fill(128);}
    circle(pos.x,pos.y,20);
    //stroke(0,0,255);
    
    //line(pos.x,pos.y,pos.x+10*spe.x,pos.y+10*spe.y);
  }
  
  void update(){
    if ( can_move ){
    int n = 10;
    float dt = 0.1 ;
    for ( int i = 0; i < n ; i++){
      //acc.limit(10*dt);
      spe.add(acc.mult(dt));
      wall();
      pos.add(spe.copy().mult(dt));
    }
    acc = new PVector(0,0);
    spe.mult(1.0-friction);
    //spe.limit(10);
    }
  }
  
  void wall(){
    float r = 50 ;
    if ( pos.x < r && spe.x < 0 ){spe.x *= -1 ;}
    if ( pos.x > width-r && spe.x > 0 ){spe.x *= -1 ;}
    if ( pos.y < r && spe.y < 0 ){spe.y *= -1 ;}
    if ( pos.y > height-r & spe.y > 0 ){spe.y *= -1 ;}
  }
}
