library(RSQLite) #Charger la librarie

# Créer la connexion vers la base de données
ma_bdd <- dbConnect(RSQLite::SQLite(), "base_observations.sqlite")



# Créer la table de taxonomie
creer_taxonomie <- "
CREATE TABLE taxonomie (
  observed_scientific_name TEXT PRIMARY KEY,
  valid_scientific_name VARCHAR(100) NOT NULL,
  rank VARCHAR(100) NOT NULL,
  vernacular_fr VARCHAR(100),
  kingdom VARCHAR(100) NOT NULL,
  phylum VARCHAR(100) NOT NULL,
  class VARCHAR(100) NOT NULL,
  \"order\" VARCHAR(100) NOT NULL,  -- Il faut entourer le mot 'order' 
  family VARCHAR(100) NOT NULL,
  genus VARCHAR(100) NOT NULL,
  species VARCHAR(100)
);"
dbSendQuery(ma_bdd, creer_taxonomie)


# Créer la table des observations
creer_observations <- "
CREATE TABLE observations (
  observed_scientific_name TEXT NOT NULL, 
  year_obs INTEGER,
  day_obs INTEGER,
  time_obs VARCHAR(100),
  dwc_event_date VARCHAR(100),
  obs_variable VARCHAR(100) NOT NULL,
  obs_unit VARCHAR(100),
  obs_value REAL,
  lat REAL,
  lon REAL,
  original_source VARCHAR(100),
  creator VARCHAR(100),
  title VARCHAR(100),
  publisher VARCHAR(100),
  intellectual_rights VARCHAR(100),
  license VARCHAR(100),
  owner VARCHAR(100),
  FOREIGN KEY (observed_scientific_name) REFERENCES taxonomie(observed_scientific_name)
);"
dbSendQuery(ma_bdd, creer_observations)



#Se déconnecter de la base de données
dbDisconnect(ma_bdd)
