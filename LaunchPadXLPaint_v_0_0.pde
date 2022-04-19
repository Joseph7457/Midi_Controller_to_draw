/*           Conçu pour un "Novation LauchPad XL"           */

import themidibus.*;

MidiBus myBus;

int[] knob = new int[256];

/********************************************/
/*           Le type de dessin              */
int mode_dessin = 0; /* Le mode de dessin   */
int CARRE       = 0; /* Les modes possibles */
int RECTANGLE   = 1; /* .......etc......... */
int CERCLE      = 2; /* .......etc......... */
int ELLIPSE     = 3; /* .......etc......... */
int LIGNE       = 4; /* .......etc......... */
/*****************************************************/
/*               Le type d'écriture                  */
int mode_ecriture   = 0; /* Le mode de dessin        */
int DIRECT          = 0; /* couche principale        */
int VALIDATION_A    = 1; /* couche temporaire        */
int VALIDATION_B    = 2; /* couche semi-temporaire   */
/***********************************************************************/
/*               Gestion de la couleur                                 */
color couleur_interne = color(0,0,0,255); /* Couleur de remplissage    */
int   rouge_interne   = 255             ; /* Quantité de rouge [0,225] */ 
int   vert_interne    = 255             ; /* Quantité de vert  [0,225] */ 
int   bleu_interne    = 255             ; /* Quantité de bleu  [0,225] */ 
int   alpha_interne   = 254             ; /* Transparence      [0,225] */ 
/***********************************************************************/
color couleur_contour = color(0,0,0,255); /* Couleur du trait          */
int   rouge_contour   = 0               ; /* Quantité de rouge [0,225] */              
int   vert_contour    = 0               ; /* Quantité de bleu  [0,225] */
int   bleu_contour    = 0               ; /* Quantité de jaune [0,225] */
int   alpha_contour   = 254             ; /* Transparence      [0,225] */ 
/************************************************************************/
int   epaisseur       = 1               ; /* Epaisseur du trait         */
/************************************************************************/
/*              Les 3 couches superposées                               */
PGraphics couche_principale     ;  /* Ne s'efface jamais                */
PGraphics couche_temporaire     ;  /* Ne garde que la dernière position */
PGraphics couche_semi_temporaire;  /* Ne s'efface qu'après validation   */
/************************************************************************/
/*                                                                      */
/*                     I  H  M                                          */
/*                                                                      */
/************************************************************************/

Bouton[] GUI    = new Bouton[5];  
int nbre_bouton = 5;

void setup()
{
  size(800,800);
  
  couche_principale      = createGraphics(width, height);
  couche_temporaire      = createGraphics(width, height);
  couche_semi_temporaire = createGraphics(width, height);
  
  MidiBus.list();
  myBus = new MidiBus(this, 1, 2);
  if(myBus == null)
      exit();
  
  initialiser_knob(knob);
  mode_dessin = 1;
  
  for (int i = 0; i < nbre_bouton; i++)
  {
    GUI[i] = new Bouton ( 60 + 80*i, 720, i);
  }
}

void draw()
{
definir_couleur(knob);
fill(couleur_interne);
stroke(couleur_contour);
strokeWeight(epaisseur);
dessiner(knob, mode_dessin, mode_ecriture);
}

void controllerChange(int channel, int number, int value)
{
  knob[number]  = value;
  afficher_knob(knob, number, number);
}

void afficher_controleur(int channel, int number, int value)
{
println("Chaîne: "+ str(channel));
println("Numéro: "+ str(number));
println("Valeur: "+ str(value));
println(" ");
}

void initialiser_knob(int[] knob)
{
  for (int i = 0; i<256; i++)
  {
    knob[i] = 0;
  }
}

void afficher_knob(int[] knob, int depart, int arrivee)
{
  for (int i = depart; i <= arrivee; i++)
  {
    println("Le knob " + str(i) + " est égal à " + str(knob[i]));
  }
}


void dessiner(int[] knob, int mode_dessin, int mode_ecriture)
{
  switch(mode_dessin) 
  {
    case 0:
      dessiner_un_carre(knob, mode_ecriture);
      break;
    case 1:                     
      dessiner_un_rectangle(knob, mode_ecriture);
      break;
    default:            
      break;
   }
}
