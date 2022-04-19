/*********************************************************************************************/
/*      RECTANGLE                         ****************************************************/
/*********************************************************************************************/
void dessiner_un_rectangle(int[] knob, int mode_ecriture)                              /*    */
{                                                                                      /*    */   
      int x = knob[13] + knob[14]*2 + knob[15]*4 + knob[16]*8;                         /*    */
      int y = height - (knob[29] + knob[30]*2 + knob[31]*4 + knob[32]*8);              /*    */
      int l = knob[17] + knob[18]*2 + knob[19]*4 + knob[20]*8;                         /*    */
      int h = knob[33] + knob[34]*2 + knob[35]*4 + knob[36]*8;                         /*    */
  switch(mode_ecriture)                                                                /*    */
    {                                                                                  /*    */
      case 0:            /* Permanent */                                               /*    */
        couche_principale.rect(x,y,l,h);                                               /*    */
        break;                                                                         /*    */
      case 1:                                                                          /*    */
        couche_temporaire.clear();                                                     /*    */
        couche_temporaire.rect(x,y,l,h); /* Temporaire */                              /*    */
        break;                                                                         /*    */
      case 2:                                                                          /*    */
        couche_semi_temporaire.rect(x,y,l,h); /* Temporaire */                         /*    */
        break;                                                                         /*    */
      default:                                                                         /*    */
        break;                                                                         /*    */
    }                                                                                  /*    */
}                                                                                      /*    */
/************************************************************************************/ /*    */
/*                                                                                           */
/*********************************************************************************************/


/*********************************************************************************************/
/*      CARRE                             ****************************************************/
/*********************************************************************************************/
void dessiner_un_carre(int[] knob, int mode_ecriture)
{
  int x = knob[13] + knob[14]*2 + knob[15]*4 + knob[16]*8;
  int y = height - (knob[29] + knob[30]*2 + knob[31]*4 + knob[32]*8);
  int t = knob[17] + knob[18]*2 + knob[19]*4 + knob[20]*8;
  switch(mode_ecriture)
    {
      case 0:               /* Direct     */ 
        couche_principale.square(x,y,t);
        break;
      case 1:               /* Temporaire */
        couche_temporaire.clear();  
        couche_temporaire.square(x,y,t);
        break;
      case 2:               /* Temporaire */
        couche_semi_temporaire.square(x,y,t);
        break;
      default:            
        break;
    }
}
