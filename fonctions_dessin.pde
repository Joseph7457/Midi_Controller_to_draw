void definir_couleur(int[] knob)
{
  rouge_interne   = round(map(knob[77], 0, 127, 0, 255));
  bleu_interne    = round(map(knob[78], 0, 127, 0, 255));
  vert_interne    = round(map(knob[79], 0, 127, 0, 255));
  alpha_interne   = round(map(knob[80], 0, 127, 0, 255));
    couleur_interne = color(rouge_interne, bleu_interne, vert_interne, alpha_interne);

  rouge_contour = round(map(knob[81], 0, 127, 0, 255));
  bleu_contour  = round(map(knob[82], 0, 127, 0, 255));
  vert_contour  = round(map(knob[83], 0, 127, 0, 255));
  alpha_contour = round(map(knob[84], 0, 127, 0, 255));
    couleur_contour = color(rouge_contour, bleu_contour, vert_contour, alpha_contour);
}

void copier_la_couche(PGraphics couche_receptrice, PGraphics couche_emettrice )
{
  for (int x = 0; x<couche_emettrice.width; x++) 
  {
      for (int y = 0; y<couche_emettrice.width; y++) 
    {
        color c = get(x, y);
        couche_receptrice.set(x, y, c);
    }
  }
}
