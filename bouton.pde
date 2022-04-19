class Bouton { 
  
  int   type;
  int[] p   = {0,0};
  int[] d = {60,60};
  
  Bouton (int x, int y, int type_) 
  {  
    type        = type_; 
    p[0] = x;
    p[1] = y;
    afficher();
  } 
  
  void afficher() 
  {
    pushMatrix();
    fill(255); stroke(0);
 
    switch(type)
    {
      case 0:                                          /* Valider   */
        
        rectMode(CORNER);
        rect(p[0],p[1],d[0],d[1]);
        textSize(15);
        fill(0);
        textAlign(CENTER, CENTER);
        text("OK",p[0]+d[0]/2,p[1]+d[1]/2); 
        break;
        
      case 1:                                          /* Carré     */
        
        rectMode(CORNER);
        rect(p[0],p[1],d[0],d[1]);
        rectMode(CENTER);
        square(p[0]+d[0]/2,p[1]+d[1]/2, 30); 
        break;
        
      case 2:                                          /* Rectangle */   
      
        rectMode(CORNER);
        rect(p[0],p[1],d[0],d[1]);
        rectMode(CENTER);
        rect(p[0]+d[0]/2,p[1]+d[1]/2, 40, 30); 
        break;
        
      case 3:                                          /* Cercle    */
        
        rectMode(CORNER);
        rect(p[0],p[1],d[0],d[1]);
        circle(p[0]+d[0]/2,p[1]+d[1]/2, 30); 
        break;
        
      case 4:                                          /* Ellipse   */
        
        rectMode(CORNER);
        rect(p[0],p[1],d[0],d[1]);
        ellipse(p[0]+d[0]/2,p[1]+d[1]/2, 40, 30); 
        break;
      
    }
    popMatrix();
  } 
 
  boolean est_dessus(int x, int y)
  {
    if ( x > p[0] && x < p[0]+d[0] &&
         y > p[1] && y < p[1]+d[1]    )
         return true;
    return false;
  }
} 
