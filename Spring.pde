class Spring{
  Particle A ;
  Particle B ;
  float len ;
  float strenth ;
  
  Spring (Particle P1,Particle P2, float k){
    A = P1 ;
    B = P2 ;
    len = k ;
    //strenth = s ;
  }
  
  void show(){
    float d = A.pos.copy().sub(B.pos).mag() - len ;
    if ( d > 10  ){ stroke(255,0,0);}
    else if ( d < -10  ){ stroke(0,0,255);}
    else { stroke(126);}
    strokeWeight(5);
    line(A.pos.x,A.pos.y,B.pos.x,B.pos.y);
  }
  
  void apply(){
    PVector v = A.pos.copy().sub(B.pos);
    float d = v.mag()-len;
    
    //stroke(0,255,0);
    //line(A.pos.x,A.pos.y,A.pos.x+v.x,A.pos.y+v.y);
    
    if (v.mag() < 5){
      A.acc.sub(new PVector(5,5));
      B.acc.add(new PVector(5,5));
    }
    
    if ( d > 10 || d < 10 ){
      v.setMag(d/10);
      A.acc.sub(v);
      B.acc.add(v);
    }
  }
}
