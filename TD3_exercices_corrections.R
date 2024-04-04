
# TD3

# Objectifs
# - Importer un fichier excel
# - Notion du type factor
# - Opération d'agrégation sur une dataframe
# - Découper un vecteur en tranche

# Exercice 1 - Importer les données

# Chargement du package nécessaire pour lire les fichiers Excel
library(readxl)

# Importation du jeu de données pokemon.xlsx
pokemon <- readxl::read_excel(path = "pokemon.xlsx", sheet = "pokemon")

# Affichage des dimensions du dataframe importé
print(dim(pokemon))

# Exercice 2 - Création de colonne

# Transformation en facteurs
pokemon$generation <- as.factor(pokemon$generation)
pokemon$is_legendary <- as.factor(pokemon$is_legendary)
pokemon$type <- as.factor(pokemon$type)

# Création de la colonne attack_group
median_attack <- median(pokemon$attack, na.rm = TRUE)
pokemon$attack_group <- ifelse(pokemon$attack >= median_attack, "attack+", "attack-")
pokemon$attack_group <- as.factor(pokemon$attack_group)

# Création de la colonne water_fire
pokemon$water_fire <- ifelse(pokemon$type %in% c("Water", "Fire"), "Yes", "No")
pokemon$water_fire <- as.factor(pokemon$water_fire)

# Création de la colonne best
q3_attack <- quantile(pokemon$attack, 0.75, na.rm = TRUE)
q3_defense <- quantile(pokemon$defense, 0.75, na.rm = TRUE)
q3_speed <- quantile(pokemon$speed, 0.75, na.rm = TRUE)
pokemon$best <- with(pokemon, ifelse(attack > q3_attack & defense > q3_defense & speed > q3_speed, "Yes", "No"))
pokemon$best <- as.factor(pokemon$best)

# Exercice 3 - Agregation

# Moyenne d'attack par type
mean_attack_by_type <- aggregate(attack ~ type, data = pokemon, FUN = mean)
print(mean_attack_by_type)

# Mediane d'attack par generation et type
median_attack_by_gen_type <- aggregate(attack ~ generation + type, data = pokemon, FUN = median)
print(median_attack_by_gen_type)

# Effectif par type
count_by_type <- aggregate(pokedex_number ~ type, data = pokemon, FUN = length)
print(count_by_type)

# Moyenne et mediane de speed pour chaque generation et type
speed_stats_by_gen_type <- aggregate(speed ~ generation + type, data = pokemon, FUN = function(x) c(mean = mean(x), median = median(x)))
print(speed_stats_by_gen_type)
