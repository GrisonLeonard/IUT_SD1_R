
# TD2

# Objectifs
# - Importer un dataframe
# - Sélection et filtre sur un dataframe
# - Trier un dataframe

# Exercice 1 - Importer des données

# Affichage du répertoire courant
getwd()

# Changement du répertoire de travail (à adapter selon votre environnement)
# setwd("/chemin/vers/le/dossier/dataset")

# Importation des datasets
bodies_karts <- read.csv(file = "bodies_karts.csv", header = TRUE, sep = ";", dec = ",")
tires <- read.csv(file = "tires.csv", header = TRUE, sep = "	", dec = ",")
gliders <- read.csv(file = "gliders.csv", header = TRUE, sep = "|", dec = ".")
drivers <- read.csv(file = "drivers.csv", header = TRUE, sep = ";", dec = ",")

# Affichage des dimensions de chaque dataframe
dim(bodies_karts)
dim(tires)
dim(gliders)
dim(drivers)

# Exercice 2 - Statistique

# Résumé des données pour chaque dataset
summary(bodies_karts)
summary(tires)
summary(gliders)
summary(drivers)

# Nuage de points pour Weight et Acceleration chez les drivers
plot(drivers$Weight, drivers$Acceleration, main = "Poids vs. Accélération chez les drivers")

# Calcul du coefficient de corrélation
correlation <- cor(drivers$Weight, drivers$Acceleration)
print(correlation)

# Exercice 3 - Manipulation de data frame

# Sélection de colonnes et tri
resultat <- drivers[order(drivers$Acceleration, decreasing = TRUE), c("Driver", "Acceleration")]
print(resultat)

# Création d'un subset avec les meilleurs en accélération
topDriver <- subset(drivers, Acceleration == max(Acceleration), select = c("Driver", "Acceleration"))
print(topDriver)

# Exercice 4 - GOAT

# Identification des meilleurs composants pour l'Accélération
topGlider <- subset(gliders, Acceleration == max(Acceleration), select = c("Glider", "Acceleration"))
topTires <- subset(tires, Acceleration == max(Acceleration), select = c("Tire", "Acceleration"))
topBody <- subset(bodies_karts, Acceleration == max(Acceleration), select = c("Body", "Acceleration"))

print(topGlider)
print(topTires)
print(topBody)
