

#1. Fonctions pour le data frame des observations

# A. Vérifier que la colonne des noms scientifiques ne contient pas de valeurs nulles et que les valeurs sont toutes de type texte
verifier_nulle_NA_texte <- function(colonne) {
  # Vecteur pour stocker les indices des valeurs non valides
  erreurs <- c()
  
  # Boucle pour parcourir chaque élément de la colonne
  for (i in 1:length(colonne)) {
    # Si la valeur est NA ou NULL ou n'est pas une chaîne de caractères
    if (is.null(colonne[i]) || is.na(colonne[i]) || !is.character(colonne[i])) {
      # Ajouter l'indice de l'élément problématique dans le vecteur 'erreurs'
      erreurs <- c(erreurs, i)
    }
  }
  # Si des erreurs sont trouvées, afficher les indices des valeurs incorrectes
  if (length(erreurs) > 0) {
    print("Certaines valeurs sont incorrectes :")
    print(erreurs)
  } else {
    print("Toutes les valeurs sont correctes.")
  }
  
  # Retourner la colonne sans modification
  return(colonne)
}





















