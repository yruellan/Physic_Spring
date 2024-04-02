Object Obj_from_square(int n, int m){
  
  int indexS = 0;
  Particle[] particule = new Particle[n*m];
  //Spring[] springs = new Spring[2*(s*s-s)+(s-1)*(s-1)*2];
  //Spring[] springs = new Spring[n*m-n-m+(n-1)*(m-1)*2];
  int nb_s = 4*n*m-3*n-3*m+2 ;
  println("nb_s",nb_s);
  Spring[] springs = new Spring[nb_s];
  
  for ( int i = 0 ; i<n ; i++){
    for ( int j = 0 ; j<m ; j++){
      particule[i*m+j] = new Particle(100+i*100,100+j*100);
      if ( i>0){ springs[indexS] = new Spring(particule[i*m+j],particule[(i-1)*m+j],100) ; indexS++ ;}
      if ( j>0){ springs[indexS] = new Spring(particule[i*m+j],particule[i*m+(j-1)],100) ; indexS++ ;}
      if ( j>0 && i>0){ springs[indexS] = new Spring(particule[i*m+j],particule[(i-1)*m+(j-1)],140) ; indexS++ ;}
      if ( i>0 && j<m-1){ springs[indexS] = new Spring(particule[i*m+j],particule[(i-1)*m+(j+1)],140) ; indexS++ ;}
    }
  }
  println(indexS,springs.length,n,m);
  
  return new Object(particule,springs);
  
};
