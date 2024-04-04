
# TD4

# Objectifs
# - Créer des graphiques
# - Personnaliser des graphiques
# - Créer des cartes

# Exercice 1 - Importer les données

# Importation du jeu de données velov.csv
velov <- read.csv("velov.csv", header = TRUE, sep = ";", dec = ",")

# Conversion de certaines colonnes en facteurs
velov$status <- as.factor(velov$status)
velov$CodePostal <- as.factor(velov$CodePostal)

# Création de la colonne bornes pour identifier les stations avec bornes HS
velov$bornes <- ifelse(velov$capacity != (velov$bikes + velov$stands), "KO", "OK")
print(table(velov$bornes))

# Exercice 2 - L'histogramme

# Création d'un histogramme pour la colonne capacity
hist(velov$capacity, main = "Histogramme des capacités des stations Velo'v", col = "red", breaks = 6)
abline(h = 100, col = "blue", lty = 2)

# Ajout de la densité
hist(velov$capacity, probability = TRUE, main = "Histogramme des capacités des stations Velo'v avec densité", col = "red")
lines(density(velov$capacity), col = "blue", lwd = 2)

# Exercice 3 - Le boxplot

# Création d'un boxplot pour la colonne capacity
boxplot(velov$capacity, main = "Boxplot des capacités des stations Velo'v", horizontal = TRUE, outline = FALSE)
points(x = mean(velov$capacity), y = 1, col = "red", pch = 15, cex = 2)

# Exercice 4 - Le diagramme

# Création d'un diagramme en barres pour les stations bonus
effectif_bonus <- table(velov$bonus)
barplot(effectif_bonus, main = "Répartition des stations bonus", col = palette(), las = 2)

# Création d'un diagramme circulaire pour les stations bonus
pie(effectif_bonus, main = "Répartition des stations bonus", col = c("yellow", "green"))

# Exercice 5 - Nuage de points

# Création d'un nuage de points pour stands vs capacity
plot(velov$stands, velov$capacity, main = "Place disponible vs Capacité", col = velov$bornes, pch = 19)
legend("topright", legend = levels(velov$bornes), fill = c("red", "blue"))

# Exercice 6 - Cartographie (spoil sur le SD2)

# Utilisation de la librairie leaflet pour créer une carte
library(leaflet)
leaflet(velov) %>%
  addTiles() %>%
  addMarkers(~position_longitude, ~position_latitude, popup = ~paste(name, address))
