# Boucle pour remplir la colonne TSN avec la valeur ITIS
df_taxonomie$TSN <- NA  # Initialiser une colonne vide pour stocker les valeurs TSN

for (i in 1:length(df_taxonomie$observed_scientific_name)) {
  df_taxonomie$TSN[i] <- obtenir_itis(df_taxonomie$observed_scientific_name[i]) #Utiliser la fonction pour obtenir la valeur et la stocker
}


#2. Fonction pour ajouter la colonne des valeurs de ITIS dans taxonomie.csv
obtenir_itis <- function(nom_scientifique) {
  tsn <- tryCatch({ #Gérer l'erreur au cas où la fonction get_tsn ne fonctionne pas correctement
    get_tsn(nom_scientifique) # Utilisation de la fonction get_tsn de taxize pour obtenir l'ITIS
  }, error = function(e) {
    return(NA) # Si une erreur survient (nom non trouvé), retourner NA
  })
  return(tsn)
}

