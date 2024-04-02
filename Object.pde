class Object{
  Particle[] part ;
  Spring[] spring ;
  
  Object ( Particle[] p, Spring[] s){
    part = p ;
    spring = s ;
  }
  Object ( int i, int j){
    part = new Particle[i] ;
    spring = new Spring[j] ;
  }
  
  void add(Particle p){
    for ( int i = 0 ; i<part.length ; i++){
      if ( part[i] == null){
        part[i] = p ;
        break ;
      }
    }
  }
  
  void add(Spring s){
    for ( int i = 0 ; i<spring.length ; i++){
      if ( spring[i] == null){
        spring[i] = s ;
        break ;
      }
    }
  }
  
  void show(){
    for ( Spring s : spring ){ s.show();}
    for ( Particle p : part ){ p.show();}
  }
  
  void update(){
    collision();
    for ( Particle p : part ){ p.update();}
    for ( Spring s : spring ){ s.update();}
  }
  
  void apply_force( PVector f){
    for ( Particle p : part ){ p.acc.add(f);}
  }
  
  void collision(){
    // calculate collision between particles
    for ( int i = 0 ; i < part.length ; i++){
      for ( int j = i+1 ; j < part.length ; j++){
        if ( part[i].pos.x - part[j].pos.x < 20 && part[i].pos.x - part[j].pos.x > -20
          && part[i].pos.y - part[j].pos.y < 20 && part[i].pos.y - part[j].pos.y > -20
         ){
            PVector v = part[j].pos.copy().sub(part[i].pos);
            if ( v.mag()<20){
              v.setMag((20-v.mag())/2);
              part[i].pos.sub(v);
              part[j].pos.add(v);
            }
        }
      }
    }
  }
  
}
