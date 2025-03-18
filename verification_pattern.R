# C. Fonction pour vérifier si les données d'une colonne sont au format "H:mm:ss AM/PM" et si elles ne le sont pas, qu'elles ont des valeurs de 00:00:00 ou ont des données vides, mettre des NA
verifier_format_horaire <- function(colonne) {
  # Le pattern pour vérifier le format "H:mm:ss AM/PM"
  pattern <- "^([1-9]|1[0-2]):[0-5][0-9]:[0-5][0-9] (AM|PM)$"
  
  # Vérifier que chaque valeur respecte le format
  bon_format <- grepl(pattern, colonne)
  
  # Vérifier si toutes les valeurs respectent le format
  if (all(bon_format)) {
    print("Toutes les valeurs respectent le format.")
  } else {
    colonne[!bon_format] <- NA
  }
}
