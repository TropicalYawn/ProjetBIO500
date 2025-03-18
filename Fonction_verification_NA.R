#Fonction qui remplace les cases vides par des NA
remplacer_cases_vides_par_NA <- function(colonne) {
  # Remplacer les cases vides ("" ou NA) par NA
  colonne[colonne == "" | is.na(colonne)] <- NA
  return(colonne)
}