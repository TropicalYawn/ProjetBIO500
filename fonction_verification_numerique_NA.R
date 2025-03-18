#B. Fonction pour vérifier que toutes les valeurs sont numériques, sinon les remplacer par NA
remplacer_non_numeriques_par_NA <- function(colonne) {
  # Essayer de convertir chaque valeur en numérique
  colonne <- as.numeric(as.character(colonne))
  
  # Retourner la colonne avec les valeurs non numériques remplacées par NA
  return(colonne)
}